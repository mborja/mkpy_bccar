package com.belcorp.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;

import net.rim.device.api.i18n.SimpleDateFormat;
import net.rim.device.api.system.PersistentObject;
import net.rim.device.api.system.PersistentStore;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.EditField;
import net.rim.device.api.xml.parsers.DocumentBuilder;
import net.rim.device.api.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.belcorp.entidades.bc.Mensaje;
import com.belcorp.entidades.bc.Nueva;
import com.belcorp.entidades.bc.RecordLocation;
import com.belcorp.entidades.bc.Seguimiento;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Fechas;
import com.belcorp.utilidades.Sistema;
import com.belcorp.utilidades.Error;
import com.makipuray.ui.mkpyLabelEditField;

public class NuevaDB {
    private static final String metodoWeb = "RegistroIncorporacion"; //BBWS7ObtenerMeta?PIN=&IMEI=&IMSI=&IDAPP=&FFVV=FS&CodigoPais=21&NombreUsuario=1215&GMT=&Rol=
    private static String URL, DATA;
    private static PersistentObject persist;
    private static final long IDSTORE = 0xc9f40a5522e93dcdL; // com.belcorp.entidades.nuevas
    private Vector objetos;
    private Usuario usuario;
    private String response="";
    private Error error;
    
    public NuevaDB() {
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

    public String getResponse() {
    	return response;
    }
    
    public void commitChanges() {
    	persist.commit();
    }
    
    public boolean saveObject(Nueva nu, Nueva original) {
    	if ( original == null ) {
        	objetos.addElement(nu);
    	} else {
    		objetos.setElementAt(nu, objetos.indexOf(original));
    	}
    	persist.commit();
    	return true;
    }

    private void setUrlSend(Nueva nu) {
        URL = Cadenas.URLBASE + "/" + metodoWeb;
        String strProv = "";
        if ( usuario.getIdPais().equals("7") ) { // PR
        	strProv = nu.getEstado();
        }
        if ( usuario.getIdPais().equals("8") ) { // DOM
        	strProv = nu.getProvincia();
        }
        
        DATA = "APPID=" + Sistema.getIdapp() + "&IDPAIS=" + Sistema.getIdPais() + "&PIN=" + Sistema.getPin()
			+ "&IMSI=" + Sistema.getImsi() + "&CODIGOZONA=" + usuario.getRegion() + usuario.getZona() 
			+ "&CAMPANHA=" + nu.getCampana() + "&FECHA=" + nu.getFechaRegistro() + "&TIPOGRABACION=" + nu.getModo()
			+ "&CODIGOTERRITORIO=" + nu.getTerritorio() 
			+ "&IDCONTACTO=" + nu.getTipoContacto()
			+ "&CODIGOCONSULTORARECOMIENDA=" + nu.getCodConsultoraRec() 
			+ "&APELLIDOPATERNO=" + nu.getApPaterno() + "&APELLIDOMATERNO=" + nu.getApMaterno() + "&PRIMERNOMBRE=" + nu.getNombres() + "&SEGUNDONOMBRE="  
			+ "&FECHANACIMIENTO=" + nu.getFechaNacimiento() + "&NRODOCUMENTO=" + nu.getNroDocumento() 
			+ "&TELEFONOCASA=" + nu.getTelefonoCasa() + "&TELEFONOCELULAR=" + nu.getTelefonoCelular()
			+ "&CORREOELECTRONICO=" + nu.getCorreo() 
			+ "&SOLICITANTE_DIRECCION=" + nu.getDireccion()
			+ "&SOLICITANTE_REFERENCIA=" + nu.getReferencia()
			+ "&SOLICITANTE_CODIGOPOSTAL=" + nu.getCodigoPostal()
			+ "&SOLICITANTE_DIVISIONPOLITICA1=" + nu.getPueblo()
			+ "&SOLICITANTE_DIVISIONPOLITICA2=" + strProv 
			+ "&IDESTADOCIVIL=" + nu.getEstadoCivil()
			+ "&IDNIVELEDUCATIVO=" + nu.getNivelEducativo()
			+ "&IDOTRAMARCA=" + nu.getOtrasMarcas()
			
			+ "&REFFAM_NOMBRES=" + nu.getRefFamiliarNombres()
			+ "&REFFAM_APELLIDOPATERNO="
			+ "&REFFAM_APELLIDOMATERNO="
			+ "&REFFAM_DIRECCION=" + nu.getRefFamiliarDireccion()
			+ "&REFFAM_TELEFONO=" + nu.getRefFamiliarTelefono()
			+ "&REFFAM_CELULAR=" + nu.getRefFamiliarCelular()
			+ "&REFFAM_IDVINCULO=" + nu.getRefFamiliarTipoVinculo()

			+ "&REFNOFAM_APELLIDOPATERNO="
			+ "&REFNOFAM_APELLIDOMATERNO="
			+ "&REFNOFAM_NOMBRES=" + nu.getRefNoFamiliarNombres()
			+ "&REFNOFAM_DIRECCION=" + nu.getRefNoFamiliarDireccion()
			+ "&REFNOFAM_TELEFONO=" + nu.getRefNoFamiliarTelefono()
			+ "&REFNOFAM_CELULAR=" + nu.getRefNoFamiliarCelular()
			+ "&REFNOFAM_IDVINCULO=" + nu.getRefNoFamiliarTipoVinculo()
			
			+ "&ENTREGA_DIRECCION=" + nu.getEntregaDireccion1()
			+ "&ENTREGA_DIVISIONPOLITICA=" + nu.getEntregaPueblo()
			+ "&ENTREGA_CODIGOPOSTAL=" + nu.getEntregaCodigoPostal()
			+ "&ENTREGA_REFERENCIA=" + nu.getEntregaReferencia()

			+ "&ADICIONAL_PROFESION=" + nu.getProfesion()
			+ "&ADICIONAL_LUGARTRABAJO=" + nu.getLugarTrabajo()
			+ "&ADICIONAL_TELEFONOTRABAJO=" + nu.getTelefonoTrabajo()
			+ "&ADICIONAL_HORAVISITA=" + nu.getHoraVisita()

			+ "&ADICIONAL_NROHIJOS=" + nu.getNroHijos()
			+ "&ADICIONAL_NROINFANTES=0" 
			+ "&ADICIONAL_NROESCOLARES=0" 
			+ "&ADICIONAL_NRONIVELSUPERIOR=0" 
			+ "&ADICIONAL_NROADULTOS=0" 

			+ "&RECORD_FECHAVISITA=" + nu.getRecord().getFechaVisita()
			+ "&RECORD_OBSERVACION=" + nu.getRecord().getObservacion()
			+ "&RECORD_PIN=" + Sistema.getPin()
			+ "&RECORD_IMSI=" + Sistema.getImsi()
			+ "&RECORD_LONGITUD=" + nu.getRecord().getLongitude()
			+ "&RECORD_LATITUD=" + nu.getRecord().getLatitude()
			+ "&RECORD_MARGEN=" + nu.getRecord().getMargen()
			+ "&RECORD_NROSATELITES=" + nu.getRecord().getSatelites();

        /*
		+ "&ADICIONAL_NROHIJOS=0" + nu.getNroHijos()
		+ "&ADICIONAL_NROINFANTES=" + nu.getNroInfantes()
		+ "&ADICIONAL_NROESCOLARES=" + nu.getNroEscolares()
		+ "&ADICIONAL_NRONIVELSUPERIOR=" + nu.getNroSuperior()
		+ "&ADICIONAL_NROADULTOS=" + nu.getNroAdultos()
        */
        //Dialog.inform(DATA);
    }
    
    public byte[] objectToBytes(Nueva nueva) {
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
    	sb.append(nueva.getCampana());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getFechaRegistro());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getModo());
    	sb.append(Cadenas.TOKEN);

