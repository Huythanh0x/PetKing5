package javax.microedition.rms;

public interface RecordListener {
    void recordAdded(RecordStore recordStore, int i);

    void recordChanged(RecordStore recordStore, int i);

    void recordDeleted(RecordStore recordStore, int i);
}
