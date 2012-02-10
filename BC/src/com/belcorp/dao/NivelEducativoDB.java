package com.belcorp.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.Vector;

import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.belcorp.entidades.bc.EstadoCivil;
import com.belcorp.entidades.bc.NivelEducativo;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Sistema;

import net.rim.device.api.system.PersistentObject;
import net.rim.device.api.system.PersistentStore;
import net.rim.device.api.xml.parsers.DocumentBuilder;
import net.rim.device.api.xml.parsers.DocumentBuilderFactory;

public class NivelEducativoDB {
    private static final String metodoWeb = "getNivelEducativo"; //BBWS7ObtenerMeta?PIN=&IMEI=&IMSI=&IDAPP=&FFVV=FS&CodigoPais=21&NombreUsuario=1215&GMT=&Rol=
    private static String URL, DATA;
    private static PersistentObject persist;
    private static final long IDSTORE = 0xcf9e60f6133b780bL; // com.belcorp.entidades.NivelEducativo
    private Vector objetos;
    private Usuario usuario;

    public NivelEducativoDB() {
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
    
    private void setUrl() {
        URL = Cadenas.URLBASE + "/" + metodoWeb;
        DATA = "PIN=" + Sistema.getPin() + "&IMSI=" + Sistema.getImsi() + "&APPID=" + Sistema.getIdapp() 
			+ "&IDPAIS=" + Sistema.getIdPais();
    }

    private boolean fillObjectos(NodeList node) throws Exception {
        int n = node.getLength();
        objetos = new Vector();
        for (int i = 1; i < n; i = i + 2) {
            Node contactNode = node.item(i);
            String registro = contactNode.getChildNodes().item(0).getNodeValue();
            String[] fields = Cadenas.splitSimple(registro, Cadenas.TOKEN);
            NivelEducativo item = new NivelEducativo();
            item.setId(fields[0]);
            item.setDescripcion(fields[1]);
            objetos.addElement(item);
        }
        persist.setContents(objetos);
        persist.commit();
        return true;
    }
    
    public boolean getRemote() {
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
    
    public int getIndexById(String id) {
    	NivelEducativo item = null;
        int i, n;
        n = objetos.size();
        for (i = 0; i < n; i++) {
        	item = (NivelEducativo) objetos.elementAt(i);
            if(id.equals(item.getId())){
                return i;
            }
        }
        return -1;
    }    
        
    public Vector getObjetos() {
        return objetos;
    }
}
