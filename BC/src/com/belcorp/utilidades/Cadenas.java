package com.belcorp.utilidades;

import java.util.Vector;

import net.rim.device.api.util.*;
import net.rim.device.api.system.DeviceInfo;

import com.belcorp.entidades.bc.IEntityDescripcion;
import com.belcorp.entidades.bc.Usuario;

public final class Cadenas {
    public static final String TOKEN = "|";
    public static final String HOST = "200.50.10.197"; //Producción
    public static final String URLBASE = "http://" + HOST + "/WebBelcorp/ws/wsGet.asmx";
    public static final String APTA = "1";
	private static String[] opciones = {"Incorporaciones SC", " Nuevas SC", " Mantenimiento SC", 
			"Gestión de consultoras", " Seguimientos", " Reingresos", 
			"Sincronización", " Envío y recepción"};

	
	public static String getOpcion(int index) {
		return opciones[index];
	}
	
	public static String getBIS() {
    	if ( DeviceInfo.isSimulator() ) {
    		return ";DeviceSide=false";
    	} else {
    		return ";DeviceSide=false;ConnectionSetup=delayed;UsePipe=true;ConnectionTimeout=120000;EncryptRequired=true;ConnectionType=mds-public";
    	}
	}
	
    public static String[] lsMenuOpciones(Usuario usuario){
    	String[] opc;
    	boolean a, b;
    	if ( usuario.getHabilitaA().equals("1") ) { // SI se debe mostrar "Seguimientos" 
    		a = true;
    	} else { // NO se debe mostrar "Seguimientos"
    		a = false;
    	}
    	if ( usuario.getHabilitaB().equals("1") ) { // SI se debe mostrar "Reingresos" 
    		b = true;
    	} else { // NO se debe mostrar "Reingresos"
    		b = false;
    	}
    	if ( a == true && b == true ) {
        	opc = new String[8];
        	opc[0] = opciones[0]; 
        	opc[1] = opciones[1]; 
        	opc[2] = opciones[2]; 
        	opc[3] = opciones[3]; 
        	opc[4] = opciones[4]; 
        	opc[5] = opciones[5]; 
        	opc[6] = opciones[6]; 
        	opc[7] = opciones[7]; 
    	} else if ( a == true && b == false ) {
        	opc = new String[7];
        	opc[0] = opciones[0]; 
        	opc[1] = opciones[1]; 
        	opc[2] = opciones[2]; 
        	opc[3] = opciones[3]; 
        	opc[4] = opciones[4]; 
        	//opc[5] = opciones[5]; 
        	opc[5] = opciones[6]; 
        	opc[6] = opciones[7]; 
    	} else if ( a == false && b == true ) {
        	opc = new String[7];
        	opc[0] = opciones[0]; 
        	opc[1] = opciones[1]; 
        	opc[2] = opciones[2]; 
        	opc[3] = opciones[3]; 
        	//opc[4] = opciones[4]; 
        	opc[4] = opciones[5]; 
        	opc[5] = opciones[6]; 
        	opc[6] = opciones[7]; 
    	} else if ( a == false && b == false ) {
        	opc = new String[5];
        	opc[0] = opciones[0]; 
        	opc[1] = opciones[1]; 
        	opc[2] = opciones[2]; 
        	//opc[3] = opciones[3]; 
        	//opc[4] = opciones[4]; 
        	//opc[4] = opciones[5]; 
        	opc[3] = opciones[6]; 
        	opc[4] = opciones[7]; 
    	} else {
        	opc = new String[5];
        	opc[0] = opciones[0]; 
        	opc[1] = opciones[1]; 
        	opc[2] = opciones[2]; 
        	//opc[3] = opciones[3]; 
        	//opc[4] = opciones[4]; 
        	//opc[4] = opciones[5]; 
        	opc[3] = opciones[6]; 
        	opc[4] = opciones[7]; 
    	}
    	return opc;
    }
	
    public static String[] getDescriptions(Vector list) {
    	String descriptionArray[] = null;        
    	descriptionArray = new String[list.size() + 1];
    	descriptionArray[0] = "..."; 
        for (int i = 0; i < list.size(); i++) {
        	IEntityDescripcion item = (IEntityDescripcion) list.elementAt(i);
        	descriptionArray[i + 1] = item.getDescripcion();
        }
        return descriptionArray;
    }
        
    public static String[] splitSimple(String strCadena, String strSeparador) {
        int indexOfEnd = strCadena.length();
        String[] strCampos = null;
        Vector lista = new Vector();
        while (indexOfEnd > 0) {
           indexOfEnd = strCadena.indexOf(strSeparador);
           if (indexOfEnd >= 0) {
              lista.addElement(strCadena.substring(0, indexOfEnd));
              indexOfEnd += strSeparador.length();
              strCadena = strCadena.substring(indexOfEnd);
           } else {
              String cadena = strCadena.substring(0);
              if (cadena.length() > 0) {
                 lista.addElement(cadena);
              }
           }
        }
        strCampos = new String[lista.size()];
        lista.copyInto(strCampos);
        lista = null;
        return strCampos;
     }
    
    public static boolean existenNumeros(String strCadena){
    	int longitud = strCadena.length();
    	boolean respuesta = false;
    	
        for( int i = 0; i < longitud; i++ ){
        	 if( CharacterUtilities.isDigit( strCadena.charAt( i ))) {
        		 respuesta = true;
        		 break;
        	 }
        }
    		
    	return respuesta;
    	
    }

}
