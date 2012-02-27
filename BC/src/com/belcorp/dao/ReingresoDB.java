package com.belcorp.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.Vector;

import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;

import net.rim.device.api.system.PersistentObject;
import net.rim.device.api.system.PersistentStore;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.xml.parsers.DocumentBuilder;
import net.rim.device.api.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.belcorp.entidades.bc.Mensaje;
import com.belcorp.entidades.bc.Nueva;
import com.belcorp.entidades.bc.Reingreso;
import com.belcorp.entidades.bc.Seguimiento;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Sistema;
import com.belcorp.utilidades.Error;

public class ReingresoDB {
    private static final String metodoWeb = "RegistroReingreso"; //BBWS7ObtenerMeta?PIN=&IMEI=&IMSI=&IDAPP=&FFVV=FS&CodigoPais=21&NombreUsuario=1215&GMT=&Rol=
    private static String URL, DATA;
    private static PersistentObject persist;
    private static final long IDSTORE = 0x3cb4aa65f8155dc2L; // com.belcorp.entidades.reingreso
    private Vector objetos;
    private Usuario usuario;
    private Error error;

    public ReingresoDB() {
    	UsuarioDB usuarios = new UsuarioDB();
    	usuario = usuarios.getUsuario();
    	usuarios = null;
        URL = Cadenas.URLBASE + "/" + metodoWeb;
        persist = PersistentStore.getPersistentObject( IDSTORE ); 
        try {
                objetos = (Vector) persist.getContents();
        } catch (Exception e) {
                objetos = null;
        }
        try {
            if ( objetos == null) {
                objetos = new Vector();
                persist.setContents(objetos);
                persist.commit();
            }
        } catch (Exception e) {
        }
    }
      
    public void commitChanges() {
    	persist.commit();
    }
    
    public boolean saveObject(Reingreso re) {
    	objetos.addElement(re);
    	persist.commit();
    	return true;
    }

    public Vector getSinEnviar() {
    	Vector resultado = new Vector();

    	int n = objetos.size();
    	for (int i = 0; i < n; i++) {
    		Reingreso item = (Reingreso) objetos.elementAt(i);
    		if ( item.getEnviado().equals("0") ) {
    			resultado.addElement(item);
    		}
    	}
    	return resultado;
    }
    
    private void setUrlSend(Reingreso re) {
        URL = Cadenas.URLBASE + "/" + metodoWeb;

        DATA = "APPID=" + Sistema.getIdapp() + "&IDPAIS=" + Sistema.getIdPais() + "&PIN=" + Sistema.getPin()
			+ "&IMSI=" + Sistema.getImsi() + "&CODIGOZONA=" + usuario.getRegion() + usuario.getZona() 
			+ "&CAMPANHA=" + re.getCampana() + "&FECHA=" + re.getFechaRegistro() 
			+ "&CODIGOCONSULTORA=" + re.getCodConsultora() 
			+ "&APELLIDOPATERNO=" + re.getApPaterno() + "&APELLIDOMATERNO=" + re.getApMaterno() + "&NOMBRES=" + re.getNombres()
			+ "&NRODOCUMENTO=" + re.getNroDocumento() 

			+ "&RECORD_FECHAVISITA=" + re.getRecord().getFechaVisita()
			+ "&RECORD_OBSERVACION=" + re.getRecord().getObservacion()
			+ "&RECORD_PIN=" + Sistema.getPin()
			+ "&RECORD_IMSI=" + Sistema.getImsi()
			+ "&RECORD_LONGITUD=" + re.getRecord().getLongitude()
			+ "&RECORD_LATITUD=" + re.getRecord().getLatitude()
			+ "&RECORD_MARGEN=" + re.getRecord().getMargen()
			+ "&RECORD_NROSATELITES=" + re.getRecord().getSatelites();
        
    }
    
    public byte[] objectToBytes(Reingreso re) throws Exception {
    	StringBuffer sb = new StringBuffer();

    	sb.append(Sistema.getIdapp());
    	sb.append(Cadenas.TOKEN);
    	sb.append(usuario.getIdPais());
    	sb.append(Cadenas.TOKEN);
    	sb.append(Sistema.getPin());
    	sb.append(Cadenas.TOKEN);
    	sb.append(Sistema.getImsi());
    	sb.append(Cadenas.TOKEN);
    	sb.append(usuario.getZona());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getCampana());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getFechaRegistro());
    	sb.append(Cadenas.TOKEN);
    	//TODO: tipo accion
    	sb.append("3");
    	sb.append(Cadenas.TOKEN);

    	sb.append(re.getCodConsultora());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getNombres());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getApPaterno());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getApMaterno());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getTipoDocumento());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getNroDocumento());
    	sb.append(Cadenas.TOKEN);

    	//RECORD
    	sb.append(re.getRecord().getFechaVisita());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getObservacion());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getPIN());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getIMSI());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getLongitude());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getLatitude());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getMargen());
    	sb.append(Cadenas.TOKEN);
    	sb.append(re.getRecord().getSatelites());
    	sb.append(Cadenas.TOKEN);

    	return sb.toString().getBytes();
    }

    private boolean decodeResponse(NodeList node) {
        Node contactNode = node.item(1);
        String registro = contactNode.getChildNodes().item(0).getNodeValue();
        String[] fields = Cadenas.splitSimple(registro, Cadenas.TOKEN);
        if ( fields.length > 0 ) {
        	if ( fields[0].trim().equals("1") ) {
        		return true;
        	} else {
        		error = new Error();
        		error.setIdError(Integer.parseInt(fields[1]));
        		error.setMensaje(fields[2]);
        	}
        }
        return false;
    }
    
    public boolean putRemote(Reingreso re) {
        boolean resultado = false;
        HttpConnection httpConn = null;
        InputStream is = null;
        try {
            httpConn = (HttpConnection) Connector.open(URL + Cadenas.getBIS());
            setUrlSend(re);
            httpConn.setRequestMethod(HttpConnection.POST);
            httpConn.setRequestProperty("Host", Cadenas.HOST);
            httpConn.setRequestProperty("Connection", "close");
            httpConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            httpConn.setRequestProperty("Content-Length", "" + DATA.length());
            OutputStream os = httpConn.openOutputStream();
            os.write(DATA.getBytes());
            int httpResponse = httpConn.getResponseCode();
            if ( httpResponse == HttpConnection.HTTP_OK ) {
                is = httpConn.openInputStream();
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document document = builder.parse( is );
                Element rootElement = document.getDocumentElement();
                rootElement.normalize();
                resultado = decodeResponse(rootElement.getChildNodes());
                is.close();
                is = null;
            } else {
                resultado = false;
            }
            httpConn.close();
            httpConn = null;
        } catch(Exception ex) {
            try { is.close(); } catch(Exception e) { }
            is = null;
            try { httpConn.close(); } catch(Exception e) { }
            httpConn = null;
            resultado = false;
        } finally {
        }
        return resultado;
    }
    
    public Vector getObjetos() {
        return objetos;
    }

	public Error getError() {
		return error;
	}

	public void setError(Error error) {
		this.error = error;
	}
    
}
