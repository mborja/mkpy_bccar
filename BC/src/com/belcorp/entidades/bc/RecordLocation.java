package com.belcorp.entidades.bc;

import net.rim.device.api.util.Persistable;

public class RecordLocation implements Persistable {
	private String longitude;
	private String latitude;
	private String margen;
	private String satelites;
	private String PIN;
	private String IMSI;
	private String fechaVisita;
	private String observacion;

	public String getFechaVisita() {
		return fechaVisita;
	}
	public void setFechaVisita(String fechaVisita) {
		if ( fechaVisita.length() > 8 ) fechaVisita = fechaVisita.substring(0, 8);
		this.fechaVisita = fechaVisita;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getMargen() {
		return margen;
	}
	public void setMargen(String margen) {
		this.margen = margen;
	}
	public String getSatelites() {
		return satelites;
	}
	public void setSatelites(String satelites) {
		this.satelites = satelites;
	}
	public String getPIN() {
		return PIN;
	}
	public void setPIN(String pIN) {
		PIN = pIN;
	}
	public String getIMSI() {
		return IMSI;
	}
	public void setIMSI(String iMSI) {
		IMSI = iMSI;
	}
	
}
