package com.belcorp.ui;


import java.util.Date;

import javax.microedition.location.Location;

import com.belcorp.dao.ReingresoDB;
import com.belcorp.dao.TipoDocDB;
import com.belcorp.dao.UsuarioDB;
import com.belcorp.entidades.bc.RecordLocation;
import com.belcorp.entidades.bc.Reingreso;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Estilos;
import com.belcorp.utilidades.Fechas;
import com.belcorp.utilidades.GPSScreen;
import com.belcorp.utilidades.Sistema;
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
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.ButtonField;
import net.rim.device.api.ui.component.DateField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.EditField;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.component.ObjectChoiceField;
import net.rim.device.api.ui.container.MainScreen;
import net.rim.device.api.ui.component.Dialog;


public class Reingresos extends GPSScreen implements FieldChangeListener, FocusChangeListener {
    private mkpyStatusProgress progress = new mkpyStatusProgress("");   
	private TipoDocDB tipodocs = new TipoDocDB();
	private UsuarioDB usuarios = new UsuarioDB();
	private Usuario usuario;
	
	private String gpsLon = "";
	private String gpsLat = "";
	
	private mkpyLabelEditField txtCodConsultora = new mkpyLabelEditField("Cod.Consultora:", "", 7, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtAppaterno = new mkpyLabelEditField("Ap.paterno:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtApmaterno = new mkpyLabelEditField("Ap.materno:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtNombres = new mkpyLabelEditField("Nombres:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelLabelField lblTipoDoc; // = new mkpyLabelChoiceField("Tipo doc:", aTipoDoc, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroDoc; // = new mkpyLabelEditField("Nro doc:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtTelefonoCasa = new mkpyLabelEditField("Teléfono 1:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtTelefonoCelular = new mkpyLabelEditField("Teléfono 2:", "", 10, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE); 
	
	private ButtonField btnGrabar = new ButtonField("Grabar", ButtonField.FIELD_HCENTER | ButtonField.CONSUME_CLICK);
	private LabelField lblEstado = new LabelField("", LabelField.FIELD_RIGHT);
	
	// INICIO: Record
	private mkpyLabelField lblRecord = new mkpyLabelField("Record", LabelField.FIELD_HCENTER | LabelField.NON_FOCUSABLE | LabelField.USE_ALL_WIDTH, Color.WHITE, Estilos.getBGModulo());
	private DateField txtFechaRec = new DateField("Fecha:", (new Date()).getTime(), DateField.DATE | DateField.USE_ALL_WIDTH);
	private mkpyLabelEditField txtObsRec = new mkpyLabelEditField("Observacion:", "", 20, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	// FIN: Record
	
	public boolean onClose() {
    	if(Dialog.ask(Dialog.D_YES_NO, "¿Desea grabar antes de salir?") != Dialog.NO){
    		grabar();
    	}else{
    		close();
    	}
    	return true;
    };
	
	public Reingresos() {
		//setTitle("Reingreso");
        add(new BitmapField(Bitmap.getBitmapResource("img/titulos/reingreso.png"), BitmapField.HCENTER));
		usuario = usuarios.getUsuario();
		
		// JGF: en caso de requerirse deshabilitar GPS
		if(!usuario.getHabilitaD().equals("1"))
		{
			GPSScreen.StopMessure();
    		GPSScreen.CancelTimer();
    		GPSScreen.PrintMessage("GPS deshabilitado!");
		}
		
		lblTipoDoc = new mkpyLabelLabelField("Tipo doc:", usuario.getIdTipoDoc(), ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);
		
		add(txtCodConsultora);
		txtCodConsultora.setChangeListener(this);
		txtCodConsultora.setFocusListener(this);
		add(lblTipoDoc);
        if ( usuario.getIdPais().equals("7") ) { // PR
        	txtNroDoc = new mkpyLabelEditField("Nro doc:", "", 9, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
        }
        if ( usuario.getIdPais().equals("8") ) { // DOM
        	txtNroDoc = new mkpyLabelEditField("Nro doc:", "", 11, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
        }
		add(txtNroDoc);
		txtNroDoc.setChangeListener(this);
		txtNroDoc.setFocusListener(this);
		add(txtAppaterno);
		txtAppaterno.setChangeListener(this);
		txtAppaterno.setFocusListener(this);
		add(txtApmaterno);
		txtApmaterno.setChangeListener(this);
		txtApmaterno.setFocusListener(this);
		add(txtNombres);
		txtNombres.setChangeListener(this);
		txtNombres.setFocusListener(this);
		add(txtTelefonoCasa);
		txtTelefonoCasa.setChangeListener(this);
		txtTelefonoCasa.setFocusListener(this);
		add(txtTelefonoCelular);
		txtTelefonoCelular.setChangeListener(this);
		txtTelefonoCelular.setFocusListener(this);
		
    	if ( usuario.getHabilitaC().equals("1") ) {
        	add(lblRecord);
        	add(txtFechaRec);
    		txtFechaRec.setChangeListener(this);
    		txtFechaRec.setFocusListener(this);
    		
        	add(txtObsRec);
    		txtObsRec.setChangeListener(this);
    		txtObsRec.setFocusListener(this);
    	}
		
		add(btnGrabar);
		btnGrabar.setChangeListener(this);
        setStatus(lblEstado);
	}
	
	public void fieldChanged(Field field, int context) {
        if ( field == btnGrabar ) {
            grabar();
        } else {
            if ( field instanceof mkpyLabelEditField ) {
                lblEstado.setText("" + ( ((mkpyLabelEditField) field).getText().getMaxSize() - ((mkpyLabelEditField) field).getText().getTextLength() ) ); // + (txtZona.getTextLength() - txtZona.getText().length()));
              }
        }
    }
	
	private void grabar() {
		if ( txtCodConsultora.getText().getText().length() == 0 && txtNroDoc.getText().getText().length() == 0  ) {
			Dialog.inform("Debe ingresar un código de consultora o número de documento");
			return;			
		}
		
		if ( txtCodConsultora.getText().getText().length() > 0 ) {
			if ( txtCodConsultora.getText().getText().length() < txtCodConsultora.getText().getMaxSize() ) {
//				int dif = txtCodConsultora.getText().getMaxSize() - txtCodConsultora.getText().getText().length();
//				for(int i = 0; i < dif; i++) {
//					txtCodConsultora.getText().setText("0" + txtCodConsultora.getText().getText());
//				}
				txtCodConsultora.setFocus();
				Dialog.inform("Faltan dígitos en el Código de Consultora.");
				return;
			}
		}

		if ( txtNroDoc.getText().getText().length() > 0 ) {
			if ( txtNroDoc.getText().getText().length() < txtNroDoc.getText().getMaxSize() ) {
//				int dif = txtNroDoc.getText().getMaxSize() - txtNroDoc.getText().getText().length();
//				for(int i = 0; i < dif; i++) {
//					txtNroDoc.getText().setText("0" + txtNroDoc.getText().getText());
//				}
				txtNroDoc.setFocus();
				Dialog.inform("Faltan dígitos en el documento");
				return;
			}
		}
		
		if ( txtAppaterno.getText().getText().length() == 0 ) {
			txtAppaterno.setFocus();
			Dialog.inform("Debe ingresar apellido paterno");
			return;
		}
		if(txtAppaterno.haveNumbers()){
			txtAppaterno.setFocus();
			Dialog.inform("Existen números en el apellido paterno");
			return;
		}
			
			
		if ( txtNombres.getText().getText().length() == 0 ) {
			txtNombres.setFocus();
			Dialog.inform("Debe ingresar nombres");
			return;
		}
		if(txtNombres.haveNumbers()){
			txtNombres.setFocus();
			Dialog.inform("Existen números en el apellido paterno");
			return;
		}
		
		if ( txtTelefonoCasa.getText().getText().length() == 0 && txtTelefonoCelular.getText().getText().length() == 0 ) {
			txtTelefonoCasa.setFocus();
			Dialog.inform("Debe ingresar uno de los telefonos de la solicitante");
			return;
		}
		if ( txtTelefonoCasa.getText().getText().length() > 0 ) {
			if ( txtTelefonoCasa.getText().getText().length() < txtTelefonoCasa.getText().getMaxSize() ) {
				txtTelefonoCasa.setFocus();
				Dialog.inform("Debe ingresar el telefono de la solicitante");
				return;
			}
		}
		if ( txtTelefonoCelular.getText().getText().length() > 0 ) {
			if ( txtTelefonoCelular.getText().getText().length() < txtTelefonoCelular.getText().getMaxSize() ) {
				txtTelefonoCelular.setFocus();
				Dialog.inform("Debe ingresar el telefono 2 de la solicitante");
				return;
			}
		}
		
		gpsLon = "0";
		gpsLat = "0";
		
		// JGF: GPS
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
				/*
				if(Dialog.ask(Dialog.D_OK_CANCEL,"Ubiquese en una zona sin techo de la casa, puede ser la puerta de ingreso")== Dialog.D_OK)
	    		{progress.setTitle("Capturando localización");};
	    		*/
				
				Dialog.ask(Dialog.D_OK_CANCEL,"Ubiquese en una zona sin techo de la casa, puede ser la puerta de ingreso");
				
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
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
        
        ReingresoDB reingresos = new ReingresoDB();
        Reingreso reingreso = new Reingreso();
        reingreso.setCodConsultora(txtCodConsultora.getText().getText());
        reingreso.setApPaterno(txtAppaterno.getText().getText());
        reingreso.setApMaterno(txtApmaterno.getText().getText());
        reingreso.setNombres(txtNombres.getText().getText());
        reingreso.setTipoDocumento("");
        reingreso.setNroDocumento(txtNroDoc.getText().getText());
        reingreso.setTelefonoCasa(txtTelefonoCasa.getText().getText());
        reingreso.setTelefonoCelular(txtTelefonoCelular.getText().getText());
        reingreso.setFechaRegistro(Fechas.dateToString("yyyyMMddHHmm"));
        reingreso.setCampana("");
        reingreso.setEnviado("0");

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
    	reingreso.setRecord(record);
        
        reingresos.saveObject(reingreso);
        progress.setTitle("Enviando...");
        
        if ( reingresos.putRemote(reingreso) ) {
        	reingreso.setEnviado("1");
            reingresos.commitChanges();
        	Dialog.inform("El reingreso se envío con éxito");
        } else {
        	Dialog.inform("Se produjo un error al enviar el reingreso, " + reingresos.getResponse());
        }
        progress.close();
        reingresos = null;
		//Dialog.inform("Se grabó con éxito");
		close();
	}

	public void focusChanged(Field field, int eventType) {
        lblEstado.setText("");
	}

    protected boolean onSavePrompt() {
		if ( Dialog.ask(Dialog.D_YES_NO, "Descartar los cambios?") == Dialog.YES ) 
			return true;
		else
			return false;
    } 
	
}
