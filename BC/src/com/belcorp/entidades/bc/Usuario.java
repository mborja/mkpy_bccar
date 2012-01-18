package com.belcorp.entidades.bc;

import net.rim.device.api.util.Persistable;

public final class Usuario implements Persistable {
	//private String codigo;
	private String appaterno;
	private String apmaterno;
	private String Nombres;
	private String region;
	private String zona;
	private String idPais;
	private String idEmpresa;
	private String idTipoDoc;
	private String nrodoc;
	private String telefono;
	private String correo;
	private int pin;
	private String imsi;
	private boolean sincronizado;
	private String fechaHoraLocal;
	private String fechaHoraServidor;
	private String fechaHoraRecarga;
	private String campana;
	private String habilitaA; //oculta o muestra opción Seguimiento en BB
	private String habilitaB; //oculta o muestra opción Reingreso en BB
	private String habilitaC; //oculta o muestra la porción "Adicional" de la SC
	private String habilitaD; //activa o desactiva la opción GPS en la BB
	private String habilitaE; // 
	private String url;
	private String version;

	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getHabilitaA() {
		return habilitaA;
	}
	public void setHabilitaA(String habilitaA) {
		this.habilitaA = habilitaA;
	}
	public String getHabilitaB() {
		return habilitaB;
	}
	public void setHabilitaB(String habilitaB) {
		this.habilitaB = habilitaB;
	}
	public String getHabilitaC() {
		return habilitaC;
	}
	public void setHabilitaC(String habilitaC) {
		this.habilitaC = habilitaC;
	}
	public String getHabilitaD() {
		return habilitaD;
	}
	public void setHabilitaD(String habilitaD) {
		this.habilitaD = habilitaD;
	}
	public String getHabilitaE() {
		return habilitaE;
	}
	public void setHabilitaE(String habilitaE) {
		this.habilitaE = habilitaE;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCampana() {
    	return "C" + campana.substring(4) + "/" + campana.substring(0, 4);
		//return campana;
	}
	public void setCampana(String campana) {
		this.campana = campana;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}	
	public String getFechaHoraServidor() {
		return fechaHoraServidor;
	}
	public void setFechaHoraServidor(String fechaHoraServidor) {
		this.fechaHoraServidor = fechaHoraServidor;
	}
	
	public String getFechaHoraRecarga() {
		return fechaHoraRecarga;
	}
	public void setFechaHoraRecarga(String fechaHoraRecarga) {
		this.fechaHoraRecarga = fechaHoraRecarga;
	}
	public boolean isSincronizado() {
		return sincronizado;
	}
	public void setSincronizado(boolean sincronizado) {
		this.sincronizado = sincronizado;
	}
	public String getFechaHoraLocal() {
		return fechaHoraLocal;
	}
	public void setFechaHoraLocal(String fechaHoraLocal) {
		this.fechaHoraLocal = fechaHoraLocal;
	}
	public String getAppaterno() {
		return appaterno;
	}
	public void setAppaterno(String appaterno) {
		this.appaterno = appaterno;
	}
	public String getApmaterno() {
		return apmaterno;
	}
	public void setApmaterno(String apmaterno) {
		this.apmaterno = apmaterno;
	}
	public String getNombres() {
		return Nombres;
	}
	public void setNombres(String nombres) {
		Nombres = nombres;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getZona() {
		return zona;
	}
	public void setZona(String zona) {
		this.zona = zona;
	}
	public String getIdPais() {
		return idPais;
	}
	public void setIdPais(String idPais) {
		this.idPais = idPais;
	}
	public String getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(String idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public String getIdTipoDoc() {
		return idTipoDoc;
	}
	public void setIdTipoDoc(String idTipoDoc) {
		this.idTipoDoc = idTipoDoc;
	}
	public String getNrodoc() {
		return nrodoc;
	}
	public void setNrodoc(String nrodoc) {
		this.nrodoc = nrodoc;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public String getImsi() {
		return imsi;
	}
	public void setImsi(String imsi) {
		this.imsi = imsi;
	}

	
}
