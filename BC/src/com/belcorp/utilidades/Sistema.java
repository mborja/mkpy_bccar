package com.belcorp.utilidades;

import net.rim.device.api.system.ApplicationDescriptor;
import net.rim.device.api.system.CodeModuleGroup;
import net.rim.device.api.system.CodeModuleGroupManager;
import net.rim.device.api.system.DeviceInfo;
import net.rim.device.api.system.GPRSInfo;
import net.rim.device.api.system.SIMCardException;
import net.rim.device.api.system.SIMCardInfo;

public final class Sistema {
	private final static String idApp = "0xcc76ecb46671657aL"; // pe.com.belcorp.caribe
	private final static String idPais = "7"; //7 PR  8 DO  

	public static String getImsi() {
		try {
			return GPRSInfo.imeiToString(SIMCardInfo.getIMSI(), false );
		} catch (Exception e) {
			return "ND";
		}
	}
	
	public static String getImei() {
		try {
			return GPRSInfo.imeiToString(GPRSInfo.getIMEI(), false);	
		} catch(Exception e) {
			return "ND";
		}
	}
	
	public static int getPin() {
		return DeviceInfo.getDeviceId();
	}
	
	public static String getVersion(){
	    String version = ApplicationDescriptor.currentApplicationDescriptor().getVersion();
		return version;
	}
	
	public static String getJADProperty(String Name){
	    CodeModuleGroup[] allGroups = CodeModuleGroupManager.loadAll();
	    CodeModuleGroup myGroup = null;
	    String moduleName = ApplicationDescriptor.currentApplicationDescriptor().getModuleName();
	    for (int i = 0; i < allGroups.length; i++) {
		    if (allGroups[i].containsModule(moduleName)) {
			    myGroup = allGroups[i];
			    break;
		    }
	    }
	 
	    // Get the property
	    String prop = myGroup.getProperty(Name);
	    return prop;
	}
	
	public static String getIdPais() {
		return idPais;
	}

	public static String getIdapp() {
		return idApp;
	}
}
