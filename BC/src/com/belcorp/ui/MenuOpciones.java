package com.belcorp.ui;

import net.rim.device.api.system.Bitmap;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.Graphics;
//import net.rim.device.api.ui.MenuItem;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.component.ListField;
import net.rim.device.api.ui.component.ListFieldCallback;
import net.rim.device.api.ui.container.MainScreen;
import com.belcorp.dao.UsuarioDB;
import com.belcorp.utilidades.Cadenas;
import com.belcorp.utilidades.Estilos;

public class MenuOpciones extends MainScreen implements ListFieldCallback {        
    private LabelField lblGerente, lblCampana;
    private ListField menu;
    boolean cont = false;
	private String[] opciones;
    
	public boolean onClose() {
    	if(Dialog.ask(Dialog.D_YES_NO, "Desea salir del aplicativo?") != Dialog.NO)
    		System.exit(0);
    	return true;
    };
       
    public MenuOpciones() {
        UsuarioDB usuarios = new UsuarioDB();
        lblGerente = new LabelField(usuarios.getUsuario().getNombres() + " " + usuarios.getUsuario().getAppaterno() + " " + usuarios.getUsuario().getApmaterno(), LabelField.FIELD_HCENTER | LabelField.ELLIPSIS);
        lblCampana = new LabelField(usuarios.getUsuario().getCampana(), LabelField.FIELD_HCENTER);
        opciones = Cadenas.lsMenuOpciones(usuarios.getUsuario());
        menu = new ListField(opciones.length, ListField.FIELD_HCENTER);
        menu.setCallback(this);

        add(new BitmapField(Bitmap.getBitmapResource("img/titulos/menuprincipal.png"), BitmapField.HCENTER));
        add(lblGerente);
        add(lblCampana);
        add(menu);
//        addMenuItem(salir);
    }

    protected boolean navigationMovement(int dx, int dy, int status, int time) {
        Field field = this.getFieldWithFocus();
        if(field == menu) {
                menu.invalidate(menu.getSelectedIndex() + dy);
                menu.invalidate(menu.getSelectedIndex());
        }
        return super.navigationMovement(dx, dy, status, time);
    }
    
	protected boolean navigationClick(int status, int time) {
		Field field = this.getFieldWithFocus();
		if(field == menu) {
			int index = menu.getSelectedIndex(); 
	    	String texto = get(index);
			if ( texto.equals(Cadenas.getOpcion(1)) ) {
	        	Estilos.pushScreen(new Nuevas(null));
			}
			if ( texto.equals(Cadenas.getOpcion(2)) ) {
	        	Estilos.pushScreen(new Busqueda());
			}
			if ( texto.equals(Cadenas.getOpcion(4)) ) {
	        	Estilos.pushScreen(new Seguimientos());
			}
			if ( texto.equals(Cadenas.getOpcion(5)) ) {
	        	Estilos.pushScreen(new Reingresos());
			}
			if ( texto.equals(Cadenas.getOpcion(7)) ) {
	        	Estilos.pushScreen(new Sincronizacion());
			}
			return true;
		}
		return super.navigationClick(status, time);
	}

    public void drawListRow(ListField list, Graphics g, int index, int y, int w) {
    	String texto = get(index);
        if ( list.getSelectedIndex() == index ) {
        } else {
            g.setColor(Color.WHITE);
        	//if ( index == 0 || index == 3 || index == 6 ) {
        	if ( texto.equals(Cadenas.getOpcion(0)) || texto.equals(Cadenas.getOpcion(3)) || texto.equals(Cadenas.getOpcion(6)) ) {
                g.setBackgroundColor(Estilos.getBGModulo());
            } else  {
                g.setBackgroundColor(Estilos.getBGSubModulo());
            }
            g.clear();
        }
        g.drawText(texto, 0, y, 0, w);
    }

    public String get(int index) {
        return opciones[index];
    }

    public int getPreferredWidth(ListField arg0) {
        return 0;
    }

    public int indexOfList(ListField arg0, String arg1, int arg2) {
        return 0;
    }

    public Object get(ListField listField, int index) {
        return null;
    }
}
