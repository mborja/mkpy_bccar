package com.belcorp.entidades.bc;

import net.rim.device.api.util.Persistable;

public class Reingreso implements Persistable {
	private String campana;
	private String fechaRegistro;
	private String codConsultora;
	private String apPaterno;
	private String apMaterno;
	private String nombres;
	private String tipoDocumento;
	private String nroDocumento;
	private String telefonoCasa;
	private String telefonoCelular;
	private String enviado; // 0 = no enviado, 1 = enviado
	
	public String getEnviado() {
		return enviado;
	}
	public void setEnviado(String enviado) {
		this.enviado = enviado;
	}
	public String getTelefonoCasa() {
		return telefonoCasa;
	}
	public void setTelefonoCasa(String telefonoCasa) {
		this.telefonoCasa = telefonoCasa;
	}
	public String getTelefonoCelular() {
		return telefonoCelular;
	}
	public void setTelefonoCelular(String telefonoCelular) {
		this.telefonoCelular = telefonoCelular;
	}
	private RecordLocation record;

	public String getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(String fechaRegistro) {
		if ( fechaRegistro.length() > 8 ) fechaRegistro = fechaRegistro.substring(0, 8);
		this.fechaRegistro = fechaRegistro;
	}
	
	public String getCampana() {
		return campana;
	}
	public void setCampana(String campana) {
		this.campana = campana;
	}
	
	public RecordLocation getRecord() {
		if (record == null )
			record = new RecordLocation();
		return record;
	}
	public void setRecord(RecordLocation record) {
		this.record = record;
	}
	
	public String getCodConsultora() {
		return codConsultora;
	}
	public void setCodConsultora(String codConsultora) {
		this.codConsultora = codConsultora;
	}
	public String getApPaterno() {
		return apPaterno;
	}
	public void setApPaterno(String apPaterno) {
		this.apPaterno = apPaterno;
	}
	public String getApMaterno() {
		return apMaterno;
	}
	public void setApMaterno(String apMaterno) {
		this.apMaterno = apMaterno;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getTipoDocumento() {
		return tipoDocumento;
	}
	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	public String getNroDocumento() {
		return nroDocumento;
	}
	public void setNroDocumento(String nroDocumento) {
		this.nroDocumento = nroDocumento;
	}
	
}
