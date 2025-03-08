package javax.microedition.rms;

public interface ExtendedRecordListener extends RecordListener {
    int RECORDSTORE_CLOSE = 9;
    int RECORDSTORE_DELETE = 10;
    int RECORDSTORE_OPEN = 8;
    int RECORD_ADD = 1;
    int RECORD_CHANGE = 3;
    int RECORD_DELETE = 4;
    int RECORD_READ = 2;

    void recordEvent(int i, long j, RecordStore recordStore, int i2);

    void recordStoreEvent(int i, long j, String str);
}
