package com.belcorp.utilidades;

import belcorp.Belcorp;

import java.util.Timer;  
import java.util.TimerTask;  
import net.rim.device.api.ui.component.RichTextField;  
import net.rim.device.api.ui.container.MainScreen;  
  
public class GPSScreen extends MainScreen {  
    private GPS gps;  
    private static Timer timer = null;  
    private static RichTextField txtGPS = null;
    private static double lat = 0.0;  
    private static double lng = 0.0;
    private static boolean fMessure = true;
    
    public static double getLatitude(){ return lat;}
    public static double getLongitude(){ return lng;}
    public static void SetMessure(){ fMessure = true;}
    public static void StopMessure(){ fMessure = false;}
    public static void PrintMessage(String message){ txtGPS.setText(message); }
     
    public GPSScreen(){
    	fMessure = true;
    	lat = 0.0;
    	lng = 0.0;
        gps = new GPS();  
        timer = new Timer();  
        timer.schedule(new CheckGPS(), 100, 30000);  // revisa el GPS cada 30 segundos;  
  
        String textGPS = "";  
        txtGPS = new RichTextField(textGPS, RichTextField.NON_FOCUSABLE);  
  
        //add(txtGPS);  MBL : Muestra el texto de los datos del gps
  
    } 
    
    public static void CancelTimer()
    {
    	if(timer == null)
    		return;
    	timer.cancel();
    	timer = null;
    }
    
    public boolean onClose()  
    {  
    	if(timer != null)   // JGF: el timer sigue vivo
    	{
    		timer.cancel(); // JGF: apaga el timer  
    		timer = null;
    	}
        this.close();  
        return true;  
    }  
  
    public class CheckGPS extends TimerTask
    {         
    	public CheckGPS() { }  
  
        public void run() 
        { 
        	if(!fMessure)
        	{
        	//	txtGPS.setText("GPS inactivo!!!");
        		return;
        	}
        	
            lat = gps.getLatitude();  
            lng = gps.getLongitude();  
  
            if ((lat != 0.0 ) && (lng != 0.0)) 
            {  
                synchronized (Belcorp.getEventLock()) 
                {  
                    txtGPS.setText("GPS: (" + lat + ", " + lng + ") Sat: " + gps.getSatCount());  
                }             
            }  
            else  
            {  
                String thetxt = txtGPS.getText();  
                synchronized (Belcorp.getEventLock()) 
                {  
                    if(thetxt.length() > 10)  
                        if(thetxt.length() > 25)  
                            txtGPS.setText("Esperando GPS.");  
                        else  
                            txtGPS.setText(thetxt + ".");  
                    else  
                        txtGPS.setText("Esperando GPS.");  
                } 
                
            }  
        }  
    }  
}  