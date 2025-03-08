package main;

import javax.microedition.lcdui.Display;
import javax.microedition.midlet.MIDlet;

public final class XConnection extends MIDlet {
    public MainCanvas gamecanvas = new MainCanvas(this);

    public XConnection() {
        Display.getDisplay(this).setCurrent(this.gamecanvas);
        this.gamecanvas.game_start();
    }

    @Override
    public void startApp() {
        if (this.gamecanvas != null) {
            this.gamecanvas.showNotify();
        }
    }

    @Override
    public void pauseApp() {
        if (this.gamecanvas != null) {
            this.gamecanvas.hideNotify();
        }
    }

    @Override
    public void destroyApp(boolean parm) {
        this.gamecanvas.game_stop();
        notifyDestroyed();
    }
}
