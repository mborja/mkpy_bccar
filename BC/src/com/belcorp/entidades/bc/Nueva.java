package com.belcorp.entidades.bc;

import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.util.Persistable;

public class Nueva implements Persistable {
	private String campana;
	private String fechaRegistro;
	private String territorio;
	private String tipoContacto;
	private String CodConsultoraRec;
	
	private String apPaterno;
	private String apMaterno;
	private String nombres;
	private String fechaNacimiento;
	private String tipoDocumento;
	private String nroDocumento;
	private String estadoCivil;
	private String nivelEducativo;
	private String otrasMarcas;

	private String telefonoCasa;
	private String telefonoCelular;
	private String correo;
	private String noCorreo;
	private String direccion;
	private String referencia;
	
	//INICIO: direccion
	//PR
	private String codigoPostal;
	private String pueblo;
	private String estado;
	
	//DOM
	private String municipio;
	private String cuidad;
	private String provincia;

	//FIN: direccion
	
	//INICIO: direccion entrega
	//PR
	private String entregaDireccion1;
	private String entregaPueblo;
	private String entregaCodigoPostal;
	
	//DOM
	private String entregaDireccion2;
	private String entregaReferencia;
	private String entregaProvincia;

	//FIN: direccion entrega

	private String refFamiliarNombres;
	private String refFamiliarDireccion;
	private String refFamiliarTelefono;
	private String refFamiliarCelular;
	private String refFamiliarTipoVinculo;
	
	private String refNoFamiliarNombres;
	private String refNoFamiliarDireccion;
	private String refNoFamiliarTelefono;
	private String refNoFamiliarCelular;
	private String refNoFamiliarTipoVinculo;

	//Estadisticas
	private String profesion;
	private String lugarTrabajo;
	private String telefonoTrabajo;
	private String horaVisita;
	private String nroHijos;
	private String nroInfantes;
	private String nroEscolares;
	private String nroSuperior;
	private String nroAdultos;

	private RecordLocation record;
	
	private String modo; // 1 == draft, 2 = real
	private String enviado; // 1 == enviado , 0 == no enviado
	private boolean hasError;

