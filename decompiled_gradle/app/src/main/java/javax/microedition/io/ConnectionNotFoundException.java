package javax.microedition.io;

public class ConnectionNotFoundException extends Exception {
    private static final long serialVersionUID = 1;

    public ConnectionNotFoundException() {
    }

    public ConnectionNotFoundException(String s) {
        super(s);
    }
}
