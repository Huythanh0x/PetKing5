package javax.microedition.lcdui;

import javax.microedition.midlet.MIDlet;

public class Display {
    private static Canvas canvas;

    private Display() {
    }

    public static Display getDisplay(MIDlet midlet) {
        return new Display();
    }

    public static Canvas getCanvas() {
        return canvas;
    }

    public void setCurrent(Canvas gCanvas) {
        CwaActivity.getInstance().setCanvas(gCanvas);
        canvas = gCanvas;
    }
}
