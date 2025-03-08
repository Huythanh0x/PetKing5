package main;

import android.util.Log;
import com.android.Util.AndroidUtil;
import com.nokia.mid.ui.DirectGraphics;
import com.nokia.mid.ui.DirectUtils;
import com.nokia.mid.ui.FullCanvas;
import dm.Ms;
import dm.Sound;
import dm.Sprite;
import dm.Ui;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

public final class MainCanvas extends FullCanvas implements Runnable {
    private static DirectGraphics dg;
    private static Graphics g;
    public static float mainxx;
    public static float mainyy;
    public static float mapxx;
    public static float mapyy;
    public boolean createStop;
    StringBuffer[] dialog;
    int error;
    private byte fisrt_paint;
    private Sprite flashSP;
    XConnection game;
    public int game_state;
    private byte help_state;
    byte iii;
    Image image_logo;
    Image image_logo_word;
    int loop_s;
    private byte ma;
    public int menu_state;
    private byte mt;
    public int prevGameState;
    public int prevMenuState;
    public int prevRunState;
    String errorString = "";
    boolean quitGame = false;
    int logo_c = 0;
    int temp_loop = 0;
    long starttime = 0;
    long timetaken = 0;
    byte battle_c = 9;
    String strTemp = "";
    int[] imageData = null;
    boolean bblack = false;
    public int temp_state = 0;
    int temp_gamestate = 0;
    private boolean haveSoundBeforeHideNotify = false;
    private boolean smsIsSetRun_state = false;
    int load_c = -1;
    GameRun gr = new GameRun(this);
    public SMSSender sender = SMSSender.i(this.gr);
    PointerKey pkey = new PointerKey(this);

    public MainCanvas(XConnection game) {
        this.game = game;
        this.gr.map.pkey = this.pkey;
        this.gr.pkey = this.pkey;
        this.sender.pkey = this.pkey;
        mainxx = Constants_H.WIDTH__ / 640.0f;
        mapxx = Constants_H.WIDTH__ / Constants_H.WIDTH;
        mainyy = Constants_H.HEIGHT__ / 360.0f;
        mapyy = Constants_H.HEIGHT__ / Constants_H.HEIGHT;
    }

    private final void game_init() {
        this.gr.initOffG();
    }

    public final void game_start() {
        new Thread(this).start();
    }

    public final void game_stop() {
        Ms.i().rmsOptions(0, null, 4);
        Sound.i().soundStop();
    }

