package javax.microedition.rms;

public class RecordStoreNotOpenException extends RecordStoreException {
    private static final long serialVersionUID = 1;

    public RecordStoreNotOpenException(String message) {
        super(message);
    }

    public RecordStoreNotOpenException() {
    }
}
