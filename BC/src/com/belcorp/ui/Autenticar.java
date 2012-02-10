package com.belcorp.ui;

/*
 * Login.java
 *
 * © Makipuray, 2008-2011
 * Confidential and proprietary.
 */


import net.rim.device.api.system.Bitmap;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.MenuItem;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.ButtonField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.EditField;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.container.HorizontalFieldManager;
import net.rim.device.api.ui.container.MainScreen;
import net.rim.device.api.ui.container.VerticalFieldManager;
import net.rim.device.api.ui.FieldChangeListener;
import com.belcorp.dao.UsuarioDB;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Estilos;
import com.belcorp.utilidades.Fechas;
import com.makipuray.ui.mkpyLabelEditField;
import com.makipuray.ui.mkpyStatusProgress;

/**
 * 
 */
public class Autenticar extends MainScreen implements FieldChangeListener {
   private mkpyLabelEditField txtZona;
   private ButtonField btnIngresar;
   private mkpyStatusProgress progress = new mkpyStatusProgress(""); 
   private LabelField lblEstado = new LabelField("", LabelField.FIELD_RIGHT);

   public Autenticar() {   
	   VerticalFieldManager vField = new VerticalFieldManager();

       HorizontalFieldManager hField = new HorizontalFieldManager() {
   		protected void sublayout(int width, int height) {
			super.sublayout(super.getScreen().getWidth(), height);
			super.setExtent(super.getScreen().getWidth(), getField(1).getHeight());
			Field field;
			
			field = getField(0);
			layoutChild(field, width / 2 + 20, height);
			setPositionChild(field, 5, 0);
			
			field = getField(1);
			layoutChild(field, width, height);
			setPositionChild(field, (width / 2) + (width / 4) - ( field.getPreferredWidth() / 2), 0);

       	}        	
       };
       txtZona = new mkpyLabelEditField("", "", 15, EditField.NO_NEWLINE | EditField.FIELD_LEFT | EditField.FILTER_INTEGER, Color.BLACK, Color.WHITE);
       txtZona.setChangeListener(this);
       btnIngresar = new ButtonField("Iniciar", ButtonField.FIELD_HCENTER | ButtonField.CONSUME_CLICK);
       btnIngresar.setChangeListener(this);
	   
	   vField.add(new LabelField("Código: ", LabelField.FIELD_LEFT | LabelField.NON_FOCUSABLE));
	   vField.add(txtZona);
	   hField.add(vField);
	   hField.add(new BitmapField(Bitmap.getBitmapResource("img/logo.png"), BitmapField.FIELD_HCENTER | BitmapField.FIELD_VCENTER | BitmapField.USE_ALL_WIDTH));

	   add(new BitmapField(Bitmap.getBitmapResource("img/titulos/login.png"), BitmapField.FIELD_HCENTER));
	   add(new LabelField("", LabelField.USE_ALL_WIDTH));
	   add(hField);
	   
       add(btnIngresar);
       setStatus(lblEstado);
   }

	public boolean onClose() {
		System.exit(0);
		return true;
	}
   
	public void fieldChanged(Field field, int context) {
        if ( field == btnIngresar ) {
            ingresar();
        } 
        if ( field == txtZona ) {
			lblEstado.setText("" + ( ((mkpyLabelEditField) field).getText().getMaxSize() - ((mkpyLabelEditField) field).getText().getTextLength() ) ); // + (txtZona.getTextLength() - txtZona.getText().length()));
        }
    }

    private void ingresar() {
        if ( txtZona.getText().equals("") ) {
            Dialog.inform("Debe ingresar codigo");
            return ;
        }
		UsuarioDB usuarios = new UsuarioDB();
		Usuario usuario = usuarios.getUsuario();
		progress.setTitle("Validando...");
		progress.open();
        if(usuario == null) { //Si el usuario NO existe
            usuarios.setCodigo(txtZona.getText().getText());
            if(usuarios.validar()) {
                usuario = usuarios.getUsuario();
            	usuarios.setUsuario(usuario);
        		progress.setTitle("Sincronizando...");
            	usuarios.sincronizar();
            	progress.close();
            	Estilos.pushScreen(new MenuOpciones());
            } else {
            	progress.close();
                Dialog.inform("Código no valido.");
            }
        } else {
        	if ( usuarios.validaCaducidades() ) { // si se debe resincronizar
                usuarios.setCodigo(txtZona.getText().getText());
                if(usuarios.validar()) {
                    usuario = usuarios.getUsuario();
                	usuarios.setUsuario(usuario);
            		progress.setTitle("Sincronizando...");
                	usuarios.sincronizar();
                	progress.close();
                	Estilos.pushScreen(new MenuOpciones());
                } else {
                	progress.close();
                    Dialog.inform("Equipo asignado llamar a TI.");
                }
        	} else { // las fechas son validas y debe validarse localmente
            	if ( usuario.getRegion().concat(usuario.getZona()).equals(txtZona.getText().getText()) ) {
	            	usuario.setFechaHoraLocal(Fechas.dateToString("yyyyMMddHHmm"));
	            	usuarios.setUsuario(usuario);
                	progress.close();
                	Estilos.pushScreen(new MenuOpciones());
            	} else {
                	progress.close();
                	Dialog.inform("Equipo asignado llamar a TI.");
            	}
        		
        	}
//        	if ( usuario.getRegion().concat(usuario.getZona()).equals(txtZona.getText().getText()) ) {
//            	usuario.setFechaHoraLocal(Fechas.dateToString("yyyyMMddHHmm"));
//            	usuarios.setUsuario(usuario);
//            	if ( usuarios.validaCaducidades() ) { //TODO: debe mostrar el dialogo de progreso si es que hay cambios
//                	progress.close();
//                    Estilos.pushScreen(new MenuOpciones());
//            	} else {
//                	progress.close();
//            	}
//        	} else {
//            	progress.close();
//                Dialog.inform("Codigo no valido.");
//        	}
        }
    }

    MenuItem miSalir = new MenuItem ("Salir", 110, 10) {
        public void run() {
           System.exit(0);
        }
    };
    
    protected boolean onSavePrompt() {
           return true;
    } 

} 
