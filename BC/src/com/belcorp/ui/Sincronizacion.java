package com.belcorp.ui;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Vector;

import javax.microedition.io.Connector;
import javax.microedition.io.file.FileConnection;

import com.belcorp.dao.NuevaDB;
import com.belcorp.dao.ReingresoDB;
import com.belcorp.dao.SeguimientoDB;
import com.belcorp.entidades.bc.Nueva;
import com.belcorp.entidades.bc.Reingreso;
import com.belcorp.entidades.bc.Seguimiento;
import com.belcorp.utilidades.Estilos;
import com.belcorp.utilidades.Fechas;
import com.makipuray.ui.mkpyStatusProgress;

import net.rim.device.api.system.Bitmap;
import net.rim.device.api.ui.Color;
import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.Graphics;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.ListField;
import net.rim.device.api.ui.component.ListFieldCallback;
import net.rim.device.api.ui.container.MainScreen;

public class Sincronizacion extends MainScreen implements ListFieldCallback {
    private ListField menu;
    private mkpyStatusProgress progress = new mkpyStatusProgress(""); 

    private NuevaDB nuevas = new NuevaDB();
    private Vector incSinEnviar = new Vector();

    private SeguimientoDB seguimientos = new SeguimientoDB();
    private Vector segSinEnviar = new Vector();
    
    private ReingresoDB reingresos = new ReingresoDB();
    private Vector reingSinEnviar = new Vector();

    boolean cont = false;
	private String[] acciones = {" Incorporaciones", " Seguimientos", " Reingresos"}; 
	private String[] opciones = {"Pendientes", "", "", "", 
			"Contingencia", " Generar archivos"};

	public Sincronizacion() {
		//setTitle("Sincronización");
        add(new BitmapField(Bitmap.getBitmapResource("img/titulos/sincronizacion.png"), BitmapField.HCENTER));
		
        menu = new ListField(opciones.length, ListField.FIELD_HCENTER);
        menu.setCallback(this);
        cuentaPendientes();
        add(menu);
	}
	
