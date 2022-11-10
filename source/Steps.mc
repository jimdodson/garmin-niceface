using Toybox.ActivityMonitor;
using Toybox.Graphics;
using Toybox.System;

module Steps {

 	function draw(dc) {
        var info = ActivityMonitor.getInfo();
        var stepGoal = info.stepGoal;
        var steps = info.steps;
        if (stepGoal != null && steps != null) {
            var cx = dc.getWidth()/2;
            var cy = dc.getHeight()/2;
            var radius = dc.getHeight()/2 - 5;
            var degreeStart = 270; // 6 o clock

            dc.setPenWidth(10);
            dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLACK);
            var percentOfGoal = steps * 100 / stepGoal;
            if (percentOfGoal > 100) {
                percentOfGoal = 100;
            }
            var angle_steps = percentOfGoal * 1.8;
            if (angle_steps > 0) {
                var degreeEnd = (degreeStart + angle_steps.toLong()) % 360;
                dc.drawArc(cx, cy, radius, Graphics.ARC_COUNTER_CLOCKWISE, degreeStart, degreeEnd);
            }
        }
    }

}