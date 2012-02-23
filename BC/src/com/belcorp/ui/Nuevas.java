package com.belcorp.ui;

import com.belcorp.utilidades.GPSScreen;

import java.util.Calendar;
import java.util.Date;
import java.util.Vector;


import com.belcorp.dao.EstadoCivilDB;
import com.belcorp.dao.NivelEducativoDB;
import com.belcorp.dao.NuevaDB;
import com.belcorp.dao.OtraMarcaDB;
import com.belcorp.dao.TipoContactoDB;
import com.belcorp.dao.TipoVinculoDB;
import com.belcorp.dao.UbigeoDB;
import com.belcorp.dao.UsuarioDB;
import com.belcorp.entidades.bc.EstadoCivil;
import com.belcorp.entidades.bc.NivelEducativo;
import com.belcorp.entidades.bc.Nueva;
import com.belcorp.entidades.bc.OtraMarca;
import com.belcorp.entidades.bc.RecordLocation;
import com.belcorp.entidades.bc.TipoContacto;
import com.belcorp.entidades.bc.TipoVinculo;
import com.belcorp.entidades.bc.Ubigeo;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Estilos;
import com.belcorp.utilidades.Fechas;
import com.belcorp.utilidades.Sistema;
import com.makipuray.ui.mkpyDialogInput;
import com.makipuray.ui.mkpyLabelChoiceField;
import com.makipuray.ui.mkpyLabelEditField;
import com.makipuray.ui.mkpyLabelField;
import com.makipuray.ui.mkpyLabelLabelField;
import com.makipuray.ui.mkpyStatusProgress;

import net.rim.device.api.i18n.SimpleDateFormat;
import net.rim.device.api.system.Bitmap;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.FieldChangeListener;
import net.rim.device.api.ui.FocusChangeListener;
import net.rim.device.api.ui.MenuItem;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.CheckboxField;
import net.rim.device.api.ui.component.DateField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.EditField;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.component.ObjectChoiceField;

public class Nuevas extends GPSScreen implements FieldChangeListener, FocusChangeListener {
	private String []aTipoContacto;
	private String []aEstadoCivil;
	private String []aNivelEducativo;
	private String []aVendeOtras;
	private String []aPueblo;
	private String []aTipoVincFam;
	private String []aTipoVincNoFam;
	private Vector vUbigeos;
	
	private String gpsLon = "";
	private String gpsLat = "";
	
	private mkpyDialogInput dProvincia = new mkpyDialogInput("Ingrese un nombre", 25, EditField.NO_NEWLINE | EditField.FIELD_HCENTER);
	private mkpyDialogInput dDProvincia = new mkpyDialogInput("Ingrese un nombre", 25, EditField.NO_NEWLINE | EditField.FIELD_HCENTER);
	
	private UsuarioDB usuarios = new UsuarioDB();
	private Usuario usuario;
	private TipoContactoDB tipoContactos = new TipoContactoDB();
	private EstadoCivilDB estadoCiviles = new EstadoCivilDB();
	private NivelEducativoDB nivelEducativos = new NivelEducativoDB();
	private OtraMarcaDB otrasMarcas = new OtraMarcaDB();
	private TipoVinculoDB tipoVinculos = new TipoVinculoDB();
	private UbigeoDB ubigeos = new UbigeoDB();
	private Nueva nuevaSC;
		
