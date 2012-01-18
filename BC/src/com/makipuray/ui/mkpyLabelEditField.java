package com.makipuray.ui;


import com.belcorp.utilidades.*;

import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.FieldChangeListener;
import net.rim.device.api.ui.Font;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.container.HorizontalFieldManager;

public class mkpyLabelEditField extends HorizontalFieldManager implements FieldChangeListener {
	private mkpyLabelField mkpyLabel;
	private mkpyEditField mkpyEdit;
	
	public mkpyLabelEditField(String label, String value, int size, long style, int color, int backcolor) {
		super(HorizontalFieldManager.NO_HORIZONTAL_SCROLL 
                | HorizontalFieldManager.NO_VERTICAL_SCROLL | HorizontalFieldManager.USE_ALL_WIDTH);
		
		mkpyLabel = new mkpyLabelField(label, style  | BitmapField.FIELD_VCENTER, color, backcolor);
		mkpyEdit = new mkpyEditField(null, value, size, style | BitmapField.FIELD_VCENTER, backcolor);
		mkpyEdit.setChangeListener(this);
		
        mkpyLabel.setFont(this.getFont().derive(Font.BOLD));
		this.add(mkpyLabel);
		this.add(mkpyEdit);
	}
	
	public mkpyEditField getText() {
		return mkpyEdit;
	}

	public mkpyLabelField getLabel() {
		return mkpyLabel;
	}
	
	public void fieldChanged(Field field, int context) {
		super.fieldChangeNotify(context);
	}
	
	public boolean haveNumbers(){
		 return Cadenas.existenNumeros(mkpyEdit.getText());
	}
}
