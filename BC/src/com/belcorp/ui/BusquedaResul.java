package com.belcorp.ui;

import java.util.Vector;

import com.belcorp.dao.NuevaDB;
import com.belcorp.dao.TipoDocDB;
import com.belcorp.dao.UsuarioDB;
import com.belcorp.entidades.bc.Nueva;
import com.belcorp.entidades.bc.Usuario;
import com.belcorp.utilidades.Estilos;

import net.rim.device.api.system.Bitmap;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.DrawStyle;
import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.FieldChangeListener;
import net.rim.device.api.ui.FocusChangeListener;
import net.rim.device.api.ui.Graphics;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.ListField;
import net.rim.device.api.ui.component.ListFieldCallback;
import net.rim.device.api.ui.container.MainScreen;

//public class BusquedaResul extends MainScreen implements FieldChangeListener, FocusChangeListener, ListFieldCallback {
public class BusquedaResul extends MainScreen implements ListFieldCallback {
    private ListField lstResult;
	private NuevaDB nuevas = new NuevaDB();
	private UsuarioDB usuarios = new UsuarioDB();
	private Usuario usuario;
	private TipoDocDB tipodocs = new TipoDocDB();
	private Vector result;
	private long fecha;
	private String territorio, nroDoc, paterno, materno, nombres;
	private int modo;
	
	public BusquedaResul(long fecha, String territorio, String nroDoc, String paterno, String materno, String nombres, int modo) {
		this.fecha = fecha;
		this.territorio = territorio;
		this.nroDoc = nroDoc;
		this.paterno = paterno;
		this.materno = materno;
		this.nombres = nombres;
		this.modo = modo;
		
		usuario = usuarios.getUsuario();

		result = nuevas.getObjectBy(fecha, territorio, nroDoc, paterno, materno, nombres, modo);
		//setTitle("Resultado ");
        add(new BitmapField(Bitmap.getBitmapResource("img/titulos/resultado.png"), BitmapField.HCENTER));
		lstResult = new ListField(result.size(), ListField.FIELD_HCENTER);
		lstResult.setRowHeight( this.getFont().getHeight() * 2 );
		lstResult.setCallback(this);
        add(lstResult);
	}

	protected void onExposed() {
//		close();
		result = nuevas.getObjectBy(fecha, territorio, nroDoc, paterno, materno, nombres, modo);
		lstResult.invalidate();
	}
		
    protected boolean onSavePrompt() {
        return true;
    }

    protected boolean navigationMovement(int dx, int dy, int status, int time) {
        Field field = this.getFieldWithFocus();
        if(field == lstResult) {
        	lstResult.invalidate(lstResult.getSelectedIndex() + dy);
        	lstResult.invalidate(lstResult.getSelectedIndex());
        }
        return super.navigationMovement(dx, dy, status, time);
    }
    
	protected boolean navigationClick(int status, int time) {
		Field field = this.getFieldWithFocus();
		if(field == lstResult) {
	        Nueva item = (Nueva) get(lstResult, lstResult.getSelectedIndex());
        	Estilos.pushScreen(new Nuevas(item));
			return true;
		}
		return super.navigationClick(status, time);
	}
    
	public void drawListRow(ListField listField, Graphics g, int index, int y, int w) {
        Nueva item = (Nueva) get(listField, index);
        if ( listField.getSelectedIndex() == index ) {
        } else {
            g.setColor(Estilos.getColorInterlinea(index -1 ));
            if ( item.isHasError() ) {
                g.setBackgroundColor(Color.RED);
            } else {
                g.setBackgroundColor(Estilos.getBGInterlinea(index - 1));
            }
            g.clear();
        }
        if ( item.getEnviado().equals("0") ) {
            g.drawText("* " + item.getTerritorio(), 0, y, DrawStyle.LEFT, w);
        } else {
            g.drawText(item.getTerritorio(), 0, y, DrawStyle.LEFT, w);
        }
        g.drawText(usuario.getIdTipoDoc() + " ***" + item.getNroDocumento().substring(item.getNroDocumento().length() - 4, item.getNroDocumento().length()), 0, y, DrawStyle.RIGHT, w);
        g.drawText(item.getApPaterno() + ", " + item.getNombres(), 0, y + this.getFont().getHeight(), DrawStyle.LEFT, w);
	}

	public Object get(ListField listField, int index) {
		return result.elementAt(index);
	}

	public int getPreferredWidth(ListField listField) {
		return 0;
	}

	public int indexOfList(ListField listField, String prefix, int start) {
		return 0;
	}	
}
