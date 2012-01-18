package com.makipuray.ui;

import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.FieldChangeListener;
import net.rim.device.api.ui.Font;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.component.ObjectChoiceField;
import net.rim.device.api.ui.container.HorizontalFieldManager;
import net.rim.device.api.ui.decor.BackgroundFactory;

public class mkpyLabelChoiceField extends HorizontalFieldManager implements FieldChangeListener {
	private mkpyLabelField mkpyLabel;
	private ObjectChoiceField opciones;
	
	public mkpyLabelChoiceField(String label, String[] value, int index, long style, int color, int backcolor) {
		super(HorizontalFieldManager.NO_HORIZONTAL_SCROLL 
                | HorizontalFieldManager.NO_VERTICAL_SCROLL | HorizontalFieldManager.USE_ALL_WIDTH);
		mkpyLabel = new mkpyLabelField(label, style | BitmapField.FIELD_VCENTER, color, backcolor);
		opciones = new ObjectChoiceField("", value, 0, BitmapField.FIELD_VCENTER | BitmapField.USE_ALL_WIDTH);
		opciones.setChangeListener(this);
		opciones.setSelectedIndex(index);
		
		super.setBackground(BackgroundFactory.createSolidBackground(backcolor));
        mkpyLabel.setFont(this.getFont().derive(Font.BOLD));
		this.add(mkpyLabel);
		this.add(opciones);

	}

	public ObjectChoiceField getOptions() {
		return opciones;
	}
	
	public int getSelectedIndex() {
		return opciones.getSelectedIndex();
	}
	
	public void setSelectedIndex(int index) {
		opciones.setSelectedIndex(index);
	}

	public void fieldChanged(Field field, int context) {
		super.fieldChangeNotify(context);
	}
}