    	sb.append(nueva.getTerritorio());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getTipoContacto());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getCodConsultoraRec());
    	sb.append(Cadenas.TOKEN);

    	sb.append(nueva.getApPaterno());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getApMaterno());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getNombres());
    	sb.append(Cadenas.TOKEN);
    	sb.append("");
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getFechaNacimiento());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getTipoDocumento());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getNroDocumento());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getTelefonoCasa());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getTelefonoCelular());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getCorreo());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getNoCorreo());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getDireccion());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getReferencia());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getCodigoPostal());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getPueblo());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getEstado());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getMunicipio());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getCuidad());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getProvincia());
    	sb.append(Cadenas.TOKEN);
    	
    	sb.append(nueva.getEstadoCivil());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getNivelEducativo());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getOtrasMarcas());
    	sb.append(Cadenas.TOKEN);

    	sb.append(nueva.getRefFamiliarNombres());
    	sb.append(Cadenas.TOKEN);
    	//REFFAM_APELLIDOPATERNO
    	sb.append("");
    	sb.append(Cadenas.TOKEN);
    	//REFFAM_APELLIDOMATERNO
    	sb.append("");
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefFamiliarDireccion());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefFamiliarTelefono());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefFamiliarCelular());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefFamiliarTipoVinculo());
    	sb.append(Cadenas.TOKEN);

    	sb.append(nueva.getRefNoFamiliarNombres());
    	sb.append(Cadenas.TOKEN);
    	//REFNOFAM_APELLIDOPATERNO
    	sb.append("");
    	sb.append(Cadenas.TOKEN);
    	//REFNOFAM_APELLIDOMATERNO
    	sb.append("");
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefNoFamiliarDireccion());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefNoFamiliarTelefono());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefNoFamiliarCelular());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRefNoFamiliarTipoVinculo());
    	sb.append(Cadenas.TOKEN);
    	
    	sb.append(nueva.getEntregaDireccion1());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getEntregaPueblo());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getEntregaCodigoPostal());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getEntregaDireccion2());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getEntregaReferencia());
    	sb.append(Cadenas.TOKEN);

    	//Estadisticas
    	sb.append(nueva.getLugarTrabajo());
    	sb.append(nueva.getHoraVisita());
    	sb.append(nueva.getNroHijos());
    	sb.append(nueva.getNroInfantes());
    	sb.append(nueva.getNroEscolares());
    	sb.append(nueva.getNroSuperior());
    	sb.append(nueva.getNroAdultos());
    	
    	//RECORD
    	sb.append(nueva.getRecord().getFechaVisita());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getObservacion());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getPIN());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getIMSI());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getLongitude());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getLatitude());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getMargen());
    	sb.append(Cadenas.TOKEN);
    	sb.append(nueva.getRecord().getSatelites());
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
    
    public boolean putRemote(Nueva nueva) {
        boolean resultado = false;
        HttpConnection httpConn = null;
        InputStream is = null;
        try {
        	String urlplus = URL + Cadenas.getBIS();
            httpConn = (HttpConnection) Connector.open(urlplus);
            setUrlSend(nueva);
            httpConn.setRequestMethod(HttpConnection.POST);
            httpConn.setRequestProperty("Host", Cadenas.HOST);
            httpConn.setRequestProperty("Connection", "close");
            httpConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            httpConn.setRequestProperty("Content-Length", "" + DATA.length());
            OutputStream os = httpConn.openOutputStream();
            os.write(DATA.getBytes("UTF-8"));
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
            resultado = false;
        } finally {
            try { is.close(); } catch(Exception e) { }
            is = null;
            try { httpConn.close(); } catch(Exception e) { }
            httpConn = null;
        	is=null;
        	httpConn=null;
        }
        return resultado;
    }
    
    public Vector getObjetos() {
        return objetos;
    }
    
    public Vector getSinEnviar() {
    	Vector resultado = new Vector();

    	int n = objetos.size();
    	for (int i = 0; i < n; i++) {
    		Nueva item = (Nueva) objetos.elementAt(i);
    		if ( item.getEnviado().equals("0") ) {
    			resultado.addElement(item);
    		}
    	}
    	return resultado;
    }

    public Vector getObjectBy(long fecha, String territorio, String nroDoc, String paterno, String materno, String nombres, int modo) {
    	int n;
    	String sFecha;
    	Vector resultado = new Vector();
    	boolean result = true;
    	n = objetos.size();
    	for (int i = 0; i < n; i++) {
    		result = true;
    		Nueva item = (Nueva) objetos.elementAt(i);
    		
    		Date date = new Date();
    		date.setTime(fecha);
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        	sFecha = sdf.format(date);
        	
    		if( fecha > 0 ) {
    			if ( Long.parseLong( item.getFechaRegistro().substring(0, 8) ) == Long.parseLong(sFecha) ) {
    				result = true;
    			} else {
    				result = false;
    			}
    		}
    		//TODO: buscar territorio por parte del texto
    		if( territorio.length() > 0 ) {
    			if ( item.getTerritorio().toUpperCase().indexOf(territorio.toUpperCase())>=0 ) {
    				result = result && true;
    			} else {
    				result = result && false;
    			}
    		}
    		if( nroDoc.length() > 0 ) {
    			if ( item.getNroDocumento().indexOf(nroDoc)>=0 ) {
    				result = result && true;
    			} else {
    				result = result && false;
    			}
    		}
    		if( paterno.length() > 0 ) {
    			if ( item.getApPaterno().startsWith(paterno)) { // .equals(paterno) ) {
    				result = result && true;
    			} else {
    				result = result && false;
    			}
    		}
    		if( materno.length() > 0 ) {
    			if ( item.getApMaterno().startsWith(materno)) {
    				result = result && true;
    			} else {
    				result = result && false;
    			}
    		}
    		if( nombres.length() > 0 ) {
    			if ( item.getNombres().startsWith(nombres)) {
    				result = result && true;
    			} else {
    				result = result && false;
    			}
    		}
    		if( modo > 0 ) {
    			if ( item.getModo().equals(String.valueOf(modo)) ) {
    				result = result && true;
    			} else {
    				result = result && false;
    			}
    		}
    		if ( result ) {
    			resultado.addElement(item);
    		}
    	}
    	return resultado;
    }

	public Error getError() {
		return error;
	}

	public void setError(Error error) {
		this.error = error;
	}

	
    
}