	private mkpyLabelField lblInscripcion = new mkpyLabelField("DATOS DE INSCRIPCIÓN", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH | LabelField.ELLIPSIS, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtTerritorio = new mkpyLabelEditField("", "", 3, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboTipoContacto; // = new mkpyLabelChoiceField("Tipo contacto:", aTipoContacto, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtCodConsRec = new mkpyLabelEditField("Cons.recomienda:", "", 7, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);

	// INICIO: Solicitante
	private mkpyLabelField lblSolicitante = new mkpyLabelField("DATOS PERSONALES DE LA SOLICITANTE", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH | LabelField.ELLIPSIS, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtAppaterno = new mkpyLabelEditField("Primer apellido:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtApmaterno = new mkpyLabelEditField("Segundo apellido:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtNombres = new mkpyLabelEditField("Nombres:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private DateField txtFechaNac = new DateField("Fecha nacimiento:", (new Date()).getTime(), DateField.DATE | DateField.USE_ALL_WIDTH);
	private mkpyLabelLabelField lblTipoDoc; // = new mkpyLabelChoiceField("Tipo doc:", aTipoDoc, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroDoc; // = new mkpyLabelEditField("Nro doc:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboEstadoCivil; // = new mkpyLabelChoiceField("Estado civil:", aEstadoCivil, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboNivelEducativo; // = new mkpyLabelChoiceField("Nivel educativo:", aNivelEducativo, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboOtrasMarcas; // = new mkpyLabelChoiceField("Vende otras:", aVendeOtras, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	// FIN: Solicitante

	// INICIO: Datos de contacto
	private mkpyLabelField lblDatosContacto = new mkpyLabelField("DATOS DEL CONTACTO", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH | LabelField.ELLIPSIS, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtTelefonoCasa = new mkpyLabelEditField("Teléfono 1:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtTelefonoCelular = new mkpyLabelEditField("Teléfono 2:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtCorreo = new mkpyLabelEditField("Correo electrónico:", "", 100, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_EMAIL, Color.BLACK, Color.WHITE);
	private CheckboxField chkNoCorreo = new CheckboxField("No tengo correo electrónico.", false);
	// FIN: Datos de contacto
	
	// INICIO: Direccion solicitante
	private mkpyLabelField lblDireccionSolicitante = new mkpyLabelField("DIRECCIÓN DE LA SOLICITANTE", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH | LabelField.ELLIPSIS, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtDireccion = new mkpyLabelEditField("Dirección:", "", 40, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtReferencia = new mkpyLabelEditField("Referencia:", "", 40, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	//INICIO: PR
	private mkpyLabelEditField txtCodPostal = new mkpyLabelEditField("Cod.Postal:", "", 5, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboPueblo; // = new mkpyLabelChoiceField("Pueblo:", aPueblo, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtEstado = new mkpyLabelEditField("Estado:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT | EditField.NON_FOCUSABLE, Color.BLACK, Color.WHITE);
	//FIN: PR
	//INICIO: DOM
	private mkpyLabelEditField txtMunicipio = new mkpyLabelEditField("Municipio:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtCiudad = new mkpyLabelEditField("Ciudad:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	//FIN: DOM
	// FIN: Dirección solicitante

	// INICIO: Dirección entrega
	private CheckboxField chkCopiar = new CheckboxField("Copiar dirección", false);
	private mkpyLabelField lblDirEntrega = new mkpyLabelField("DIRECCIÓN DE ENTREGA EN LA ZONA", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH, Color.WHITE, Estilos.getBGModulo());
	//INICIO: PR
	private mkpyLabelEditField txtDEntregaDireccion = new mkpyLabelEditField("Dirección:", "", 80, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboDEntregaPueblo; // = new mkpyLabelChoiceField("Pueblo:", aPueblo, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtDEntregaCodPostal = new mkpyLabelEditField("Cod.Postal:", "", 5, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	//FIN: PR
	//INICIO: DOM
	private mkpyLabelEditField txtDEntregaReferencia = new mkpyLabelEditField("Referencia:", "", 40, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	//FIN: DOM
	// FIN: Dirección entrega

	// INICIO: Referencia familiar
	private mkpyLabelField lblRefFamiliar = new mkpyLabelField("REFERENCIA FAMILIAR", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtRefFamNombres = new mkpyLabelEditField("Nombres:", "", 25, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtRefFamDireccion = new mkpyLabelEditField("Dirección:", "", 35, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtRefFamTelResi = new mkpyLabelEditField("Teléfono 1:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtRefFamCelular = new mkpyLabelEditField("Teléfono 2:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboRefFamTipoVinculo; // = new mkpyLabelChoiceField("Tipo Vinculo:", aTipoVinc, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	// FIN: Referencia familiar

	// INICIO: Referencia no familiar
	private mkpyLabelField lblRefNoFamiliar = new mkpyLabelField("REFERENCIA NO FAMILIAR", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtRefNoFamNombres = new mkpyLabelEditField("Nombres:", "", 25, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtRefNoFamDireccion = new mkpyLabelEditField("Dirección:", "", 35, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtRefNoFamTelResi = new mkpyLabelEditField("Teléfono 1:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtRefNoFamCelular = new mkpyLabelEditField("Teléfono 2:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboRefNoFamTipoVinculo; // = new mkpyLabelChoiceField("Tipo Vinculo:", aTipoVinc, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	// FIN: Referencia no familiar

	// INICIO: Estadística
	private mkpyLabelField lblAdicional = new mkpyLabelField("ADICIONAL", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH, Color.WHITE, Estilos.getBGModulo());
	private mkpyLabelEditField txtProfesion = new mkpyLabelEditField("Profesión:", "", 20, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtLugarTrabajo = new mkpyLabelEditField("Lugar de trabajo:", "", 20, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtTelefonoTrabajo = new mkpyLabelEditField("Teléfono de trabajo:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private DateField txtHoraVisita = new DateField("Hora disponible de visita:", (new Date()).getTime(), DateField.DATE | DateField.USE_ALL_WIDTH);
	private mkpyLabelEditField txtNroHijos = new mkpyLabelEditField("Nro hijos:", "", 2, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroInfantes = new mkpyLabelEditField("Nro infantes:", "", 2, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroEscolares = new mkpyLabelEditField("Nro escolares:", "", 2, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroSuperior  = new mkpyLabelEditField("Nro estudiantes superior:", "", 2, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroAdultos = new mkpyLabelEditField("Nro adultos independientes:", "", 2, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	// FIN: Estadística

	private mkpyStatusProgress progress = new mkpyStatusProgress("");   
	private LabelField lblEstado = new LabelField("", LabelField.FIELD_RIGHT);
	
	// INICIO: Record
	private mkpyLabelField lblRecord = new mkpyLabelField("Record", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH, Color.WHITE, Estilos.getBGModulo());
	private DateField txtFechaRec = new DateField("Fecha:", (new Date()).getTime(), DateField.DATE | DateField.USE_ALL_WIDTH);
	private mkpyLabelEditField txtObsRec = new mkpyLabelEditField("Observacion:", "", 20, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	// FIN: Record
	
	private String docOculto="";
	private boolean isEdicion=false;
	
	public boolean onClose() {
    	if(Dialog.ask(Dialog.D_YES_NO, "¿Desea grabar en borrador antes de salir?") != Dialog.NO){
    		grabarDraft();
    	}else{
    		close();
    	}
    	return true;
    };
	
	public Nuevas(Nueva sc) {
		if(sc!=null) isEdicion=true;
		nuevaSC = sc;
		int index;
		usuario = usuarios.getUsuario();
		dProvincia.setChangeListener(this);
		dDProvincia.setChangeListener(this);
		txtTerritorio.getLabel().setText("Cod.territorio: " + usuario.getRegion() + "-" + usuario.getZona());
		GPSScreen.PrintMessage("");
		
		// JGF: en caso de requerirse deshabilitar GPS
		if(!usuario.getHabilitaD().equals("1"))
		{
			GPSScreen.StopMessure();
    		GPSScreen.CancelTimer();
    		GPSScreen.PrintMessage("GPS deshabilitado!");
		}
		
		aTipoContacto = Cadenas.getDescriptions(tipoContactos.getObjetos());
		if ( sc == null ) {
			index = 0;
		} else {
			index = tipoContactos.getIndexById(sc.getTipoContacto());
			if ( index < 0 ) index = 0;
			else index++;
		}
		cboTipoContacto = new mkpyLabelChoiceField("Tipo contacto:", aTipoContacto, index, ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);
		lblTipoDoc = new mkpyLabelLabelField("Documento de identidad:", usuario.getIdTipoDoc(), ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);
		
		aEstadoCivil = Cadenas.getDescriptions(estadoCiviles.getObjetos());
		if ( sc == null ) {
			index = 0;
		} else {
			index = estadoCiviles.getIndexById(sc.getEstadoCivil());
			if ( index < 0 ) index = 0;
			else index++;
		}
		cboEstadoCivil = new mkpyLabelChoiceField("Estado civil:", aEstadoCivil, index, ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);
		
		aNivelEducativo = Cadenas.getDescriptions(nivelEducativos.getObjetos());
		if ( sc == null ) {
			index = 0;
		} else {
			index = nivelEducativos.getIndexById(sc.getNivelEducativo());
			if ( index < 0 ) index = 0;
			else index++;
		}
		cboNivelEducativo = new mkpyLabelChoiceField("Nivel educativo:", aNivelEducativo, index, ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);

		aVendeOtras = Cadenas.getDescriptions(otrasMarcas.getObjetos());
		if ( sc == null ) {
			index = 0;
		} else {
			index = otrasMarcas.getIndexById(sc.getOtrasMarcas());
			if ( index < 0 ) index = 0;
			else index++;
		}
		cboOtrasMarcas = new mkpyLabelChoiceField("Vendes otras marcas?:", aVendeOtras, index, ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);
		aTipoVincFam = Cadenas.getDescriptions(tipoVinculos.getObjetosFamiliar());
		aTipoVincNoFam = Cadenas.getDescriptions(tipoVinculos.getObjetosNoFamiliar());

		if ( sc == null ) {
			index = 0;
		} else {
			index = tipoVinculos.getIndexByIdFamiliar(sc.getRefFamiliarTipoVinculo());
			if ( index < 0 ) index = 0;
			else index++;
		}
		cboRefFamTipoVinculo = new mkpyLabelChoiceField("Tipo Vínculo:", aTipoVincFam, index, ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);		
		if ( sc == null ) {
			index = 0;
		} else {
			index = tipoVinculos.getIndexByIdNoFamiliar(sc.getRefNoFamiliarTipoVinculo());
			if ( index < 0 ) index = 0;
			else index++;
		}
		cboRefNoFamTipoVinculo = new mkpyLabelChoiceField("Tipo Vínculo:", aTipoVincNoFam, index, ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);		

		llenaProvincias();
		
        add(new BitmapField(Bitmap.getBitmapResource("img/titulos/nuevas.png"), BitmapField.HCENTER));
        add(lblInscripcion);
		add(txtTerritorio);
		if ( sc != null ) {
			txtTerritorio.getText().setText(sc.getTerritorio());
		}

		txtTerritorio.setChangeListener(this);
        txtTerritorio.setFocusListener(this);
        add(cboTipoContacto);
        add(txtCodConsRec);
		if ( sc != null ) {
			txtCodConsRec.getText().setText(sc.getCodConsultoraRec());
		}
        txtCodConsRec.setChangeListener(this);
        txtCodConsRec.setFocusListener(this);

        add(lblSolicitante);
        add(txtAppaterno);
		if ( sc != null ) {
			txtAppaterno.getText().setText(sc.getApPaterno());
		}
        txtAppaterno.setChangeListener(this);
        txtAppaterno.setFocusListener(this);
        add(txtApmaterno);
		if ( sc != null ) {
			txtApmaterno.getText().setText(sc.getApMaterno());
		}
        txtApmaterno.setChangeListener(this);
        txtApmaterno.setFocusListener(this);
        add(txtNombres);
		if ( sc != null ) {
			txtNombres.getText().setText(sc.getNombres());
		}
        txtNombres.setChangeListener(this);
        txtNombres.setFocusListener(this);
        add(txtFechaNac);
		if ( sc != null ) {
			Date tmp = Fechas.stringToDate(sc.getFechaNacimiento());
			txtFechaNac.setDate(tmp);
		}
        add(lblTipoDoc);

        if ( usuario.getIdPais().equals("7") ) { // PR
        	txtNroDoc = new mkpyLabelEditField("Nro doc.identidad:", "", 9, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
        }
        if ( usuario.getIdPais().equals("8") ) { // DOM
        	txtNroDoc = new mkpyLabelEditField("Nro doc.identidad:", "", 11, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
        }
        add(txtNroDoc);
        
		if ( sc != null ) {
			docOculto=sc.getNroDocumento();
			if(usuario.getIdPais()=="7")
				txtNroDoc.getText().setText(sc.getNrodocProt());
			else
				txtNroDoc.getText().setText(sc.getNroDocumento());
		}
        txtNroDoc.setChangeListener(this);
        txtNroDoc.setFocusListener(this);
        
        add(cboEstadoCivil);
        add(cboNivelEducativo);
        add(cboOtrasMarcas);

        add(lblDatosContacto);
        add(txtTelefonoCasa);
		if ( sc != null ) {
			txtTelefonoCasa.getText().setText(sc.getTelefonoCasa());
		}
        txtTelefonoCasa.setChangeListener(this);
        txtTelefonoCasa.setFocusListener(this);
        add(txtTelefonoCelular);
		if ( sc != null ) {
			txtTelefonoCelular.getText().setText(sc.getTelefonoCelular());
		}
        txtTelefonoCelular.setChangeListener(this);
        txtTelefonoCelular.setFocusListener(this);
        add(txtCorreo);
		if ( sc != null ) {
			txtCorreo.getText().setText(sc.getCorreo());
		}
        txtCorreo.setChangeListener(this);
        txtCorreo.setFocusListener(this);
        add(chkNoCorreo);
        if ( txtCorreo.getText().getText().equals("") ) {
        	chkNoCorreo.setChecked(true);
        }
        
        add(lblDireccionSolicitante);
        add(txtDireccion);
		if ( sc != null ) {
			txtDireccion.getText().setText(sc.getDireccion());
		}
        txtDireccion.setChangeListener(this);
        txtDireccion.setFocusListener(this);
        add(txtReferencia);
		if ( sc != null ) {
			txtReferencia.getText().setText(sc.getReferencia());
		}
        txtReferencia.setChangeListener(this);
        txtReferencia.setFocusListener(this);

		if ( sc == null ) {
			index = 0;
		} else {
			index = ubigeos.getIndexById(sc.getPueblo());
			if ( index < 0 ) index = 0;
			else index++;
		}
    	cboPueblo = new mkpyLabelChoiceField("Pueblo:", aPueblo, index, ObjectChoiceField.FIELD_RIGHT | ObjectChoiceField.FORCE_SINGLE_LINE, Color.BLACK, Color.WHITE);
    	cboPueblo.setChangeListener(this);
        if ( usuario.getIdPais().equals("7") ) { // PR
            add(txtCodPostal);
    		if ( sc != null ) {
    			txtCodPostal.getText().setText(sc.getCodigoPostal());
    		}
            txtCodPostal.setChangeListener(this);
            txtCodPostal.setFocusListener(this);
            add(cboPueblo);
            add(txtEstado);
            txtEstado.getText().setText("PUERTO RICO");
    		if ( sc != null ) {
    			txtEstado.getText().setText(sc.getEstado());
    		}
            txtEstado.setChangeListener(this);
            txtEstado.setFocusListener(this);
        }
        if ( usuario.getIdPais().equals("8") ) { // DOM
        	add(txtMunicipio);
    		if ( sc != null ) {
    			txtMunicipio.getText().setText(sc.getMunicipio());
    		}
        	txtMunicipio.setChangeListener(this);
        	txtMunicipio.setFocusListener(this);
        	add(txtCiudad);
    		if ( sc != null ) {
    			txtCiudad.getText().setText(sc.getCuidad());
    		}
        	txtCiudad.setChangeListener(this);
        	txtCiudad.setFocusListener(this);
            add(cboPueblo);
        }
        
        add(lblDirEntrega);
        add(chkCopiar);
        chkCopiar.setChangeListener(this);
		if ( sc == null ) {
			index = 0;
		} else {
			index = ubigeos.getIndexById(sc.getEntregaPueblo());
			if ( index < 0 ) index = 0;
			else index++;
		}
    	cboDEntregaPueblo = new mkpyLabelChoiceField("Pueblo:", aPueblo, index, ObjectChoiceField.FIELD_LEFT | ObjectChoiceField.FORCE_SINGLE_LINE, Color.BLACK, Color.WHITE);
    	cboDEntregaPueblo.setChangeListener(this);

    	// TODO: cuales son los ID de los paises?
        if ( usuario.getIdPais().equals("7") ) { // PR
            add(txtDEntregaDireccion);
    		if ( sc != null ) {
    			txtDEntregaDireccion.getText().setText(sc.getEntregaDireccion1());
    		}
            txtDEntregaDireccion.setChangeListener(this);
            txtDEntregaDireccion.setFocusListener(this);
            add(cboDEntregaPueblo);
            add(txtDEntregaCodPostal);
    		if ( sc != null ) {
    			txtDEntregaCodPostal.getText().setText(sc.getEntregaCodigoPostal());
    		}
            txtDEntregaCodPostal.setChangeListener(this);
            txtDEntregaCodPostal.setFocusListener(this);
        }
        if ( usuario.getIdPais().equals("8") ) { // DOM
        	add(txtDEntregaDireccion);
    		if ( sc != null ) {
    			txtDEntregaDireccion.getText().setText(sc.getEntregaDireccion1());
    		}
        	txtDEntregaDireccion.setChangeListener(this);
        	txtDEntregaDireccion.setFocusListener(this);
        	add(txtDEntregaReferencia);
    		if ( sc != null ) {
    			txtDEntregaReferencia.getText().setText(sc.getEntregaReferencia());
    		}
        	txtDEntregaReferencia.setChangeListener(this);
        	txtDEntregaReferencia.setFocusListener(this);
            add(cboDEntregaPueblo);
        }

    	add(lblRefFamiliar);
    	add(txtRefFamNombres);
		if ( sc != null ) {
			txtRefFamNombres.getText().setText(sc.getRefFamiliarNombres());
		}
    	txtRefFamNombres.setChangeListener(this);
    	txtRefFamNombres.setFocusListener(this);
    	add(txtRefFamDireccion);
		if ( sc != null ) {
			txtRefFamDireccion.getText().setText(sc.getRefFamiliarDireccion());
		}
    	txtRefFamDireccion.setChangeListener(this);
    	txtRefFamDireccion.setFocusListener(this);
    	add(txtRefFamTelResi);
		if ( sc != null ) {
			txtRefFamTelResi.getText().setText(sc.getRefFamiliarTelefono());
		}
    	txtRefFamTelResi.setChangeListener(this);
    	txtRefFamTelResi.setFocusListener(this);
    	add(txtRefFamCelular);
		if ( sc != null ) {
			txtRefFamCelular.getText().setText(sc.getRefFamiliarCelular());
		}
    	txtRefFamCelular.setChangeListener(this);
    	txtRefFamCelular.setFocusListener(this);
    	add(cboRefFamTipoVinculo);

    	add(lblRefNoFamiliar);
    	add(txtRefNoFamNombres);
		if ( sc != null ) {
			txtRefNoFamNombres.getText().setText(sc.getRefNoFamiliarNombres());
		}
    	txtRefNoFamNombres.setChangeListener(this);
    	txtRefNoFamNombres.setFocusListener(this);
    	add(txtRefNoFamDireccion);
		if ( sc != null ) {
			txtRefNoFamDireccion.getText().setText(sc.getRefNoFamiliarDireccion());
		}
    	txtRefNoFamDireccion.setChangeListener(this);
    	txtRefNoFamDireccion.setFocusListener(this);
    	add(txtRefNoFamTelResi);
		if ( sc != null ) {
			txtRefNoFamTelResi.getText().setText(sc.getRefNoFamiliarTelefono());
		}
    	txtRefNoFamTelResi.setChangeListener(this);
    	txtRefNoFamTelResi.setFocusListener(this);
    	add(txtRefNoFamCelular);
		if ( sc != null ) {
			txtRefNoFamCelular.getText().setText(sc.getRefNoFamiliarCelular());
		}
    	txtRefNoFamCelular.setChangeListener(this);
    	txtRefNoFamCelular.setFocusListener(this);
    	add(cboRefNoFamTipoVinculo);

    	add(lblAdicional);
    	add(txtProfesion);
		if ( sc != null ) {
			txtProfesion.getText().setText(sc.getProfesion());
		}
		txtProfesion.setChangeListener(this);
		txtProfesion.setFocusListener(this);
    	add(txtLugarTrabajo);
		if ( sc != null ) {
			txtLugarTrabajo.getText().setText(sc.getLugarTrabajo());
		}
    	txtLugarTrabajo.setChangeListener(this);
    	txtLugarTrabajo.setFocusListener(this);
    	add(txtTelefonoTrabajo);
		if ( sc != null ) {
			txtTelefonoTrabajo.getText().setText(sc.getTelefonoTrabajo());
		}
    	txtTelefonoTrabajo.setChangeListener(this);
    	txtTelefonoTrabajo.setFocusListener(this);

    	SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
    	txtHoraVisita.setFormat(sdf);
    	add(txtHoraVisita);
		if ( sc != null ) {
			Date tmp = Fechas.stringToDateTime(sc.getHoraVisita());
			txtHoraVisita.setDate(tmp);
		}
    	txtHoraVisita.setChangeListener(this);
    	txtHoraVisita.setFocusListener(this);
    	    	
    	add(txtNroHijos);
		if ( sc != null ) {
			txtNroHijos.getText().setText(sc.getNroHijos());
		}
    	txtNroHijos.setChangeListener(this);
    	txtNroHijos.setFocusListener(this);

    	if ( usuario.getHabilitaC().equals("1") ) { // si tiene habilidada la porcion de record
        	add(lblRecord);
        	add(txtFechaRec);
    		if ( sc != null ) {
    			//TODO: set fecha
    			//txtFechaRec.getText().setText(sc.getNroHijos());
    		}
    		txtFechaRec.setChangeListener(this);
    		txtFechaRec.setFocusListener(this);
    		
        	add(txtObsRec);
    		if ( sc != null ) {
    			txtObsRec.getText().setText(sc.getRecord().getObservacion());
    		}
    		txtObsRec.setChangeListener(this);
    		txtObsRec.setFocusListener(this);
    	}
    	
        if ( sc != null ) {
            if ( sc.getModo().equals("1") ) {
                addMenuItem(grabarDraft);
                addMenuItem(grabarReal);
            }
        } else {
            addMenuItem(grabarDraft);
            addMenuItem(grabarReal);
        }
        setStatus(lblEstado);
        
	}
	
	private void llenaProvincias() {
		vUbigeos = ubigeos.getObjetos();
		String aTmp[] = Cadenas.getDescriptions(vUbigeos);
		aPueblo = new String [aTmp.length + 1];
		for(int i = 0; i < aTmp.length; i++) {
			aPueblo[i] = aTmp[i];
		}
		aPueblo[aTmp.length] = "OTRO"; 
	}
	
	public void fieldChanged(Field field, int context) {
        if ( field instanceof mkpyLabelEditField ) {
          lblEstado.setText("" + ( ((mkpyLabelEditField) field).getText().getMaxSize() - ((mkpyLabelEditField) field).getText().getTextLength() ) ); // + (txtZona.getTextLength() - txtZona.getText().length()));
          if ( field == txtNroInfantes || field == txtNroEscolares || field == txtNroSuperior || field == txtNroAdultos ) {
        	  int totalHijos = Integer.parseInt("0" + txtNroInfantes.getText().getText()) 
        	  	+ Integer.parseInt("0" + txtNroEscolares.getText().getText()) 
        	  	+ Integer.parseInt("0" + txtNroSuperior.getText().getText()) 
        	  	+ Integer.parseInt("0" + txtNroAdultos.getText().getText()); 
        	  txtNroHijos.getText().setText("" + totalHijos);  
          }
        } else if ( field == chkCopiar ) {
        	copiarDireccion(chkCopiar.getChecked());
        } else if ( field == cboPueblo && context == 2 ) {
        	if ( aPueblo[cboPueblo.getSelectedIndex()].equals("OTRO") ) {
        		dProvincia.open();
        	}
        } else if ( field == cboDEntregaPueblo && context == 2 ) {
        	if ( aPueblo[cboDEntregaPueblo.getSelectedIndex()].equals("OTRO") ) {
        		dDProvincia.open();
        	}
        } else if ( field == dProvincia ) {
        	if ( dProvincia.getInput().getText().equals("") ) {
        		Dialog.inform("Ingrese un nombre");
        	} else {
            	Ubigeo item = new Ubigeo();
            	item.setId(dProvincia.getInput().getText());
            	item.setDescripcion(dProvincia.getInput().getText());
            	ubigeos.saveObject(item);
        		llenaProvincias();
        		cboPueblo.getOptions().setChoices(aPueblo);
        		cboPueblo.getOptions().setSelectedIndex(aPueblo.length - 2);

        		int ind = cboDEntregaPueblo.getOptions().getSelectedIndex();
        		cboDEntregaPueblo.getOptions().setChoices(aPueblo);
        		cboDEntregaPueblo.getOptions().setSelectedIndex(ind);
        		
        		dProvincia.close();
        	}
        } else if ( field == dDProvincia ) {
        	if ( dDProvincia.getInput().getText().equals("") ) {
        		Dialog.inform("Ingrese un nombre");
        	} else {
            	Ubigeo item = new Ubigeo();
            	item.setId(dDProvincia.getInput().getText());
            	item.setDescripcion(dDProvincia.getInput().getText());
            	ubigeos.saveObject(item);
        		llenaProvincias();

        		int ind = cboPueblo.getOptions().getSelectedIndex();
        		cboPueblo.getOptions().setChoices(aPueblo);
        		cboPueblo.getOptions().setSelectedIndex(ind);

        		cboDEntregaPueblo.getOptions().setChoices(aPueblo);
        		cboDEntregaPueblo.getOptions().setSelectedIndex(aPueblo.length - 2);
            	dDProvincia.close();
        	}
        }
    }

	private void copiarDireccion(boolean copiar) {
		if ( copiar ) {
	        if ( usuario.getIdPais().equals("7") ) { // PR
	            txtDEntregaDireccion.getText().setText(txtDireccion.getText().getText() + " " + txtReferencia.getText().getText() );
	            cboDEntregaPueblo.getOptions().setSelectedIndex(cboPueblo.getSelectedIndex());
	            txtDEntregaCodPostal.getText().setText(txtCodPostal.getText().getText());
	        }
	        if ( usuario.getIdPais().equals("8") ) { // DOM
	        	txtDEntregaDireccion.getText().setText(txtDireccion.getText().getText());
	        	txtDEntregaReferencia.getText().setText(txtReferencia.getText().getText());
	            cboDEntregaPueblo.getOptions().setSelectedIndex(cboPueblo.getSelectedIndex());
	        }
		} else {
			txtDEntregaDireccion.getText().setText("");
			txtDEntregaCodPostal.getText().setText("");
			//txtDEntregaDireccion2.getText().setText("");
			txtDEntregaReferencia.getText().setText("");
        	//txtDEntregaDireccion2.getText().setText("");
            cboDEntregaPueblo.getOptions().setSelectedIndex(0);
		}
	}
	
	MenuItem grabarDraft = new MenuItem("Grabar borrador", 110, 10) {
        public void run() {
        	grabarDraft();
        }
    };

	MenuItem grabarReal = new MenuItem("Grabar real", 110, 10) {
        public void run() {
        	grabarReal();
        }
    };
    
    private void grabarDraft() {
    	
		if(txtTerritorio.getText().getText().length() > 0 && txtTerritorio.getText().getText().length() < 3){
			txtTerritorio.setFocus();
			Dialog.inform("El territorio es incorrecto");
			return;
		}    	
		
    	if(cboTipoContacto.getSelectedIndex()==0){
    		cboTipoContacto.setFocus();
			Dialog.inform("Debe seleccionar un tipo de contacto");
			return;
    	}else{
	    	TipoContacto tipoCont = (TipoContacto) tipoContactos.getObjetos().elementAt(cboTipoContacto.getSelectedIndex()-1);
	    	if ( tipoCont.getId().equals("1") ) {
	    		if ( txtCodConsRec.getText().getText().length() < txtCodConsRec.getText().getMaxSize() ) {
	    			txtCodConsRec.setFocus();
	    			Dialog.inform("Debe ingresar código de consultora que recomienda");
	    			return;
	    		} 
	    		
	    		if ( txtCodConsRec.getText().getText().length() < txtCodConsRec.getText().getMaxSize() ) {
	    			int dif = txtCodConsRec.getText().getMaxSize() - txtCodConsRec.getText().getText().length();
	    			for(int i = 0; i < dif; i++) {
	    				txtCodConsRec.getText().setText("0" + txtCodConsRec.getText().getText());
	    			}
	    		}    		
	    	}
    	}
    	
		if (txtAppaterno.getText().getText().length() == 0 ) {
			txtAppaterno.setFocus();
			Dialog.inform("Debe ingresar el apellido paterno de la solicitante");
			return;
		}else if(txtAppaterno.getText().getText().length() < 2){
			txtAppaterno.setFocus();
			Dialog.inform("El apellido paterno de la solicitante debe tener al menos 2 caracteres");
			return;
		}	
		if (txtAppaterno.haveNumbers()) {
			txtAppaterno.setFocus();
			Dialog.inform("Existen números en el apellido paterno");
			return;
		}
		
		if (txtApmaterno.haveNumbers()) {
			txtApmaterno.setFocus();
			Dialog.inform("Existen números en el apellido materno");
			return;
		}
		
		if (txtNombres.getText().getText().length() == 0 ) {
			txtNombres.setFocus();
			Dialog.inform("Debe ingresar el nombre de la solicitante");
			return;
		}else if(txtNombres.getText().getText().length() < 2){
			txtNombres.setFocus();
			Dialog.inform("El nombre de la solicitante debe tener al menos 2 caracteres");
			return;
		}	
		if (txtNombres.haveNumbers() ) {
			txtNombres.setFocus();
			Dialog.inform("Existen números en el nombre");
			return;
		}
		
        Calendar oCal = Calendar.getInstance();
        Date fecha = oCal.getTime();
        
        Calendar oCalNac = Calendar.getInstance();
        oCalNac.setTime(new Date(txtFechaNac.getDate()));
        
        long lDate1 = Fechas.dateToLongYYYYMMDD(new Date(txtFechaNac.getDate()));
        long lDate2 = Fechas.dateToLongYYYYMMDD(new Date(fecha.getTime()));
        
        int diff_year = oCal.get(Calendar.YEAR) - oCalNac.get(Calendar.YEAR);
        //int diff_month = oCal.get(Calendar.MONTH) - oCalNac.get(Calendar.MONTH);
        //int diff_day = oCal.get(Calendar.DAY_OF_MONTH) - oCalNac.get(Calendar.DAY_OF_MONTH);
        
		if ( lDate1 >= lDate2 ) {
			txtFechaNac.setFocus();
			Dialog.inform("Debe ingresar una fecha de nacimiento inferior");
			return;
		}else if(diff_year<18){
			txtFechaNac.setFocus();
			Dialog.inform("Debe ser mayor de edad");
			return;
		}

		if ( txtNroDoc.getText().getText().length() < txtNroDoc.getText().getMaxSize() ) {
			txtNroDoc.setFocus();
			Dialog.inform("Debe ingresar un número de documento");
			return;
		} 
		
		if ( txtNroDoc.getText().getText().length() < txtNroDoc.getText().getMaxSize() ) {
			int dif = txtNroDoc.getText().getMaxSize() - txtNroDoc.getText().getText().length();
			for(int i = 0; i < dif; i++) {
				txtNroDoc.getText().setText("0" + txtNroDoc.getText().getText());
			}
		}

		if ( cboEstadoCivil.getSelectedIndex() == 0 ) {
			cboEstadoCivil.setFocus();
			Dialog.inform("Debe indicar el estado civil de la solicitante");
			return;
		}
		if ( cboNivelEducativo.getSelectedIndex() == 0 ) {
			cboNivelEducativo.setFocus();
			Dialog.inform("Debe indicar el nivel educativo de la solicitante");
			return;
		}
		if ( cboOtrasMarcas.getSelectedIndex() == 0 ) {
			cboOtrasMarcas.setFocus();
			Dialog.inform("Debe indicar si trabaja con otras marcas");
			return;
		}
		
		if ( txtTelefonoCasa.getText().getText().length() == 0 && txtTelefonoCelular.getText().getText().length() == 0 ) {
			txtTelefonoCasa.setFocus();
			Dialog.inform("Debe ingresar uno de los télefonos de la solicitante");
			return;
		}
		if ( txtTelefonoCasa.getText().getText().length() > 0 ) {
			if ( txtTelefonoCasa.getText().getText().length() < txtTelefonoCasa.getText().getMaxSize() ) {
				txtTelefonoCasa.setFocus();
				Dialog.inform("Debe ingresar el teléfono de la solicitante");
				return;
			}
		}
		if ( txtTelefonoCelular.getText().getText().length() > 0 ) {
			if ( txtTelefonoCelular.getText().getText().length() < txtTelefonoCelular.getText().getMaxSize() ) {
				txtTelefonoCelular.setFocus();
				Dialog.inform("Debe ingresar el teléfono 2 de la solicitante");
				return;
			}
		}
		
		if ( !chkNoCorreo.getChecked() ) {
			if ( txtCorreo.getText().getText().length() == 0 ) {
				txtCorreo.setFocus();
				Dialog.inform("Debe ingresar el correo de la solicitante");
				return;
			}
		}
		
		if ( txtRefFamNombres.getText().getText().length() == 0 ) {
			txtRefFamNombres.setFocus();
			Dialog.inform("Debe ingresar el nombre de la referencia familiar de la solicitante");
			return;
		}else if(txtRefFamNombres.getText().getText().length() < 2){
			txtRefFamNombres.setFocus();
			Dialog.inform("El nombre de la referencia familiar debe tener al menos 2 caracteres");
			return;
		}
		if ( txtRefFamNombres.haveNumbers() ) {
			txtRefFamNombres.setFocus();
			Dialog.inform("Existen números en el nombre de la referencia familiar de la solicitante");
			return;
		}
		
		if ( txtRefFamTelResi.getText().getText().length() == 0 && txtRefFamCelular.getText().getText().length() == 0 ) {
			txtRefFamTelResi.setFocus();
			Dialog.inform("Debe ingresar el teléfono de la referencia familiar de la solicitante");
			return;
		}
		if ( txtRefFamTelResi.getText().getText().length() > 0 ) {
			if ( txtRefFamTelResi.getText().getText().length() < txtRefFamTelResi.getText().getMaxSize() ) {
				txtRefFamTelResi.setFocus();
				Dialog.inform("Debe ingresar el teléfono de la referencia familiar de la solicitante");
				return;
			}
		}
		if ( txtRefFamCelular.getText().getText().length() > 0 ) {
			if ( txtRefFamCelular.getText().getText().length() < txtRefFamCelular.getText().getMaxSize() ) {
				txtRefFamCelular.setFocus();
				Dialog.inform("Debe ingresar el teléfono 2 de la referencia familiar de la solicitante");
				return;
			}
		}
		if ( cboRefFamTipoVinculo.getSelectedIndex() == 0 ) {
			cboRefFamTipoVinculo.setFocus();
			Dialog.inform("Debe seleccionar un tipo de vínculo familiar de la solicitante");
			return;
		}
		if ( txtRefNoFamNombres.getText().getText().length() == 0 ) {
			txtRefNoFamNombres.setFocus();
			Dialog.inform("Debe ingresar el nombre de la referencia NO familiar de la solicitante");
			return;
		}else if(txtRefNoFamNombres.getText().getText().length() < 2){
			txtRefNoFamNombres.setFocus();
			Dialog.inform("El nombre de la referencia no familiar debe tener al menos 2 caracteres");
			return;
		}
		if (txtRefNoFamNombres.haveNumbers() ) {
			txtRefNoFamNombres.setFocus();
			Dialog.inform("Existen números en el nombre de la referencia NO familiar de la solicitante");
			return;
		}
		
		if ( txtRefNoFamTelResi.getText().getText().length() == 0 && txtRefNoFamCelular.getText().getText().length() == 0 ) {
			txtRefNoFamTelResi.setFocus();
			Dialog.inform("Debe ingresar el teléfono de la referencia NO familiar de la solicitante");
			return;
		}
		if ( txtRefNoFamTelResi.getText().getText().length() > 0 ) {
			if ( txtRefNoFamTelResi.getText().getText().length() < txtRefNoFamTelResi.getText().getMaxSize() ) {
				txtRefNoFamTelResi.setFocus();
				Dialog.inform("Debe ingresar el teléfono de la referencia NO familiar de la solicitante");
				return;
			}
		}
		if ( txtRefNoFamCelular.getText().getText().length() > 0 ) {
			if ( txtRefNoFamCelular.getText().getText().length() < txtRefNoFamCelular.getText().getMaxSize() ) {
				txtRefNoFamCelular.setFocus();
				Dialog.inform("Debe ingresar el teléfono 2 de la referencia NO familiar de la solicitante");
				return;
			}
		}
		//txtRefNoFamCelular
		if ( cboRefNoFamTipoVinculo.getSelectedIndex() == 0 ) {
			cboRefNoFamTipoVinculo.setFocus();
			Dialog.inform("Debe seleccionar un tipo de vínculo No familiar de la solicitante");
			return;
		}
		if ( txtTelefonoTrabajo.getText().getText().length() > 0 ) {
			if ( txtTelefonoTrabajo.getText().getText().length() < txtTelefonoTrabajo.getText().getMaxSize() ) {
				txtTelefonoTrabajo.setFocus();
				Dialog.inform("Debe ingresar el teléfono completo los adicionales de la solicitante");
				return;
			}
		}

		gpsLon = "0";
		gpsLat = "0";
		
//		// JGF: GPS
//		if(usuario.getHabilitaD().equals("1"))  // usuario tiene habilidado el GPS
//    	{    		
//			if(Dialog.ask(Dialog.D_YES_NO, "Se encuentra en el domicilio?") == Dialog.YES) 
//			{
//	    		progress.setTitle("Capturando localización");
//
//	    		while(Dialog.ask(Dialog.D_YES_NO, "Desea grabar GPS: (" + gpsLon + ", " + gpsLat + ")?") == Dialog.NO)
//	    		{		    		
//		    		gpsLon = "" + String.valueOf(GPSScreen.getLongitude()); // JGF: faltaba la conversión a String
//		        	gpsLat = "" + String.valueOf(GPSScreen.getLatitude());
//	    		}
//
//	    		GPSScreen.StopMessure();
//	    		GPSScreen.CancelTimer();
//	    		
//	        	// JGF: muestra las coordenadas registradas	
//	        	progress.setTitle("Localización registrada: (" + gpsLon + ", " + gpsLat + ")");
//			}
//    	}
		
		// JGF: GPS
		if(usuario.getHabilitaD().equals("1"))  // usuario tiene habilidado el GPS
    	{    		
			if(Dialog.ask(Dialog.D_YES_NO, "¿Se encuentra en el domicilio?") == Dialog.YES) 
			{
				
				//Dialog.ask(Dialog.D_OK_CANCEL,"Ubiquese en una zona sin techo de la casa, puede ser la puerta de ingreso");
				
	    		gpsLon = "" + String.valueOf(GPSScreen.getLongitude()); // JGF: faltaba la conversión a String
	        	gpsLat = "" + String.valueOf(GPSScreen.getLatitude());
				
	    		GPSScreen.StopMessure();
	    		GPSScreen.CancelTimer();
	    		
			}
    	}
		
        progress.setTitle("Grabando...");
        progress.open();
        NuevaDB nuevas = new NuevaDB();
    	Nueva nueva = new Nueva();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
    	SimpleDateFormat sdfTime = new SimpleDateFormat("HHmm");

        nueva.setTerritorio(txtTerritorio.getText().getText());
        
        if(cboTipoContacto.getSelectedIndex()!=0){
            TipoContacto tc = (TipoContacto) tipoContactos.getObjetos().elementAt(cboTipoContacto.getSelectedIndex() - 1);
            nueva.setTipoContacto(tc.getId());
        }
        
        nueva.setCodConsultoraRec(txtCodConsRec.getText().getText());

        nueva.setApPaterno(txtAppaterno.getText().getText());
        nueva.setApMaterno(txtApmaterno.getText().getText());
        nueva.setNombres(txtNombres.getText().getText());
        nueva.setFechaNacimiento(sdf.formatLocal(txtFechaNac.getDate()));
        //TODO:Número de documento oculto dependiendo si es edición o nuevo
        if(isEdicion)
	        nueva.setNroDocumento(docOculto);
        else
        	nueva.setNroDocumento(txtNroDoc.getText().getText());

        if ( cboEstadoCivil.getSelectedIndex() == 0 ) {
            nueva.setEstadoCivil("");
        } else {
            EstadoCivil ec = (EstadoCivil) estadoCiviles.getObjetos().elementAt(cboEstadoCivil.getSelectedIndex() - 1);
            nueva.setEstadoCivil(ec.getId());
        }
        if ( cboNivelEducativo.getSelectedIndex() == 0 ) {
            nueva.setNivelEducativo("");
        } else {
            NivelEducativo ne = (NivelEducativo) nivelEducativos.getObjetos().elementAt(cboNivelEducativo.getSelectedIndex() - 1);
            nueva.setNivelEducativo(ne.getId());
        }
		if ( cboOtrasMarcas.getSelectedIndex() == 0 ) {
	        nueva.setOtrasMarcas("");
		} else {
	        OtraMarca om = (OtraMarca) otrasMarcas.getObjetos().elementAt(cboOtrasMarcas.getSelectedIndex() - 1);
	        nueva.setOtrasMarcas(om.getId());
		}

        nueva.setTelefonoCasa(txtTelefonoCasa.getText().getText());
        nueva.setTelefonoCelular(txtTelefonoCelular.getText().getText());
        nueva.setCorreo(txtCorreo.getText().getText());
        nueva.setNoCorreo(String.valueOf(chkNoCorreo.getChecked()));

        nueva.setDireccion(txtDireccion.getText().getText());
        nueva.setReferencia(txtReferencia.getText().getText());        

        if ( usuario.getIdPais().equals("7") ) { // PR
            nueva.setCodigoPostal(txtCodPostal.getText().getText());
            nueva.setPueblo(aPueblo[cboPueblo.getSelectedIndex()]);
            nueva.setEstado(txtEstado.getText().getText());
        }
        
        if ( usuario.getIdPais().equals("8") ) { // DOM
            nueva.setMunicipio(txtMunicipio.getText().getText());
            nueva.setCuidad(txtCiudad.getText().getText());
            nueva.setPueblo(aPueblo[cboPueblo.getSelectedIndex()]);
        }
        
        if ( usuario.getIdPais().equals("7") ) { // PR
            nueva.setEntregaDireccion1(txtDEntregaDireccion.getText().getText());
            nueva.setEntregaPueblo(aPueblo[cboDEntregaPueblo.getSelectedIndex()]);
            nueva.setEntregaCodigoPostal(txtDEntregaCodPostal.getText().getText());
        }
    	 
        if ( usuario.getIdPais().equals("8") ) { // DOM
            nueva.setEntregaDireccion1(txtDEntregaDireccion.getText().getText());
            nueva.setEntregaReferencia(txtDEntregaReferencia.getText().getText());
            nueva.setEntregaPueblo(aPueblo[cboDEntregaPueblo.getSelectedIndex()]);
        }
    	
        nueva.setRefFamiliarNombres(txtRefFamNombres.getText().getText());
        nueva.setRefFamiliarDireccion(txtRefFamDireccion.getText().getText());
        nueva.setRefFamiliarTelefono(txtRefFamTelResi.getText().getText());
        nueva.setRefFamiliarCelular(txtRefFamCelular.getText().getText());
        
        TipoVinculo tv1 = (TipoVinculo) tipoVinculos.getObjetosFamiliar().elementAt(cboRefFamTipoVinculo.getSelectedIndex() - 1);
        nueva.setRefFamiliarTipoVinculo(tv1.getId());
    	
        nueva.setRefNoFamiliarNombres(txtRefNoFamNombres.getText().getText());
        nueva.setRefNoFamiliarDireccion(txtRefNoFamDireccion.getText().getText());
        nueva.setRefNoFamiliarTelefono(txtRefNoFamTelResi.getText().getText());
        nueva.setRefNoFamiliarCelular(txtRefNoFamCelular.getText().getText());

        TipoVinculo tv2 = (TipoVinculo) tipoVinculos.getObjetosNoFamiliar().elementAt(cboRefNoFamTipoVinculo.getSelectedIndex() - 1);
        nueva.setRefNoFamiliarTipoVinculo(tv2.getId());

        nueva.setProfesion(txtProfesion.getText().getText());
        nueva.setLugarTrabajo(txtLugarTrabajo.getText().getText());
        nueva.setTelefonoTrabajo(txtTelefonoTrabajo.getText().getText());
        nueva.setHoraVisita(sdfTime.formatLocal(txtHoraVisita.getDate()));
        //nueva.setHoraVisita(txtHoraVisita.getText().getText());
        nueva.setNroHijos(txtNroHijos.getText().getText());
        nueva.setNroInfantes(txtNroInfantes.getText().getText());
        nueva.setNroEscolares(txtNroEscolares.getText().getText());
        nueva.setNroSuperior(txtNroSuperior.getText().getText());
        nueva.setNroAdultos(txtNroAdultos.getText().getText());

        nueva.setModo("1");
        nueva.setEnviado("0");
        nueva.setFechaRegistro(Fechas.dateToString("yyyyMMddHHmm"));
        nueva.setCampana("");

        RecordLocation record = new RecordLocation();
        record.setFechaVisita(sdf.formatLocal( txtFechaRec.getDate() ));
        record.setObservacion(txtObsRec.getText().getText());
        record.setIMSI(Sistema.getImsi());
        record.setPIN("" + Sistema.getPin());

    	if ( usuario.getHabilitaD().equals("1") ) { // usuario tiene habilidado el GPS
            record.setLatitude(gpsLat);
            record.setLongitude(gpsLon);
            record.setMargen("0");
            record.setSatelites("0");
    	} else {
            record.setLatitude("0");
            record.setLongitude("0");
            record.setMargen("0");
            record.setSatelites("0");
    	}
        nueva.setRecord(record);
        
        nuevas.saveObject(nueva, nuevaSC);
        progress.setTitle("Enviando...");
        
        if ( nuevas.putRemote(nueva) ) {
            nueva.setEnviado("1");
            nueva.setHasError(false);
        	Dialog.inform("La incorporación se envío con éxito");
        } else {
        	progress.close();
            nueva.setHasError(true);
            if ( nueva.getModo().equals("2") ) {
            	nueva.setModo("1");
            	Dialog.inform("Se produjo un error al enviar la incorporación, se guardará como Borrador. ".concat(nuevas.getCoderror()).concat(" ").concat(nuevas.getMsgerror()) );
            } else {
            	Dialog.inform("Se produjo un error al enviar la incorporación, ".concat(nuevas.getCoderror()).concat(" ").concat(nuevas.getMsgerror()));
            }
        }
        nuevas.commitChanges();
        progress.close();
        nuevas = null;
		close();
    }

    private void grabarReal() {
    	
		if ( txtTerritorio.getText().getText().length() == 0  ) {
			txtTerritorio.setFocus();
			Dialog.inform("Debe ingresar un territorio");
			return;
		}else if(txtTerritorio.getText().getText().length() < 3){
			txtTerritorio.setFocus();
			Dialog.inform("El territorio es incorrecto");
			return;
		}

    	if(cboTipoContacto.getSelectedIndex()==0){
    		cboTipoContacto.setFocus();
			Dialog.inform("Debe seleccionar un tipo de contacto");
			return;
    	}else{
	    	TipoContacto tipoCont = (TipoContacto) tipoContactos.getObjetos().elementAt(cboTipoContacto.getSelectedIndex()-1);
	    	if ( tipoCont.getId().equals("1") ) {
	    		if ( txtCodConsRec.getText().getText().length() < txtCodConsRec.getText().getMaxSize() ) {
	    			txtCodConsRec.setFocus();
	    			Dialog.inform("Debe ingresar código de consultora que recomienda");
	    			return;
	    		} 
	    		
	    		if ( txtCodConsRec.getText().getText().length() < txtCodConsRec.getText().getMaxSize() ) {
	    			int dif = txtCodConsRec.getText().getMaxSize() - txtCodConsRec.getText().getText().length();
	    			for(int i = 0; i < dif; i++) {
	    				txtCodConsRec.getText().setText("0" + txtCodConsRec.getText().getText());
	    			}
	    		}    		
	    	}
    	}
        
		if ( txtAppaterno.getText().getText().length() == 0 ) {
			txtAppaterno.setFocus();
			Dialog.inform("Debe ingresar el apellido paterno de la solicitante");
			return;
		}else if(txtAppaterno.getText().getText().length() < 2){
			txtAppaterno.setFocus();
			Dialog.inform("El apellido paterno de la solicitante debe tener al menos 2 caracteres");
			return;
		}	
		if (txtAppaterno.haveNumbers() ) {
			txtAppaterno.setFocus();
			Dialog.inform("Existen números en el apellido paterno");
			return;
		}
		
		if (txtApmaterno.haveNumbers()) {
			txtApmaterno.setFocus();
			Dialog.inform("Existen números en el apellido materno");
			return;
		}
        
		if ( txtNombres.getText().getText().length() == 0 ) {
			txtNombres.setFocus();
			Dialog.inform("Debe ingresar el nombre de la solicitante");
			return;
		}else if(txtAppaterno.getText().getText().length() < 2){
			txtAppaterno.setFocus();
			Dialog.inform("El nombre de la solicitante debe tener al menos 2 caracteres");
			return;
		}	
		if (txtNombres.haveNumbers() ) {
			txtNombres.setFocus();
			Dialog.inform("Existen números en el nombre de la solicitante");
			return;
		}
		
        Calendar oCal = Calendar.getInstance();
        Date fecha = oCal.getTime();

        long lDate1 = Fechas.dateToLongYYYYMMDD(new Date(txtFechaNac.getDate()));
        long lDate2 = Fechas.dateToLongYYYYMMDD(new Date(fecha.getTime()));
        
		if ( lDate1 >= lDate2 ) {
			txtFechaNac.setFocus();
			Dialog.inform("Debe ingresar una fecha de nacimiento inferior");
			return;
		}
        
		if ( txtNroDoc.getText().getText().length() < txtNroDoc.getText().getMaxSize() ) {
			txtNroDoc.setFocus();
			Dialog.inform("Debe ingresar un número de documento");
			return;
		} else if ( txtNroDoc.getText().getText().length() < txtNroDoc.getText().getMaxSize() ) {
			int dif = txtNroDoc.getText().getMaxSize() - txtNroDoc.getText().getText().length();
			for(int i = 0; i < dif; i++) {
				txtNroDoc.getText().setText("0" + txtNroDoc.getText().getText());
			}
		}
        
		if ( cboEstadoCivil.getSelectedIndex() == 0 ) {
			cboEstadoCivil.setFocus();
			Dialog.inform("Debe indicar el estado civil de la solicitante");
			return;
		}
		if ( cboNivelEducativo.getSelectedIndex() == 0 ) {
			cboNivelEducativo.setFocus();
			Dialog.inform("Debe indicar el nivel educativo de la solicitante");
			return;
		}
		if ( cboOtrasMarcas.getSelectedIndex() == 0 ) {
			cboOtrasMarcas.setFocus();
			Dialog.inform("Debe indicar si trabaja con otras marcas");
			return;
		}
		
		if ( txtTelefonoCasa.getText().getText().length() == 0 && txtTelefonoCelular.getText().getText().length() == 0 ) {
			txtTelefonoCasa.setFocus();
			Dialog.inform("Debe ingresar uno de los teléfonos de la solicitante");
			return;
		}
		if ( txtTelefonoCasa.getText().getText().length() > 0 ) {
			if ( txtTelefonoCasa.getText().getText().length() < txtTelefonoCasa.getText().getMaxSize() ) {
				txtTelefonoCasa.setFocus();
				Dialog.inform("Debe ingresar el teléfono de la solicitante");
				return;
			}
		}
		if ( txtTelefonoCelular.getText().getText().length() > 0 ) {
			if ( txtTelefonoCelular.getText().getText().length() < txtTelefonoCelular.getText().getMaxSize() ) {
				txtTelefonoCelular.setFocus();
				Dialog.inform("Debe ingresar el teléfono 2 de la solicitante");
				return;
			}
		}
        
		if ( !chkNoCorreo.getChecked() ) {
			if ( txtCorreo.getText().getText().length() == 0 ) {
				txtCorreo.setFocus();
				Dialog.inform("Debe ingresar el correo de la solicitante");
				return;
			}
		}
		if ( txtDireccion.getText().getText().length() == 0 ) {
			txtDireccion.setFocus();
			Dialog.inform("Debe ingresar la dirección de la solicitante");
			return;
		}

		if ( usuario.getIdPais().equals("7") ) { // PR
    		if ( txtCodPostal.getText().getText().length() == 0 ) {
    			txtCodPostal.setFocus();
    			Dialog.inform("Debe ingresar el código postal la dirección de la solicitante");
    			return;
    		}
        }

        if ( usuario.getIdPais().equals("7") ) { // PR
    		if ( txtEstado.getText().getText().length() == 0 ) {
    			txtEstado.setFocus();
    			Dialog.inform("Debe ingresar el estado la dirección de la solicitante");
    			return;
    		}
        }

        if ( usuario.getIdPais().equals("8") ) { // DOM
			if ( txtMunicipio.getText().getText().length() == 0 ) {
				txtMunicipio.setFocus();
				Dialog.inform("Debe ingresar el municipio de la solicitante");
				return;
			}
        }

        if ( usuario.getIdPais().equals("8") ) { // DOM
    		if ( txtCiudad.getText().getText().length() == 0 ) {
    			txtCiudad.setFocus();
    			Dialog.inform("Debe ingresar la ciudad de la solicitante");
    			return;
    		}
        }

		if ( cboPueblo.getSelectedIndex() == 0 ) {
			cboPueblo.setFocus();
			Dialog.inform("Debe indicar el pueblo");
			return;
		}
		
		if ( txtDEntregaDireccion.getText().getText().length() == 0 ) {
			txtDEntregaDireccion.setFocus();
			Dialog.inform("Debe ingresar la dirección de entrega de la solicitante");
			return;
		}
    		
		if ( cboDEntregaPueblo.getSelectedIndex() == 0 ) {
			cboDEntregaPueblo.setFocus();
			Dialog.inform("Debe indicar el pueblo de entrega de la solicitante");
			return;
		}

		if ( txtRefFamNombres.getText().getText().length() == 0 ) {
			txtRefFamNombres.setFocus();
			Dialog.inform("Debe ingresar el nombre de la referencia familiar de la solicitante");
			return;
		}
		if (txtRefFamNombres.haveNumbers() ) {
			txtRefFamNombres.setFocus();
			Dialog.inform("Existen números en el nombre de la referencia familiar de la solicitante");
			return;
		}

		if ( txtRefFamDireccion.getText().getText().length() == 0 ) {
			txtRefFamDireccion.setFocus();
			Dialog.inform("Debe ingresar la dirección de la referencia familiar de la solicitante");
			return;
		}
		
		if ( txtRefFamTelResi.getText().getText().length() == 0 && txtRefFamCelular.getText().getText().length() == 0 ) {
			txtRefFamTelResi.setFocus();
			Dialog.inform("Debe ingresar el teléfono de la referencia familiar de la solicitante");
			return;
		}
		if ( txtRefFamTelResi.getText().getText().length() > 0 ) {
			if ( txtRefFamTelResi.getText().getText().length() < txtRefFamTelResi.getText().getMaxSize() ) {
				txtRefFamTelResi.setFocus();
				Dialog.inform("Debe ingresar el teléfono de la referencia familiar de la solicitante");
				return;
			}
		}
		if ( txtRefFamCelular.getText().getText().length() > 0 ) {
			if ( txtRefFamCelular.getText().getText().length() < txtRefFamCelular.getText().getMaxSize() ) {
				txtRefFamCelular.setFocus();
				Dialog.inform("Debe ingresar el teléfono 2 de la referencia familiar de la solicitante");
				return;
			}
		}
		
		if ( cboRefFamTipoVinculo.getSelectedIndex() == 0 ) {
			cboRefFamTipoVinculo.setFocus();
			Dialog.inform("Debe indicar el tipo de referencia fammiliar");
			return;
		}

		if ( txtRefNoFamNombres.getText().getText().length() == 0 ) {
			txtRefNoFamNombres.setFocus();
			Dialog.inform("Debe ingresar el nombre de la referencia NO familiar de la solicitante");
			return;
		}
		
		if (txtRefNoFamNombres.haveNumbers() ) {
			txtRefNoFamNombres.setFocus();
			Dialog.inform("Existen números en  el nombre de la referencia NO familiar de la solicitante");
			return;
		}
		
		if ( txtRefNoFamDireccion.getText().getText().length() == 0 ) {
			txtRefNoFamDireccion.setFocus();
			Dialog.inform("Debe ingresar la dirección de la referencia NO familiar de la solicitante");
			return;
		}
		if ( txtRefNoFamTelResi.getText().getText().length() == 0 && txtRefNoFamCelular.getText().getText().length() == 0 ) {
			txtRefNoFamTelResi.setFocus();
			Dialog.inform("Debe ingresar el teléfono de la referencia NO familiar de la solicitante");
			return;
		}
		if ( txtRefNoFamTelResi.getText().getText().length() > 0 ) {
			if ( txtRefNoFamTelResi.getText().getText().length() < txtRefNoFamTelResi.getText().getMaxSize() ) {
				txtRefNoFamTelResi.setFocus();
				Dialog.inform("Debe ingresar el teléfono de la referencia NO familiar de la solicitante");
				return;
			}
		}
		if ( txtRefNoFamCelular.getText().getText().length() > 0 ) {
			if ( txtRefNoFamCelular.getText().getText().length() < txtRefNoFamCelular.getText().getMaxSize() ) {
				txtRefNoFamCelular.setFocus();
				Dialog.inform("Debe ingresar el teléfono 2 de la referencia NO familiar de la solicitante");
				return;
			}
		}
		
		if ( cboRefNoFamTipoVinculo.getSelectedIndex() == 0 ) {
			cboRefNoFamTipoVinculo.setFocus();
			Dialog.inform("Debe indicar el tipo de referencia no fammiliar");
			return;
		}
		
		if ( txtTelefonoTrabajo.getText().getText().length() > 0 ) {
			if ( txtTelefonoTrabajo.getText().getText().length() < txtTelefonoTrabajo.getText().getMaxSize() ) {
				txtTelefonoTrabajo.setFocus();
				Dialog.inform("Debe ingresar el teléfono completo los adicionales de la solicitante");
				return;
			}
		}

		gpsLon = "0";
		gpsLat = "0";
		
		// JGF: GPS
		if(usuario.getHabilitaD().equals("1"))  // usuario tiene habilidado el GPS
    	{    		
			if(Dialog.ask(Dialog.D_YES_NO, "¿Se encuentra en el domicilio?") == Dialog.YES) 
			{
				/*
				if(Dialog.ask(Dialog.D_OK_CANCEL,"Ubiquese en una zona sin techo de la casa, puede ser la puerta de ingreso")== Dialog.D_OK)
	    		{progress.setTitle("Capturando localización");};
	    		*/
				
				//Dialog.ask(Dialog.D_OK_CANCEL,"Ubiquese en una zona sin techo de la casa, puede ser la puerta de ingreso");
				
	    		gpsLon = "" + String.valueOf(GPSScreen.getLongitude()); // JGF: faltaba la conversión a String
	        	gpsLat = "" + String.valueOf(GPSScreen.getLatitude());
				
				/*

	    		while(Dialog.ask(Dialog.D_YES_NO, "Desea grabar GPS: (" + gpsLon + ", " + gpsLat + ")?") == Dialog.NO)
	    		{		    		
		    		gpsLon = "" + String.valueOf(GPSScreen.getLongitude()); // JGF: faltaba la conversión a String
		        	gpsLat = "" + String.valueOf(GPSScreen.getLatitude());
	    		}
	    		*/

	    		GPSScreen.StopMessure();
	    		GPSScreen.CancelTimer();
	    		
	        	// JGF: muestra las coordenadas registradas	
	        	//progress.setTitle("Localización registrada: (" + gpsLon + ", " + gpsLat + ")");
			}
    	}
		
		progress.setTitle("Grabando...");
        progress.open();
        NuevaDB nuevas = new NuevaDB();
        Nueva nueva = new Nueva();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
    	SimpleDateFormat sdfTime = new SimpleDateFormat("HHmm");

        nueva.setTerritorio(txtTerritorio.getText().getText());
        TipoContacto tc = (TipoContacto) tipoContactos.getObjetos().elementAt(cboTipoContacto.getSelectedIndex() - 1);
        nueva.setTipoContacto(tc.getId());
        nueva.setCodConsultoraRec(txtCodConsRec.getText().getText());

        nueva.setApPaterno(txtAppaterno.getText().getText());
        nueva.setApMaterno(txtApmaterno.getText().getText());
        nueva.setNombres(txtNombres.getText().getText());
        nueva.setFechaNacimiento(sdf.formatLocal(txtFechaNac.getDate()));
        //TODO:Número de documento oculto dependiendo si es edicion o nuevo
        if(isEdicion)
        	nueva.setNroDocumento(docOculto);
        else
        	nueva.setNroDocumento(txtNroDoc.getText().getText());

        if ( cboEstadoCivil.getSelectedIndex() == 0 ) {
            nueva.setEstadoCivil("");
        } else {
            EstadoCivil ec = (EstadoCivil) estadoCiviles.getObjetos().elementAt(cboEstadoCivil.getSelectedIndex() - 1);
            nueva.setEstadoCivil(ec.getId());
        }
        if ( cboNivelEducativo.getSelectedIndex() == 0 ) {
            nueva.setNivelEducativo("");
        } else {
            NivelEducativo ne = (NivelEducativo) nivelEducativos.getObjetos().elementAt(cboNivelEducativo.getSelectedIndex() - 1);
            nueva.setNivelEducativo(ne.getId());
        }
		if ( cboOtrasMarcas.getSelectedIndex() == 0 ) {
	        nueva.setOtrasMarcas("");
		} else {
	        OtraMarca om = (OtraMarca) otrasMarcas.getObjetos().elementAt(cboOtrasMarcas.getSelectedIndex() - 1);
	        nueva.setOtrasMarcas(om.getId());
		}

        nueva.setTelefonoCasa(txtTelefonoCasa.getText().getText());
        nueva.setTelefonoCelular(txtTelefonoCelular.getText().getText());
        nueva.setCorreo(txtCorreo.getText().getText());
        nueva.setNoCorreo(String.valueOf(chkNoCorreo.getChecked()));

        nueva.setDireccion(txtDireccion.getText().getText());
        nueva.setReferencia(txtReferencia.getText().getText());        

        nueva.setCodigoPostal(txtCodPostal.getText().getText());
        nueva.setEstado(txtEstado.getText().getText());
        
        if ( usuario.getIdPais().equals("7") ) { // PR
            nueva.setCodigoPostal(txtCodPostal.getText().getText());
            nueva.setPueblo(aPueblo[cboPueblo.getSelectedIndex()]);
            nueva.setEstado(txtEstado.getText().getText());
        }
        
        if ( usuario.getIdPais().equals("8") ) { // DOM
            nueva.setMunicipio(txtMunicipio.getText().getText());
            nueva.setCuidad(txtCiudad.getText().getText());
            nueva.setPueblo(aPueblo[cboPueblo.getSelectedIndex()]);
        }

        if ( usuario.getIdPais().equals("7") ) { // PR
            nueva.setEntregaDireccion1(txtDEntregaDireccion.getText().getText());
            nueva.setEntregaPueblo(aPueblo[cboDEntregaPueblo.getSelectedIndex()]);
            nueva.setEntregaCodigoPostal(txtDEntregaCodPostal.getText().getText());
        }
    	 
        if ( usuario.getIdPais().equals("8") ) { // DOM
            nueva.setEntregaDireccion1(txtDEntregaDireccion.getText().getText());
            nueva.setEntregaReferencia(txtDEntregaReferencia.getText().getText());
            nueva.setEntregaProvincia(aPueblo[cboDEntregaPueblo.getSelectedIndex()]);
        }
    	 
        nueva.setRefFamiliarNombres(txtRefFamNombres.getText().getText());
        nueva.setRefFamiliarDireccion(txtRefFamDireccion.getText().getText());
        nueva.setRefFamiliarTelefono(txtRefFamTelResi.getText().getText());
        nueva.setRefFamiliarCelular(txtRefFamCelular.getText().getText());

        TipoVinculo tv1 = (TipoVinculo) tipoVinculos.getObjetosFamiliar().elementAt(cboRefFamTipoVinculo.getSelectedIndex() - 1);
        nueva.setRefFamiliarTipoVinculo(tv1.getId());
    	
        nueva.setRefNoFamiliarNombres(txtRefNoFamNombres.getText().getText());
        nueva.setRefNoFamiliarDireccion(txtRefNoFamDireccion.getText().getText());
        nueva.setRefNoFamiliarTelefono(txtRefNoFamTelResi.getText().getText());
        nueva.setRefNoFamiliarCelular(txtRefNoFamCelular.getText().getText());

        TipoVinculo tv2 = (TipoVinculo) tipoVinculos.getObjetosNoFamiliar().elementAt(cboRefNoFamTipoVinculo.getSelectedIndex() - 1);
        nueva.setRefNoFamiliarTipoVinculo(tv2.getId());

        nueva.setProfesion(txtProfesion.getText().getText());
        nueva.setLugarTrabajo(txtLugarTrabajo.getText().getText());
        nueva.setTelefonoTrabajo(txtTelefonoTrabajo.getText().getText());
        nueva.setHoraVisita(sdfTime.formatLocal(txtHoraVisita.getDate()));
        //nueva.setHoraVisita(txtHoraVisita.getText().getText());
        nueva.setNroHijos(txtNroHijos.getText().getText());
        nueva.setNroInfantes(txtNroInfantes.getText().getText());
        nueva.setNroEscolares(txtNroEscolares.getText().getText());
        nueva.setNroSuperior(txtNroSuperior.getText().getText());
        nueva.setNroAdultos(txtNroAdultos.getText().getText());
    	
        nueva.setModo("2");
        nueva.setEnviado("0");
        nueva.setFechaRegistro(Fechas.dateToString("yyyyMMddHHmm"));
        
        RecordLocation record = new RecordLocation();
        record.setFechaVisita(sdf.formatLocal( txtFechaRec.getDate() ));
        record.setObservacion(txtObsRec.getText().getText());
        record.setIMSI(Sistema.getImsi());
        record.setPIN("" + Sistema.getPin());

        if ( usuario.getHabilitaD().equals("1") ) { // si tiene habilidada el gps
            record.setLatitude(gpsLat);
            record.setLongitude(gpsLon);
            record.setMargen("0");
            record.setSatelites("0");
    	} else {
            record.setLatitude("0");
            record.setLongitude("0");
            record.setMargen("0");
            record.setSatelites("0");
    	}
        nueva.setRecord(record);

        nuevas.saveObject(nueva, nuevaSC);
        progress.setTitle("Enviando...");
        
        if ( nuevas.putRemote(nueva) ) {
            nueva.setEnviado("1");
            nueva.setHasError(false);
        	Dialog.inform("La incorporacion se envío con éxito");
        } else {
        	progress.close();
            nueva.setHasError(true);
            if ( nueva.getModo().equals("2") ) {
            	nueva.setModo("1");
            	Dialog.inform("Se produjo un error al enviar la incorporacion, se guardará como Borrador. " + nuevas.getResponse());
            } else {
            	Dialog.inform("Se produjo un error al enviar la incorporacion, " + nuevas.getResponse());
            }
        }
        nuevas.commitChanges();
        
        progress.close();
        nuevas = null;
		close();
    }

    protected boolean onSavePrompt() {
    	boolean result = true;
        if ( nuevaSC != null ) {
            if ( nuevaSC.getModo().equals("1") ) { // MODO DRAFT
            	if ( Dialog.ask(Dialog.D_YES_NO, "Descartar los cambios?") == Dialog.YES ) 
            		result = true;
        		else
        			result = false;
            }
        } else {
        	if ( Dialog.ask(Dialog.D_YES_NO, "Descartar los cambios?") == Dialog.YES ) 
        		result = true;
    		else
    			result = false;
        }
    	return result;
    } 
    
	public void focusChanged(Field field, int eventType) {
        lblEstado.setText("");
	}
}
