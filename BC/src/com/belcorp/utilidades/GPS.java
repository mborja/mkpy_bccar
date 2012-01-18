package com.belcorp.utilidades;

import javax.microedition.location.Location;
import javax.microedition.location.LocationException;  
import javax.microedition.location.LocationListener;  
import javax.microedition.location.LocationProvider;  
import javax.microedition.location.QualifiedCoordinates;

    /** 
     * 
     * @author Jorge G�lvez F. 
     * 04.10.2011
     */ 

public class GPS extends Thread {  
      
    private double latitude;  
    private double longitude;  
    private String satCountStr;  
    private float accuracy;  
    private double heading;  
    private double altitude;  
    private double speed;  
  
    private int interval = 1; // Tiempo en segundos para buscar un nuevo dato del GPS  
  
    /** 
     * This will start the GPS 
     */  
    public GPS() 
    {  
    	latitude  = 0.0;
    	longitude = 0.0;
    	
        // Iniciar la captura de datos del GPS  
        if (currentLocation()) {  
            // Captura de datos de prueba!  
        }  
    }  
  
    private boolean currentLocation() {  
        boolean retval = true;  
        try {  
            LocationProvider lp = LocationProvider.getInstance(null);  
            if (lp != null) {  
                lp.setLocationListener(new LocationListenerImpl(), interval, 1, 1);  
            } else {  
                // GPS no es soportado!  
                // Aqu� se podr�a usar UiApplication.getUiApplication() e instanciar una "Dialog box" informando que no hay GPS  
                retval = false;  
            }  
        } catch (LocationException e) {  
            System.out.println("Error: " + e.toString());  
        }  
  
        return retval;  
    }  
  
    private class LocationListenerImpl implements LocationListener {  
        public void locationUpdated(LocationProvider provider, Location location) {  
            if (location.isValid()) {  
                heading = location.getCourse();  
                longitude = location.getQualifiedCoordinates().getLongitude();  
                latitude = location.getQualifiedCoordinates().getLatitude();  
                altitude = location.getQualifiedCoordinates().getAltitude();  
                speed = location.getSpeed();  
  
                // N�mero de sat�lites  
                String NMEA_MIME = "application/X-jsr179-location-nmea";  
                satCountStr = location.getExtraInfo("satellites");  
                if (satCountStr == null) {  
                    satCountStr = location.getExtraInfo(NMEA_MIME);  
                }  
  
                // Precisi�n de las coordenadas del GPS  
                QualifiedCoordinates qc = location.getQualifiedCoordinates();  
                accuracy = qc.getHorizontalAccuracy();  
            }  
        }  
  
        public void providerStateChanged(LocationProvider provider, int newState) {  
        
        }  
    }  
  
    /** 
     * Entrega la direcci�n del equipo en grados en relaci�n al norte magn�tico. 
     * El valor se encuentra en el rango de (0.0,360.0) grados. 
     * 
     * @return double 
     */  
    public double getHeading() {  
        return heading;  
    }  
  
    /** 
     * Entrega la altitud de la coordenada. 
     * La altitud est� definida como la altura media sobre la referencia elipsoidal de la WGS84. 
     * 0.0 significa que la locaci�n se encuentra al nivel de la superficie de la elipsoide, valores negativos significan que 
     * la locaci�n se encuentra debajo de la superficie de la elipsoide, Float.NaN significa que no est� disponible el valor de la altitud.
     * 
     * @return double 
     */  
    public double getAltitude() {  
        return altitude;  
    }  
  
    /** 
     * Entrega el valor de sat�lites con los que est� conectado actualmente
     * 
     * @return String 
     */  
    public String getSatCount() {  
        return satCountStr;  
    }  
  
    /** 
     * Entrega la precisi�n de la medici�n actual de la locaci�n del GPS 
     * 
     * @return float 
     */  
    public float getAccuracy() {  
        return accuracy;  
    }  
  
    /** 
     * Entrega el valor de la latitud de la coordenada. 
     * 
     * Valores positivos significan latitud norte, valores negativos significan latitud sur (como Per�). 
     * 
     * @return double 
     */  
    public double getLatitude() {  
        return latitude;  
    }  
  
    /** 
     * Entrega el valor de la longitud de la coordenada. 
     * 
     * Valores positivos significan longitud este, valores negativos significan longitud oeste. 
     * 
     * @return double 
     */  
    public double getLongitude() {  
        return longitude;  
    }  
  
    /** 
     * Entrega la velocidad en metros por segundo (m/s) en el momento de la medici�n 
     * 
     * @return double 
     */  
    public double getSpeed() {  
        return speed;  
    }  
}  