	private void cuentaPendientes() {
		incSinEnviar = nuevas.getSinEnviar();
		segSinEnviar = seguimientos.getSinEnviar();
		reingSinEnviar = reingresos.getSinEnviar();
		
		opciones[1] = acciones[0] + " (" + incSinEnviar.size() + ")";
		opciones[2] = acciones[1] + " (" + segSinEnviar.size() + ")";
		opciones[3] = acciones[2] + " (" + reingSinEnviar.size() + ")";
		
		menu.invalidate();
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
			if ( menu.getSelectedIndex() == 1 ) {
				enviarNuevas();
			}
			if ( menu.getSelectedIndex() == 2 ) {
				enviarSeguimientos();
			}
			if ( menu.getSelectedIndex() == 3 ) {
				enviarReingresos();
			}
			if ( menu.getSelectedIndex() == 5 ) {
				grabarArchivos();
			}
			return true;
		}
		return super.navigationClick(status, time);
	}
	
	private void grabarArchivos() {
		int n = incSinEnviar.size();
		progress.setTitle("Grabando...");
		progress.open();
		
		try {
			FileConnection fc1 = (FileConnection) Connector.open("file:///SDCard/incorporaciones" + Fechas.dateToString("yyyMMddHHmmss") + ".txt", Connector.READ_WRITE);
			if ( ! fc1.exists() )
				fc1.create();
			OutputStream os = fc1.openOutputStream();
			for (int i = 0; i < n; i++) {
				Nueva item = (Nueva) incSinEnviar.elementAt(i);
				byte[] tmp = nuevas.objectToBytes(item);

				os.write(tmp);
				os.write('\n');
				os.write('\r');
				  
				item.setEnviado("1");
				item.setHasError(false);
				nuevas.commitChanges();
			}
			os.close(); 
			fc1.close(); 
		} catch (Exception e) {
			Dialog.inform("Error al grabar incorporaciones, verifique con soporte." + e.getMessage());
			e.printStackTrace();
		}
		
		try {
			FileConnection fc1 = (FileConnection) Connector.open("file:///SDCard/seguimientos" + Fechas.dateToString("yyyMMddHHmmss") + ".txt", Connector.READ_WRITE);
			if ( ! fc1.exists() )
				fc1.create();
			OutputStream os = fc1.openOutputStream();
			n = segSinEnviar.size();
			for (int i = 0; i < n; i++) {
				Seguimiento item = (Seguimiento) segSinEnviar.elementAt(i);
				byte[] tmp = seguimientos.objectToBytes(item);

				os.write(tmp);
				os.write('\n');
				  
				item.setEnviado("1");
				seguimientos.commitChanges();
			}
			os.close(); 
			fc1.close(); 
		} catch (Exception e) {
			Dialog.inform("Error al grabar seguimientos, verifique con soporte." + e.getMessage());
			e.printStackTrace();
		}

		try {
			FileConnection fc1 = (FileConnection) Connector.open("file:///SDCard/reingresos" + Fechas.dateToString("yyyMMddHHmmss") + ".txt", Connector.READ_WRITE);
			if ( ! fc1.exists() )
				fc1.create();
			OutputStream os = fc1.openOutputStream();
			n = reingSinEnviar.size();
			for (int i = 0; i < n; i++) {
				Reingreso item = (Reingreso) reingSinEnviar.elementAt(i);
				byte[] tmp = reingresos.objectToBytes(item);

				os.write(tmp);
				os.write('\n');
				os.write('\r');
				  
				item.setEnviado("1");
				reingresos.commitChanges();
			}
			os.close(); 
			fc1.close(); 
		} catch (Exception e) {
			Dialog.inform("Error al grabar reingresos, verifique con soporte." + e.getMessage());
			e.printStackTrace();
		}

		cuentaPendientes();
		progress.close();

	}
	
	private void enviarNuevas() {
		int n = incSinEnviar.size();
		progress.setTitle("Enviando...");
		progress.open();
		
		for (int i = 0; i < n; i++) {
			Nueva item = (Nueva) incSinEnviar.elementAt(i);
			progress.setTitle("Enviando " + i + " de " + n + " ...");
			if ( nuevas.putRemote(item) ) {
	            item.setEnviado("1");
	            item.setHasError(false);
			} else {
	            item.setHasError(true);
			}
            nuevas.commitChanges();
		}
		cuentaPendientes();
		progress.close();
	}

	private void enviarSeguimientos() {
		int n = segSinEnviar.size();
		progress.setTitle("Enviando...");
		progress.open();
		for (int i = 0; i < n; i++) {
			Seguimiento item = (Seguimiento) segSinEnviar.elementAt(i);
			progress.setTitle("Enviando " + i + " de " + n + " ...");
			if ( seguimientos.putRemote(item) ) {
	            item.setEnviado("1");
	            seguimientos.commitChanges();
			} 
		}
		cuentaPendientes();
		progress.close();
	}

	private void enviarReingresos() {
		int n = reingSinEnviar.size();
		progress.setTitle("Enviando...");
		progress.open();
		for (int i = 0; i < n; i++) {
			Reingreso item = (Reingreso) reingSinEnviar.elementAt(i);
			progress.setTitle("Enviando " + i + " de " + n + " ...");
			if ( reingresos.putRemote(item) ) {
	            item.setEnviado("1");
	            reingresos.commitChanges();
			} 
		}
		cuentaPendientes();
		progress.close();
	}

	public void drawListRow(ListField list, Graphics g, int index, int y, int w) {
        if ( list.getSelectedIndex() == index ) {
        } else {
            g.setColor(Color.WHITE);
        	if ( index == 0 || index == 4 ) {
                g.setBackgroundColor(Estilos.getBGModulo());
            } else  {
                g.setBackgroundColor(Estilos.getBGSubModulo());
            }
            g.clear();
        }
        g.drawText(get(index), 0, y, 0, w);
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
