package com.belcorp.entidades.bc;

import net.rim.device.api.util.Persistable;

public class Seguimiento implements Persistable {
	private String campana;
	private String fechaRegistro;
	private String codConsultora;
	private String nrodoc;
	private String fecha;
	private String observacion;
	private String enviado; // 0 = no enviado, 1 = enviado
	
	public String getEnviado() {
		return enviado;
	}
	public void setEnviado(String enviado) {
		this.enviado = enviado;
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
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		if ( fecha.length() > 8 ) fecha = fecha.substring(0, 8);
		this.fecha = fecha;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public String getNrodoc() {
		return nrodoc;
	}
	public void setNrodoc(String nrodoc) {
		this.nrodoc = nrodoc;
	}
	
}
