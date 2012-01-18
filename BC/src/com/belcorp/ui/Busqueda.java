package com.belcorp.ui;

import java.util.Date;

import com.makipuray.ui.mkpyLabelChoiceField;
import com.makipuray.ui.mkpyLabelEditField;
import com.makipuray.ui.mkpyLabelLabelField;
import com.makipuray.ui.mkpyStatusProgress;
import com.belcorp.dao.TipoDocDB;
import com.belcorp.dao.UsuarioDB;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Estilos;

import net.rim.device.api.system.Bitmap;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.FieldChangeListener;
import net.rim.device.api.ui.FocusChangeListener;
import net.rim.device.api.ui.MenuItem;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.ButtonField;
import net.rim.device.api.ui.component.DateField;
import net.rim.device.api.ui.component.EditField;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.component.ObjectChoiceField;
import net.rim.device.api.ui.container.MainScreen;

public class Busqueda extends MainScreen implements FieldChangeListener, FocusChangeListener {
	private String aEstado[] = {"Ambos", "Borrador", "Real"};
	private UsuarioDB usuarios = new UsuarioDB();
	private Usuario usuario;
	private TipoDocDB tipodocs = new TipoDocDB();
    private mkpyStatusProgress progress = new mkpyStatusProgress("");   

	private DateField txtFecha = new DateField("Fecha:", (new Date()).getTime(), DateField.DATE | DateField.USE_ALL_WIDTH);
	//private mkpyLabelEditField txtFecha = new mkpyLabelEditField("Fecha:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtTerritorio = new mkpyLabelEditField("", "", 3, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelLabelField lblTipoDoc; // = new mkpyLabelChoiceField("Tipo doc:", aTipoDoc, 0, ObjectChoiceField.USE_ALL_WIDTH, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtNroDoc;// = new mkpyLabelEditField("Nro doc:", "", 15, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
	private mkpyLabelEditField txtAppaterno = new mkpyLabelEditField("Ap.paterno:", "", 50, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtApmaterno = new mkpyLabelEditField("Ap.materno:", "", 50, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE); 
	private mkpyLabelEditField txtNombres = new mkpyLabelEditField("Nombres:", "", 50, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_DEFAULT, Color.BLACK, Color.WHITE);
	private mkpyLabelChoiceField cboEstado = new mkpyLabelChoiceField("Estado:", aEstado, 0, ObjectChoiceField.FIELD_LEFT, Color.BLACK, Color.WHITE);

	private ButtonField btnBuscar = new ButtonField("Buscar", ButtonField.FIELD_HCENTER | ButtonField.CONSUME_CLICK);
	private LabelField lblEstado = new LabelField("", LabelField.FIELD_RIGHT);

	public Busqueda() {
		usuario = usuarios.getUsuario();

		txtTerritorio.getLabel().setText("Territorio: " +  usuario.getRegion() + "-" + usuario.getZona());
		
		lblTipoDoc = new mkpyLabelLabelField("Tipo doc:", usuario.getIdTipoDoc(), ObjectChoiceField.FIELD_RIGHT, Color.BLACK, Color.WHITE);
		btnBuscar.setChangeListener(this);

        add(new BitmapField(Bitmap.getBitmapResource("img/titulos/buscar.png"), BitmapField.HCENTER));
        add(txtFecha);
//        txtCampana.setChangeListener(this);
//        txtCampana.setFocusListener(this);
		add(txtTerritorio);
		txtTerritorio.setChangeListener(this);
		txtTerritorio.setFocusListener(this);
    	add(lblTipoDoc);

        if ( usuario.getIdPais().equals("7") ) { // PR
        	txtNroDoc = new mkpyLabelEditField("Nro doc.identidad:", "", 9, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
        }
        if ( usuario.getIdPais().equals("8") ) { // DOM
        	txtNroDoc = new mkpyLabelEditField("Nro doc.identidad:", "", 11, EditField.FIELD_LEFT | EditField.NO_NEWLINE | EditField.FILTER_NUMERIC, Color.BLACK, Color.WHITE);
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
		add(cboEstado);
		
		add(btnBuscar);
        setStatus(lblEstado);
        
        addMenuItem(mnBuscar);
	}
	
	private void buscar() {
		//TODO: buscar
		progress.open();
		progress.setTitle("Buscando...");
		progress.close();
		Estilos.pushScreen(new BusquedaResul(txtFecha.getDate(), 
				txtTerritorio.getText().getText(),
				txtNroDoc.getText().getText(),
				txtAppaterno.getText().getText(),
				txtApmaterno.getText().getText(),
				txtNombres.getText().getText(),
				cboEstado.getSelectedIndex()));
	}

	MenuItem mnBuscar = new MenuItem("Buscar", 110, 10) {
        public void run() {
        	buscar();
        }
    };
	
	public void fieldChanged(Field field, int context) {
        if ( field == btnBuscar ) {
        	buscar();
        } else {
            if ( field instanceof mkpyLabelEditField ) {
                lblEstado.setText("" + ( ((mkpyLabelEditField) field).getText().getMaxSize() - ((mkpyLabelEditField) field).getText().getTextLength() ) ); // + (txtZona.getTextLength() - txtZona.getText().length()));
              }
        }
    }

	public void focusChanged(Field field, int eventType) {
        lblEstado.setText("");
	}
	
    protected boolean onSavePrompt() {
        return true;
    } 
}
