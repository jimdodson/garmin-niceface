using Toybox.System;
using Toybox.Graphics;

module Battery {

	function draw(dc) {
        var cx = dc.getWidth()/2;
        var cy = dc.getHeight()/2;
        var radius = dc.getHeight()/2 - 5;
        var degreeStart = 270; // 6 o clock

        var battery = System.getSystemStats().battery;
        var barColor = Graphics.COLOR_GREEN;
        if (battery < 60) {
            barColor = Graphics.COLOR_YELLOW;
        }
        if (battery < 30) {
            barColor = Graphics.COLOR_DK_RED;
        }

        dc.setPenWidth(10);
		dc.setColor(barColor, Graphics.COLOR_BLACK);
       	var angle_battery = battery * 1.8;
       	if (angle_battery > 0) {
            var degreeEnd = (degreeStart - angle_battery.toLong()) % 360;
       		dc.drawArc(cx, cy, radius, Graphics.ARC_CLOCKWISE, degreeStart, degreeEnd);
       	}
    }

}