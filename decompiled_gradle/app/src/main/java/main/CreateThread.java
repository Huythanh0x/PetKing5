package main;

public class CreateThread extends Thread {
    GameRun gr;

    public CreateThread(GameRun gr_, int type) {
        this.gr = gr_;
        this.gr.threadType = (byte) type;
        new Thread(this).start();
    }

    @Override
    public void run() {
        try {
            this.gr.createOver = (byte) 0;
            if (this.gr.threadType == 0) {
                this.gr.map.initMap();
                this.gr.loadItem();
                this.gr.loadMon(0, this.gr.monster_pro);
                this.gr.loadMon(1, this.gr.monster_pro);
                this.gr.loadInfoList();
            } else if (this.gr.threadType == 1) {
                this.gr.initBattle();
            } else if (this.gr.threadType != 2 && this.gr.threadType != 3 && this.gr.threadType != 4) {
                byte b = this.gr.threadType;
            }
            this.gr.createOver = (byte) -1;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
