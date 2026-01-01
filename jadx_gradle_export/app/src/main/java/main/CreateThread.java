package main;

/* loaded from: classes.dex */
public class CreateThread extends Thread {
    GameRun gr;

    public CreateThread(GameRun gr_, int type) {
        this.gr = gr_;
        GameRun gr = this.gr;
        byte threadType = (byte) type;
        gr.threadType = threadType;
        Thread thread = new Thread(this);
        thread.start();
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        try {
            this.gr.createOver = (byte) 0;
            byte threadType = this.gr.threadType;
            if (threadType == 0) {
                this.gr.map.initMap();
                this.gr.loadItem();
                this.gr.loadMon(0, this.gr.monster_pro);
                this.gr.loadMon(1, this.gr.monster_pro);
                this.gr.loadInfoList();
            } else {
                byte one = 1;
                if (threadType == one) {
                    this.gr.initBattle();
                } else {
                    byte two = 2;
                    byte three = 3;
                    byte four = 4;
                    if (threadType != two && threadType != three && threadType != four) {
                        byte b = threadType;
                    }
                }
            }
            this.gr.createOver = (byte) -1;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