	public boolean isHasError() {
		return hasError;
	}
	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}
	public String getEntregaProvincia() {
		if ( entregaProvincia == null )
			return "";
		else
			return entregaProvincia;
	}
	public void setEntregaProvincia(String entregaProvincia) {
		this.entregaProvincia = entregaProvincia;
	}
	public String getModo() {
		return modo;
	}
	public void setModo(String modo) {
		this.modo = modo;
	}
	public String getEnviado() {
		return enviado;
	}
	public void setEnviado(String enviado) {
		this.enviado = enviado;
	}
	public String getProfesion() {
		return profesion;
	}
	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}
	public String getLugarTrabajo() {
		return lugarTrabajo;
	}
	public void setLugarTrabajo(String lugarTrabajo) {
		this.lugarTrabajo = lugarTrabajo;
	}
	public String getTelefonoTrabajo() {
		return telefonoTrabajo;
	}
	public void setTelefonoTrabajo(String telefonoTrabajo) {
		this.telefonoTrabajo = telefonoTrabajo;
	}
	public String getHoraVisita() {
		return horaVisita;
	}
	public void setHoraVisita(String horaVisita) {
		this.horaVisita = horaVisita;
	}
	public String getNroHijos() {
		return nroHijos;
	}
	public void setNroHijos(String nroHijos) {
		if(nroHijos==null || nroHijos.length()==0){
			this.nroHijos = "0";
		}else{
		   this.nroHijos = nroHijos;
		}
	}
	public String getNroInfantes() {
		return nroInfantes;
	}
	public void setNroInfantes(String nroInfantes) {
		this.nroInfantes = nroInfantes;
	}
	public String getNroEscolares() {
		return nroEscolares;
	}
	public void setNroEscolares(String nroEscolares) {
		this.nroEscolares = nroEscolares;
	}
	public String getNroSuperior() {
		return nroSuperior;
	}
	public void setNroSuperior(String nroSuperior) {
		this.nroSuperior = nroSuperior;
	}
	public String getNroAdultos() {
		return nroAdultos;
	}
	public void setNroAdultos(String nroAdultos) {
		this.nroAdultos = nroAdultos;
	}

	public String getNivelEducativo() {
		return nivelEducativo;
	}
	public void setNivelEducativo(String nivelEducativo) {
		this.nivelEducativo = nivelEducativo;
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
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getNoCorreo() {
		return noCorreo;
	}
	public void setNoCorreo(String noCorreo) {
		this.noCorreo = noCorreo;
	}
	
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
	public String getTerritorio() {
		return territorio;
	}
	public void setTerritorio(String territorio) {
		this.territorio = territorio;
	}
	public String getTipoContacto() {
		return tipoContacto;
	}
	public void setTipoContacto(String tipoContacto) {
		this.tipoContacto = tipoContacto;
	}
	public String getCodConsultoraRec() {
		return CodConsultoraRec;
	}
	public void setCodConsultoraRec(String codConsultoraRec) {
		CodConsultoraRec = codConsultoraRec;
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
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		if ( fechaNacimiento.length() > 8 ) fechaNacimiento = fechaNacimiento.substring(0, 8);
		this.fechaNacimiento = fechaNacimiento;
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
	public String getNrodocProt(){
		return nroDocumento.substring(nroDocumento.length() - 4, nroDocumento.length());
	}
	
	public void setNroDocumento(String nroDocumento) {
		this.nroDocumento = nroDocumento;
	}
	public String getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getOtrasMarcas() {
		return otrasMarcas;
	}
	public void setOtrasMarcas(String otrasMarcas) {
		this.otrasMarcas = otrasMarcas;
	}
	public String getDireccion() {
		if ( direccion == null ) 
			return "";
		else
			return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getReferencia() {
		return referencia;
	}
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}
	public String getCodigoPostal() {
		if ( codigoPostal == null )
			return "";
		else
			return codigoPostal;
	}
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}
	public String getPueblo() {
		if ( pueblo == null )
			return "";
		else 
			return pueblo;
	}
	public void setPueblo(String pueblo) {
		this.pueblo = pueblo;
	}
	public String getEstado() {
		if ( estado == null )
			return "";
		else
			return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getMunicipio() {
		if ( municipio == null ) 
			return "";
		else
			return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public String getCuidad() {
		if ( cuidad == null )
			return "";
		else
			return cuidad;
	}
	public void setCuidad(String cuidad) {
		this.cuidad = cuidad;
	}
	public String getProvincia() {
		if ( provincia == null )
			return "";
		else
			return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getEntregaDireccion1() {
		if ( entregaDireccion1 == null )
			return "";
		else
			return entregaDireccion1;
	}
	public void setEntregaDireccion1(String entregaDireccion1) {
		this.entregaDireccion1 = entregaDireccion1;
	}
	public String getEntregaPueblo() {
		if ( entregaPueblo == null )
			return "";
		else
			return entregaPueblo;
	}
	public void setEntregaPueblo(String entregaPueblo) {
		this.entregaPueblo = entregaPueblo;
	}
	public String getEntregaCodigoPostal() {
		if ( entregaCodigoPostal == null )
			return "";
		else
			return entregaCodigoPostal;
	}
	public void setEntregaCodigoPostal(String entregaCodigoPostal) {
		this.entregaCodigoPostal = entregaCodigoPostal;
	}
	public String getEntregaDireccion2() {
		if ( entregaDireccion2 == null )
			return "";
		else
			return entregaDireccion2;
	}
	public void setEntregaDireccion2(String entregaDireccion2) {
		this.entregaDireccion2 = entregaDireccion2;
	}
	public String getEntregaReferencia() {
		if ( entregaReferencia == null )
			return "";
		else
			return entregaReferencia;
	}
	public void setEntregaReferencia(String entregaReferencia) {
		this.entregaReferencia = entregaReferencia;
	}
	public String getRefFamiliarNombres() {
		return refFamiliarNombres;
	}
	public void setRefFamiliarNombres(String refFamiliarNombres) {
		this.refFamiliarNombres = refFamiliarNombres;
	}
	public String getRefFamiliarDireccion() {
		return refFamiliarDireccion;
	}
	public void setRefFamiliarDireccion(String refFamiliarDireccion) {
		this.refFamiliarDireccion = refFamiliarDireccion;
	}
	public String getRefFamiliarTelefono() {
		return refFamiliarTelefono;
	}
	public void setRefFamiliarTelefono(String refFamiliarTelefono) {
		this.refFamiliarTelefono = refFamiliarTelefono;
	}
	public String getRefFamiliarCelular() {
		return refFamiliarCelular;
	}
	public void setRefFamiliarCelular(String refFamiliarCelular) {
		this.refFamiliarCelular = refFamiliarCelular;
	}
	public String getRefFamiliarTipoVinculo() {
		return refFamiliarTipoVinculo;
	}
	public void setRefFamiliarTipoVinculo(String refFamiliarTipoVinculo) {
		this.refFamiliarTipoVinculo = refFamiliarTipoVinculo;
	}
	public String getRefNoFamiliarNombres() {
		return refNoFamiliarNombres;
	}
	public void setRefNoFamiliarNombres(String refNoFamiliarNombres) {
		this.refNoFamiliarNombres = refNoFamiliarNombres;
	}
	public String getRefNoFamiliarDireccion() {
		return refNoFamiliarDireccion;
	}
	public void setRefNoFamiliarDireccion(String refNoFamiliarDireccion) {
		this.refNoFamiliarDireccion = refNoFamiliarDireccion;
	}
	public String getRefNoFamiliarTelefono() {
		return refNoFamiliarTelefono;
	}
	public void setRefNoFamiliarTelefono(String refNoFamiliarTelefono) {
		this.refNoFamiliarTelefono = refNoFamiliarTelefono;
	}
	public String getRefNoFamiliarCelular() {
		return refNoFamiliarCelular;
	}
	public void setRefNoFamiliarCelular(String refNoFamiliarCelular) {
		this.refNoFamiliarCelular = refNoFamiliarCelular;
	}
	public String getRefNoFamiliarTipoVinculo() {
		return refNoFamiliarTipoVinculo;
	}
	public void setRefNoFamiliarTipoVinculo(String refNoFamiliarTipoVinculo) {
		this.refNoFamiliarTipoVinculo = refNoFamiliarTipoVinculo;
	}
	
}