    @Override
    public void run() {
        while (!this.quitGame) {
            try {
                this.starttime = System.currentTimeMillis();
                if (!SMSSender.isWorking) {
                    AndroidUtil.cv.block();
                    AndroidUtil.cv.close();
                    if (this.game_state != 98) {
                        Sound.i().soundPlay();
                    }
                    switch (this.game_state) {
                        case 20:
                            if (this.gr.createOver == -1) {
                                this.gr.time_count = (byte) 60;
                                paint();
                            } else if (this.gr.time_count < 60) {
                                GameRun gameRun = this.gr;
                                gameRun.time_count = (byte) (gameRun.time_count + 1);
                            }
                            if (this.gr.threadType == 0 && this.gr.createOver == -1 && this.gr.time_count == 60) {
                                Ms.i().rmsOptions(0, null, 4);
                                this.gr.start();
                                break;
                            }
                            break;
                        case 30:
                            this.gr.run_gameRun();
                            if (!this.gr.runPauseIco()) {
                                this.pkey.runMove();
                                break;
                            } else {
                                this.pkey.isGo = false;
                                break;
                            }
                    }
                    Ms.i();
                    if (Ms.keyRepeat) {
                        keyProcess();
                    }
                    Ms.i().runDelay();
                    paint();
                }
                this.timetaken = System.currentTimeMillis() - this.starttime;
                if (Ms.i().getSleep() > 0) {
                    Thread.sleep(Ms.i().getSleep());
                    Ms.i().sleep(0);
                } else {
                    long useTime = 60 - this.timetaken;
                    if (useTime < 10) {
                        useTime = 10;
                    }
                    Thread.sleep(useTime);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                while (!Ms.i().key_Num0()) {
                }
            }
        }
        this.game.destroyApp(true);
    }

    void createFlashImage() {
        if (this.flashSP == null) {
            this.flashSP = Ms.i().createSprite("data/fm", false);
        }
        this.mt = (byte) 0;
        this.ma = (byte) 0;
        this.load_c = 0;
    }

    private void setMenuFrame_C() {
        byte b = (byte) (this.mt + 1);
        this.mt = b;
        if (b > this.flashSP.action(this.load_c, this.ma, 1)) {
            this.mt = (byte) 0;
            byte b2 = (byte) (this.ma + 1);
            this.ma = b2;
            if (b2 >= this.flashSP.aLength(this.load_c)) {
                this.ma = (byte) 0;
                if (this.load_c == 0) {
                    this.load_c = 1;
                }
            }
        }
    }

    void goMain_menu() {
        Sound.i().setMusicId(7);
        Sound.i().setMusic(false);
        this.game_state = 40;
        this.menu_state = 0;
        this.fisrt_paint = (byte) 0;
    }

    public void paint() {
        repaint();
        serviceRepaints();
    }

    public void initGraphics(Graphics _g) {
        g = _g;
        dg = DirectUtils.getDirectGraphics(_g);
        this.gr.initGraphics(g);
        Ui.i().initGraphics(g);
    }

    @Override
    protected void paint(Graphics g2) {
        if (this.game_state != 0) {
            setScale(mainxx, mainyy);
        }
        this.keyxx = mainxx;
        this.keyyy = mainyy;
        initGraphics(g2);
        Ms.i();
        g2.setFont(Ms.font);
        g2.setClip(0, 0, Constants_H.WIDTH_, Constants_H.HEIGHT_);
        switch (this.game_state) {
            case 0:
                paintMobileLogo();
                break;
            case 10:
                Ui.i().fillRect(0, 0, 0, Constants_H.WIDTH_, Constants_H.HEIGHT_);
                Ui.i().drawString(Constants_H.TXT_69, Constants_H.WIDTH_H_, Constants_H.HEIGHT_H_ - 25, 1 | 16, 0, 0);
                Ui.i().drawString(Constants_H.TXT_90, Constants_H.WIDTH_H_, Constants_H.HEIGHT_H_, 1 | 16, 5, 0);
                int HEIGHT_H = 4 | 32;
                Ui.i().drawString(Constants_H.PAUSE_TXT_22, 4, Constants_H.HEIGHT_, HEIGHT_H, 0, 0);
                Ui.i().drawString(Constants_H.PAUSE_TXT_23, Constants_H.WIDTH_ - 4, Constants_H.HEIGHT_, 8 | 32, 0, 0);
                break;
            case 11:
                Ui.i().drawImage(this.image_logo, 0, 0, 0);
                break;
            case 20:
                GameRun gameRun = this.gr;
                byte b = this.gr.time_count;
                int HEIGHT_H2 = Constants_H.HEIGHT_ - 38;
                gameRun.drawChangeMap(true, b, 30, HEIGHT_H2, Constants_H.WIDTH_ - 60);
                break;
            case 30:
                this.gr.paint_gameRun(g2);
                break;
            case 40:
                switch (this.menu_state) {
                    case 0:
                        Ui.i().fillRect(0, 0, 0, Constants_H.WIDTH_, Constants_H.HEIGHT_);
                        Ui.i().drawFrameOne(this.flashSP, this.flashSP.action(this.load_c, this.ma, 0), Constants_H.WIDTH_H_, Constants_H.HEIGHT_H_, 0);
                        setMenuFrame_C();
                        if (this.load_c == 1) {
                            g2.setClip(0, 0, Constants_H.WIDTH_, Constants_H.HEIGHT_);
                            Ui.i().drawK0((Constants_H.WIDTH_H_ - 125) - 5, (Constants_H.HEIGHT_ - 25) - 6, 260, 31, 0);
                            if (this.gr.selectx == 2) {
                                Ui.i().drawVolume(Constants_H.WIDTH_H_ + 6 + 70, Constants_H.HEIGHT_ - 19, Sound.i().getVolume(), true);
                            }
                            Ui.i().drawString(this.gr.action_str[this.gr.selectx], Constants_H.WIDTH_H_, Constants_H.HEIGHT_ + 6, 1 | 32, 3, 1);
                            Ui.i().drawTriangle1(Constants_H.WIDTH_H_, Constants_H.HEIGHT_ - 13, 125, true, true);
                            Ui.i().drawYesNo(true, false);
                            break;
                        } else {
                            Ui.i().drawString(Constants_H.PAUSE_TXT_21, Constants_H.WIDTH_H_, Constants_H.HEIGHT_, 1 | 32, 1, 2);
                            break;
                        }
                    case 2:
                        Ui.i().drawKuang(0, Constants_H.HEIGHT_ - 87, Constants_H.WIDTH_, 58);
                        this.gr.showStringM(this.gr.gogoString, Constants_H.WIDTH_H_, (Constants_H.HEIGHT_ - 87) + 2, 10, 3);
                        Ui.i().drawYesNo(true, true);
                        break;
                    case 4:
                        Ui.i().drawK0(0, 0, Constants_H.WIDTH_, Constants_H.HEIGHT_, 2);
                        this.gr.drawHelpStr(g2, this.gr.about_a, this.gr.line_max, Constants_H.WIDTH_H_, 10, 1 | 16);
                        Ui.i().drawYesNo(false, true);
                        break;
                    case 5:
                        Ui.i().drawK0(0, 0, Constants_H.WIDTH_, Constants_H.HEIGHT_, 2);
                        this.gr.setStringB("\u5ba0\u7269\u738b\u56fd5-\u5f69\u8679#n\u5f00\u53d1\u5546\uff1a#n\u534e\u5a31\u65e0\u7ebf#n\u5ba2\u670d\u7535\u8bdd\uff1a#n010-88901665#n\u5ba2\u670dEmail:#ngeekan@imy.cn", Constants_H.WIDTH_ - 50, 0);
                        this.gr.drawHelpStr(g2, this.gr.about_a, this.gr.line_max, Constants_H.WIDTH_H_, 10, 1 | 16);
                        Ui.i().drawYesNo(false, true);
                        break;
                }
            case 98:
                drawRectBG();
                Ui.i().drawK1(-5, Constants_H.HEIGHT_ - 75, Constants_H.WIDTH_ + 10, 75, 3);
                this.gr.showStringM(Constants_H.PAUSE_TXT_19, Constants_H.WIDTH_H_, (Constants_H.HEIGHT_ - 50) - 2, 9, 3);
                break;
        }
    }

    @Override
    public void hideNotify() {
        hideNotifyMy();
    }

    public boolean checkHaveSoundBeforeHideNotify() {
        System.out.println("checkHaveSoundBeforeHideNotify haveSoundBeforeHideNotify= " + this.haveSoundBeforeHideNotify);
        return this.haveSoundBeforeHideNotify;
    }

    public void hideNotifyMy() {
        System.out.println("hideNotifyMy() run_state= " + GameRun.run_state + " game_state= " + this.game_state);
        Ms.keyRepeat = false;
        if (this.game_state != 98 && GameRun.run_state != 98) {
            this.haveSoundBeforeHideNotify = Sound.i().getHaveSoundPlayState();
            Sound.i().soundStop();
            if (this.game_state != 98) {
                this.temp_gamestate = this.game_state;
            }
            if (GameRun.run_state != 98) {
                this.temp_state = GameRun.run_state;
            }
            GameRun.run_state = 98;
            this.game_state = 98;
        }
    }

    @Override
    public void showNotify() {
        showNotifyMy();
    }

    public void showNotifyMy() {
        System.out.println("showNotifyMy() run_state= " + GameRun.run_state + " game_state= " + this.game_state);
        if (this.game_state == 98) {
            if (GameRun.run_state != -20 && GameRun.run_state != -21) {
                this.game_state = 30;
                System.out.println("\u5728\u8fd9?");
            }
            repaint();
            GameRun.run_state = 98;
            this.game_state = 98;
            System.out.println("\u8fd8\u662f\u5728\u8fd9?");
            Sound.i().soundStop();
            return;
        }
        this.fisrt_paint = (byte) 0;
        System.out.println("\u4e0d\u4f1a\u5728\u8fd9\u5427\uff1f");
    }

    public void setSmsIsSetRun_state(boolean state) {
        System.out.println("setSmsIsSetRun_state state= " + state);
        this.smsIsSetRun_state = state;
    }

    public boolean checkSmsRun_stateIsTrue() {
        System.out.println("checkSmsRun_stateIsTrue smsIsSetRun_state= " + this.smsIsSetRun_state);
        return this.smsIsSetRun_state;
    }

    public void doShowNotify() {
        this.game_state = this.temp_gamestate;
        if (!checkSmsRun_stateIsTrue()) {
            System.out.println("\u5728\u8fd9\uff1f");
            GameRun.run_state = this.temp_state;
        } else {
            setSmsIsSetRun_state(false);
            if (GameRun.run_state == 98) {
                System.out.println("\u5728\u8fd9\uff1f\uff1f");
                GameRun.run_state = this.temp_state;
            }
        }
        if (checkHaveSoundBeforeHideNotify()) {
            Sound.i().setMusic(true);
            Sound.i().setSoundON(true);
            Sound.i().soundPlay();
            Sound.i().soundStart();
        }
    }

    @Override
    public void pointerPressed(int x, int y) {
        if (!SMSSender.isWorking) {
            this.pkey.process(x, y);
        }
    }

    @Override
    public void pointerReleased(int x, int y) {
        Ms.i().keyRelease();
    }

    @Override
    protected final void keyPressed(int key) {
        if (SMSSender.isWorking) {
            System.out.println("");
        } else {
            Ms.keyRepeat = true;
            Ms.key = key;
        }
    }

    @Override
    protected final void keyReleased(int key) {
        Ms.i().keyRelease();
    }

    private final void keyProcess() {
        this.error = 3;
        switch (this.game_state) {
            case 10:
                if (Ms.i().key_S1() || Ms.i().key_S2()) {
                    this.logo_c = 0;
                    Sound.i().setSoundON(Ms.i().key_S1());
                    Sound.i().setVolume(Ms.i().key_S1() ? 30 : 0);
                    Ms.i().keyRelease();
                    this.gr.goMAIN_MENU();
                }
                Ms.i().keyRelease();
                break;
            case 11:
                if (Ms.i().key_S1_Num5()) {
                    Ms.i().keyRelease();
                    this.gr.goMAIN_MENU();
                    break;
                }
                break;
            case 30:
                this.gr.key_gameRun();
                break;
            case 40:
                switch (this.menu_state) {
                    case 0:
                        Ms.i().keyRelease();
                        if (Ms.i().key_Num0()) {
                            this.ma = (byte) 0;
                            this.mt = (byte) 0;
                            this.load_c = 1;
                        } else if (this.load_c == 0) {
                        }
                        if (Ms.i().key_S1_Num5()) {
                            switch (this.gr.selectx) {
                                case 0:
                                    this.gr.skyCheckRegFull(2);
                                    break;
                                case 1:
                                    this.gr.skyCheckRegFull(1);
                                    break;
                                case 2:
                                    Sound.i().keyVolume(0);
                                    Sound.i().setMusicForMenu(true);
                                    break;
                                case 3:
                                    goHELP_dialog(0);
                                    break;
                                case 4:
                                    Log.e("soars", "ABOUT_BUTTON");
                                    goABOUT();
                                    break;
                                case 5:
                                    Log.e("soars", "EXIT_BUTTON");
                                    this.quitGame = true;
                                    this.game.destroyApp(true);
                                    break;
                            }
                        } else if (Ms.i().key_Left_Right()) {
                            this.gr.selectx = Ms.i().select(this.gr.selectx, this.gr.rmsOther[0] == -1 ? 1 : 0, this.gr.action_str.length - 1);
                            break;
                        }
                        break;
                    case 2:
                        if (Ms.i().key_S1_Num5()) {
                            newGame();
                        } else if (Ms.i().key_S2()) {
                            this.menu_state = 0;
                            this.gr.about_a = null;
                        }
                        Ms.i().keyRelease();
                        break;
                    case 4:
                        if (Ms.i().key_S2()) {
                            this.gr.about_a = null;
                            if (this.help_state == 1) {
                                this.game_state = 30;
                                this.gr.doPaint(0);
                                this.gr.goYouPAUSE(2);
                                this.gr.selectx = (byte) 1;
                                this.gr.selecty = (byte) 2;
                                this.gr.setPauseS(this.gr.selectx);
                            } else {
                                goMain_menu();
                                this.gr.select[0][0] = 3;
                            }
                        } else if (Ms.i().key_Up_Down() || Ms.i().key_Left_Right()) {
                            this.gr.help_page = Ms.i().select(this.gr.help_page, 0, this.gr.page_max - 1);
                        }
                        Ms.i().keyRelease();
                        break;
                    case 5:
                        if (Ms.i().key_S2()) {
                            Ms.i().keyRelease();
                            this.gr.about_a = null;
                            Log.e("soars", "gr.about_a dfd");
                            goMain_menu();
                        } else if (Ms.i().key_Up_Down() || Ms.i().key_Left_Right()) {
                            this.gr.help_page = Ms.i().select(this.gr.help_page, 0, this.gr.page_max - 1);
                        }
                        Log.e("soars", "s.i().key_Up_Down()||Ms.i().key");
                        Ms.i().keyRelease();
                        break;
                }
            case 98:
                if (Ms.i().key_Num0() || Ms.i().key_S1_Num5()) {
                    System.out.println("\u6309\u952e\u5904\u7406\u8fd9\u91cc\u6267\u884c\u5417");
                    doShowNotify();
                }
                Ms.i().keyRelease();
                break;
            case 101:
                this.quitGame = true;
                Ms.i().keyRelease();
                break;
        }
    }

    private void goQuit() {
        this.game_state = 101;
    }

    public void drawRectBG() {
        Ui.i().fillRectB();
        int[] vertexX = {0, 10, 20, 10};
        int[] vertexY = {10, 0, 10, 20};
        for (byte j = 0; j < (Constants_H.HEIGHT_ / 20) + 1; j = (byte) (j + 1)) {
            for (byte i = 0; i < (Constants_H.WIDTH_ / 20) + 1; i = (byte) (i + 1)) {
                g.translate(i * 20, j * 20);
                dg.fillPolygon(vertexX, 0, vertexY, 0, 4, -11548673);
                g.translate(i * Constants_H.SMS_PAUSE, j * Constants_H.SMS_PAUSE);
            }
        }
    }

    protected void paintMobileLogo() {
        int WIDTH = Constants_H.WIDTH__;
        int HEIGHT = Constants_H.HEIGHT__;
        int WIDTH_H = Constants_H.WIDTH__ / 2;
        int HEIGHT_H = Constants_H.HEIGHT__ / 2;
        if (this.load_c < 0) {
            this.load_c = 0;
            return;
        }
        g.setClip(0, 0, WIDTH, HEIGHT);
        if (this.load_c >= 0 && this.load_c < 18) {
            g.setClip(0, 0, WIDTH, HEIGHT);
            Ui.i().fillRect(16777215, 0, 0, WIDTH, HEIGHT);
            if (this.load_c == 0) {
                GameRun.g = g;
                this.image_logo = Ms.i().createImage("qq/qqlogo");
            }
            g.drawImage(this.image_logo, WIDTH_H, HEIGHT_H, 1 | 2);
        } else if (this.load_c >= 19 && this.load_c < 37) {
            if (this.load_c == 19) {
                this.image_logo = null;
                this.image_logo = Ms.i().createImage("cwa");
            }
            g.setColor(0);
            Ui.i().fillRect(0, 0, 0, WIDTH, HEIGHT);
            g.drawImage(this.image_logo, WIDTH_H, HEIGHT_H, 1 | 2);
        } else if (this.load_c > 37) {
            this.image_logo = null;
            this.gr.popMenu = (byte) 0;
            this.game_state = 10;
            this.strTemp = Constants_H.TXT_69;
            game_init();
        }
        this.load_c++;
    }

    void goHELP_dialog(int mode) {
        this.game_state = 40;
        this.menu_state = 4;
        this.gr.help_page = (byte) 0;
        this.logo_c = 0;
        this.help_state = (byte) mode;
        this.gr.line_max = (byte) 11;
        this.gr.setStringB("\u6e38\u620f\u5e2e\u52a9#n\u73a9\u5bb6\u626e\u6f14\u4e00\u540d\u5ba0\u7269\u8bad\u7ec3\u5e08\uff0c\u4e3a\u4e86\u89e3\u51b3\u56fd\u5bb6\u7684\u5371\u673a\u800c\u8e0f\u4e0a\u4e86\u5192\u9669\u4e4b\u65c5\u3002#n\u64cd\u4f5c\u63d0\u793a#n\u70b9\u51fb\u4e3b\u7ebf\u4efb\u52a1\u56fe\u6807\uff1a\u4e3b\u7ebf\u4efb\u52a1#n\u70b9\u51fb\u652f\u7ebf\u4efb\u52a1\u56fe\u6807\uff1a\u652f\u7ebf\u4efb\u52a1#n\u70b9\u51fb\u5730\u56fe\u56fe\u6807\uff1a\u6e38\u620f\u5730\u56fe#n\u70b9\u51fb\u5c4f\u5e55\u63a7\u5236\u4e0a\u4e0b\u5de6\u53f3\u79fb\u52a8#n\u672c\u7248\u672c\u53ea\u652f\u6301\u6a2a\u5c4f\u6e38\u620f", Constants_H.WIDTH - 50, 0);
    }

    void goABOUT() {
        Log.e("soars", "goAbout");
        this.game_state = 40;
        this.menu_state = 5;
        this.gr.help_page = (byte) 0;
        this.logo_c = 0;
        this.gr.line_max = (byte) 11;
        this.help_state = (byte) 0;
        this.gr.setStringB("\u5ba0\u7269\u738b\u56fd5-\u5f69\u8679#n\u5f00\u53d1\u5546\uff1a\u534e\u5a31\u65e0\u7ebf#n\u5ba2\u670d\u7535\u8bdd\uff1a#n010-88901665#n\u5ba2\u670dEmail:#ngeekan@imy.cn", Constants_H.WIDTH - 50, 0);
    }

    private void newGame() {
        this.gr.data_init();
        Log.e("test", "new game " + Ms.i().rmsOptions(0, null, 5));
        if (Ms.i().rmsOptions(0, null, 5) == null) {
            this.gr.map.firstDrawMap = (byte) 0;
            Ms.i().rmsOptions(0, null, 3);
            this.gr.initRmsOther();
            Ms.i().rmsOptions(10, this.gr.rmsOther, 2);
            goGameLoading();
            this.gr.map.initSrcEffect(1);
        } else {
            this.gr.say(Constants_H.TXT_72, 0);
        }
        this.gr.about_a = null;
    }

    public void goGameLoading() {
        Log.e("loading", "\u6e38\u620f\u72b6\u6001\uff1aGAME_LOADING");
        this.game_state = 20;
        this.gr.time_count = (byte) 0;
        this.flashSP = null;
        this.gr.map.loadDate_Rms();
        this.gr.loadRmsOther();
        this.gr.map.anole_temp = this.gr.map.anole_type;
        Map map = this.gr.map;
        Ms.i();
        map.anole_type = (byte) Ms.getRandom(5);
        this.gr.map.setAnole();
        paint();
        new CreateThread(this.gr, 0);
    }

    public void skyNewGame() {
        if (this.gr.rmsOther[0] == -1) {
            newGame();
        } else {
            this.menu_state = 2;
            this.gr.gogoString = Constants_H.TXT_68;
        }
    }

    public void skyContinueGame() {
        this.gr.data_init();
        System.gc();
        this.gr.map.firstDrawMap = (byte) 0;
        goGameLoading();
        this.pkey.stopMove();
    }
}
