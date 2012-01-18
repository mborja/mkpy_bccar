package com.makipuray.ui;

import net.rim.device.api.ui.Graphics;
import net.rim.device.api.ui.component.LabelField;
import net.rim.device.api.ui.decor.BackgroundFactory;

public class mkpyLabelField extends LabelField {
	private int backColor, foreColor;

	public mkpyLabelField(String text, long style, int forecolor, int backcolor) {
		super(text, style);
		this.backColor = backcolor;
		this.foreColor = forecolor;
		super.setBackground(BackgroundFactory.createSolidBackground(backColor));
	}

	public void paint(Graphics g) {
        g.setColor(this.foreColor);
        super.paint(g);		
	}
}
