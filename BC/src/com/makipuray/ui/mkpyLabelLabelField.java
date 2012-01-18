package com.makipuray.ui;

import net.rim.device.api.ui.Font;
import net.rim.device.api.ui.component.BitmapField;
import net.rim.device.api.ui.container.HorizontalFieldManager;
import net.rim.device.api.ui.decor.BackgroundFactory;

public class mkpyLabelLabelField extends HorizontalFieldManager {
	public mkpyLabelLabelField(String title, String value, long style, int color, int backcolor) {
		super(HorizontalFieldManager.NO_HORIZONTAL_SCROLL 
                | HorizontalFieldManager.NO_VERTICAL_SCROLL | HorizontalFieldManager.USE_ALL_WIDTH);

		mkpyLabelField mkpyLabel = new mkpyLabelField(title, style | BitmapField.FIELD_VCENTER, color, backcolor);
        mkpyLabel.setFont(this.getFont().derive(Font.BOLD));
        this.setBackground(BackgroundFactory.createSolidBackground(backcolor));
		this.add(mkpyLabel);
		this.add(new mkpyLabelField(value, style | BitmapField.FIELD_VCENTER, color, backcolor));
	}

}
