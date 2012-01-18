package com.makipuray.ui;

import net.rim.device.api.ui.component.ObjectChoiceField;
import net.rim.device.api.ui.decor.BackgroundFactory;

public class mkpyObjectChoiceField extends ObjectChoiceField {
	public mkpyObjectChoiceField(String label, Object[] choices,
			int initialIndex, long style, int backColor) {
		super(label, choices, initialIndex, style);
		super.setBackground(BackgroundFactory.createSolidBackground(backColor));		
	}

}
