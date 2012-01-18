package com.makipuray.ui;

import net.rim.device.api.ui.Field;
import net.rim.device.api.ui.FieldChangeListener;
import net.rim.device.api.ui.UiApplication;
import net.rim.device.api.ui.component.ButtonField;
import net.rim.device.api.ui.component.Dialog;
import net.rim.device.api.ui.component.EditField;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.container.PopupScreen;
import net.rim.device.api.ui.container.VerticalFieldManager;

public class mkpyDialogInput extends PopupScreen implements FieldChangeListener {
	private EditField input;
	private ButtonField aceptar;
  
	public mkpyDialogInput(String title, int max, long style) {
		super(new VerticalFieldManager(), Field.FOCUSABLE);
		add(new LabelField(title));
		input = new EditField("", "", max, style);
		add(input);

		aceptar = new ButtonField("Aceptar", ButtonField.FIELD_HCENTER | ButtonField.CONSUME_CLICK);
		aceptar.setChangeListener(this);
		add(aceptar);
	}
	  
	public void open() {
		UiApplication.getUiApplication().pushScreen(this);
		input.setText("");
		this.doPaint();
	}
	  
	public EditField getInput() {
		return input;
	}
	
	public boolean onClose() {
		UiApplication.getUiApplication().popScreen(this);
		return true;
	}

	public void fieldChanged(Field field, int context) {
		super.fieldChangeNotify(context);
	}

}
