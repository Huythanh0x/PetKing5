package javax.microedition.midlet;

public class MIDletStateChangeException extends Exception {
    private static final long serialVersionUID = 1;

    public MIDletStateChangeException() {
    }

    public MIDletStateChangeException(String s) {
        super(s);
    }
}
