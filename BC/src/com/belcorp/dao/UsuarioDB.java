package com.belcorp.dao;

import java.io.InputStream;
import java.io.OutputStream;

import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Fechas;
import com.belcorp.utilidades.Sistema;

import net.rim.device.api.system.PersistentObject;
import net.rim.device.api.system.PersistentStore;
import net.rim.device.api.xml.parsers.DocumentBuilder;
import net.rim.device.api.xml.parsers.DocumentBuilderFactory;
import net.rim.device.api.ui.UiApplication;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.Status;

public class UsuarioDB {
    private static final String metodoWeb = "Validacion"; //BBWS7ObtenerMeta?PIN=&IMEI=&IMSI=&IDAPP=&FFVV=FS&CodigoPais=21&NombreUsuario=1215&GMT=&Rol=
    private static String URL, DATA;
    private static PersistentObject persist;
    private static final long IDSTORE = 0x1cffddff9d0c5dc6L; // com.belcorp.entidades.Usuario    
    private Usuario usuario;        
    private String codigo;

    public UsuarioDB() {
        //URL = Sistema.getJADProperty("urlBase") + metodoWeb; 
    	// TODO: completar con los parametros para el servicio web
        persist = PersistentStore.getPersistentObject( IDSTORE ); 
        try {
            usuario = (Usuario) persist.getContents();
        } catch (Exception e) {
            usuario = null;
        }
        try {
            if ( usuario == null) {
                //usuario = new Usuario();
                //persist.setContents(usuario);
                persist.commit();
            }
        } catch (Exception e) {
        }
    }

    private void setUrl() {
        URL = Cadenas.URLBASE + "/" + metodoWeb;
        DATA = "PIN=" + Sistema.getPin() + "&IMSI=" + Sistema.getImsi() + "&APPID=" + Sistema.getIdapp() 
			+ "&IDPAIS=" + Sistema.getIdPais() + "&ZONA=" + codigo;
    }
    
    private boolean actualizar() {
    	try {
            persist.setContents(usuario);
            persist.commit();
    		return true;
    	} catch(Exception e) {
    		return false;
    	}
    }
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
            this.codigo = codigo;
    }

    private boolean fillObjectos(NodeList node) throws Exception {
        Node contactNode = node.item(1);
        String registro = contactNode.getChildNodes().item(0).getNodeValue();
        //Dialog.inform(registro);
        String[] fields = Cadenas.splitSimple(registro, Cadenas.TOKEN);
        int index = 0;
        usuario = new Usuario();
        usuario.setNombres(fields[index++]);
        usuario.setAppaterno(fields[index++]);
        usuario.setApmaterno(fields[index++]);
        usuario.setRegion(fields[index++].trim());
        usuario.setZona(fields[index++].trim());
        usuario.setCorreo(fields[index++]);
        usuario.setIdTipoDoc(fields[index++]);
        usuario.setNrodoc(fields[index++]);
        usuario.setTelefono(fields[index++]);
        usuario.setCampana(fields[index++]);
        usuario.setFechaHoraServidor(fields[index++]);
        usuario.setFechaHoraRecarga(fields[index++]);
        usuario.setHabilitaA(fields[index++]);
        usuario.setHabilitaB(fields[index++]);
        usuario.setHabilitaC(fields[index++]);
        usuario.setHabilitaD(fields[index++]);
        usuario.setHabilitaE(fields[index++]);
        usuario.setUrl(fields[index++]);
        usuario.setVersion(fields[index++]);
        
        usuario.setIdPais(Sistema.getIdPais());
        usuario.setPin(Sistema.getPin());
        usuario.setImsi(Sistema.getImsi());

        persist.setContents(usuario);
        persist.commit();
        return true;
    }
    
    public boolean validar() {
        boolean resultado = false;
        HttpConnection httpConn = null;
        InputStream is = null;
        OutputStream os = null;
        try {
        	setUrl();
            httpConn = (HttpConnection) Connector.open(URL + Cadenas.getBIS());
            httpConn.setRequestMethod(HttpConnection.POST);
            httpConn.setRequestProperty("Host", Cadenas.HOST);
            httpConn.setRequestProperty("Connection", "close");
            httpConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            httpConn.setRequestProperty("Content-Length", "" + DATA.length());
            os = httpConn.openOutputStream();
            os.write(DATA.getBytes());
            os.flush();
            int responseCode = httpConn.getResponseCode();
            if ( responseCode == HttpConnection.HTTP_OK ) {
                is = httpConn.openInputStream();
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document document = builder.parse( is );
                Element rootElement = document.getDocumentElement();
                rootElement.normalize();
                if ( fillObjectos(rootElement.getChildNodes()) ) {
                    resultado = true;
                }
                is.close();
                is = null;
            } else {
                resultado = false;
            }
            httpConn.close();
            httpConn = null;
        } catch(Exception ex) {
            try { os.close(); } catch(Exception e) { }
            os = null;
            try { is.close(); } catch(Exception e) { }
            is = null;
            try { httpConn.close(); } catch(Exception e) { }
            httpConn = null;
            resultado = false;
        } finally {
        }
        return resultado;
    }
    
    public Usuario getUsuario() {
        return usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
        actualizar();
    }
    
    public void sincronizar() {
    	usuario.setSincronizado(false);
    	this.actualizar();
        EstadoCivilDB itemsEC = new EstadoCivilDB();   
        if(!itemsEC.getRemote())
            Dialog.alert("No se pudieron descargar los datos de estados civiles");
        itemsEC = null;
        NivelEducativoDB itemsNE = new NivelEducativoDB();   
        if(!itemsNE.getRemote())
            Dialog.alert("No se pudieron descargar los datos de los niveles eductivos");
        itemsNE = null;
        OtraMarcaDB itemsOM = new OtraMarcaDB();   
        if(!itemsOM.getRemote())
            Dialog.alert("No se pudieron descargar los datos de las otras marcas");
        itemsOM = null;
        TipoContactoDB itemsTC = new TipoContactoDB();   
        if(!itemsTC.getRemote())
            Dialog.alert("No se pudieron descargar los datos de los tipos de contacto");
        itemsTC = null;
//        TipoDocDB itemsTD = new TipoDocDB();   
//        if(!itemsTD.getRemote())
//            Dialog.alert("No se pudieron descargar los datos de tipo de documento");
//        itemsTD = null;
        TipoVinculoDB itemsTV = new TipoVinculoDB();   
        if(!itemsTV.getRemote())
            Dialog.alert("No se pudieron descargar los datos de tipo vinculo");
        itemsTV = null;
        UbigeoDB ubigeos = new UbigeoDB();   
        if(!ubigeos.getRemote())
            Dialog.alert("No se pudieron descargar los datos de ubicaciones");
        ubigeos = null;
        
    	usuario.setSincronizado(true);
    	usuario.setFechaHoraLocal(Fechas.dateToString("yyyyMMddHHmm"));
    	this.actualizar();
    }

    /**
     * Valida las caducidades de la fechas de sincronizacion
     * @return True si es que la fecha de resincronizacion debe ejecutarse
     */
	public boolean validaCaducidades() {
        String fSistema = Fechas.dateToString();
        if(Fechas.validarFechas(usuario.getFechaHoraRecarga(), fSistema)){
            ////this.sincronizar();
            //usuario.setFechaHoraRecarga(Fechas.dateToString("yyyyMMddHHmm"));
            usuario.setFechaHoraLocal(Fechas.dateToString("yyyyMMddHHmm"));
            return true;
        } else {
        	return false; //true;
        }
	}
    
}
