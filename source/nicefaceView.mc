import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.Time.Gregorian;

class nicefaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        dc.setAntiAlias(true);

        // time and date
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var hour = today.hour;
        if (hour == 0) {
            hour = 12;
        }
        if (hour > 12) { 
            hour = hour - 12;
        }
        var timeString = Lang.format("$1$:$2$", [hour,today.min.format("%02d")]);
        var timeView = View.findDrawableById("TimeLabel");
        (timeView as Text).setText(timeString);
        var dateString = Lang.format("$1$ $2$ $3$", [today.day_of_week, today.month, today.day]);
        var dateView = View.findDrawableById("DateLabel");
        (dateView as Text).setText(dateString);

        // heartrate
        var heartRate = Activity.getActivityInfo().currentHeartRate;
        if (heartRate != null) {
            var hrView = View.findDrawableById("HRLabel");
            (hrView as Text).setText(heartRate.toString());
        }

        View.onUpdate(dc);

        Battery.draw(dc);
        Steps.draw(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
