package belcorp;

/*
 * Belcorp.java
 *
 * © <your company here>, 2003-2008
 * Confidential and proprietary.
 */


import net.rim.device.api.system.ApplicationDescriptor;
import net.rim.device.api.ui.UiApplication;
import com.belcorp.ui.Autenticar;

/**
 * @author Dan 
 */

public class Belcorp extends UiApplication{
    private static Belcorp myApp;
    private static String version; 
    
    public static void main(String[] args) {
        setVersion(ApplicationDescriptor.currentApplicationDescriptor().getVersion());
        myApp = new Belcorp();
        myApp.enterEventDispatcher();
    }

     Belcorp() {
        try {
            UiApplication.getUiApplication().invokeLater( new Runnable() {
            	public void run () {        	          
            		pushScreen(new Autenticar() );                            
                }
            });
        } catch(Exception e) {
        }
    }

        public static void setVersion(String version) {
                Belcorp.version = version;
        }

        public static String getVersion() {
                return version;
        }
} 



