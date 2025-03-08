package main;

import android.util.Log;
import com.PetKing5_480x800.PetKing5;
import dm.Ms;
import dm.Sound;
import dm.Ui;
import java.lang.reflect.Array;

public class SMSSender implements Key_H {
    public static GameRun gr;
    public static boolean isWorking;
    public static PetKing5 pk;
    public static SMSSender smsSender;
    public static byte smsType;
    private StringBuffer[] about;
    private byte currentPage;
    public byte idSmsLevel;
    private String[][] menuTxt;
    public byte menu_state;
    public PointerKey pkey;
    public byte showLine;
    public byte tMyState;
    private int tState;
    private byte totalPage;
    public boolean sms_a = true;
    public boolean sms_b = false;
    public byte[][] menu = {new byte[]{0, 2, 4, 5}, new byte[]{6}, new byte[]{7}, new byte[]{8}, new byte[]{2}};
    public byte[] sel = new byte[2];
    public byte[][] smsCount = {new byte[]{4, 1, 1}, new byte[]{2, 1, 2}, new byte[]{4, 1, 3}, new byte[]{1, 1, 4}, new byte[]{2, 1, 5}, new byte[]{1, 1, 0}, new byte[]{2, 1, 6}, new byte[]{2, 1, 5}};
    public byte sendSms = -1;

    public SMSSender(GameRun gr_) {
        gr = gr_;
        smsSender = this;
        try {
            createSMS();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static SMSSender i(GameRun gr_) {
        if (smsSender == null) {
            smsSender = new SMSSender(gr_);
        }
        return smsSender;
    }

    private void createSMS() {
        this.menuTxt = new String[][]{new String[]{"\u5546\u57ce"}, new String[]{"\u8d2d\u4e7030000\u91d1", ""}, new String[]{"\u8d2d\u4e705000\u91d1", "\u8eab\u4e3a\u56db\u5927\u5bb6\u65cf\u4e4b\u9996\u7684\u8d35\u516c\u5b50\uff0c\u6ca1\u94b1\u53ef\u4e0d\u884c\uff01\u7acb\u523b\u62e5\u67095000\u91d1\u3002"}, new String[]{"\u8d2d\u4e7050\u5fbd\u7ae0", ""}, new String[]{"\u8d2d\u4e7010\u5fbd\u7ae0", "\u8d2d\u4e70\u8be5\u7279\u6b8a\u9053\u5177\uff0c\u7acb\u523b\u62e5\u670910\u5fbd\u7ae0\uff0c\u80fd\u8d2d\u4e70\u53cc\u500d\u7ecf\u9a8c\uff0c\u5ba0\u7269\u6280\u80fd\uff0c\u5f3a\u5927\u7684\u5ba0\u7269\u6355\u83b7\u7403\u7b49\u5404\u79cd\u795e\u5947\u7684\u9053\u5177\u3002"}, new String[]{"\u5ba0\u7269\u53475\u7ea7", "\u8ba9\u60a8\u968f\u8eab\u643a\u5e26\u7684\u5168\u90e8\u5ba0\u7269\u7acb\u523b\u53475\u7ea7\uff08\u8d85\u8fc770\u7ea7\u5ba0\u7269\u4e0d\u80fd\u518d\u5347\u7ea7\uff09"}, new String[]{"\u8d2d\u4e70\u5947\u5f02\u517d", "\u8d2d\u4e70\u8be5\u7279\u6b8a\u9053\u5177\uff0c\u83b7\u5f97\u53ef\u7231\u7684\u5947\u5f02\u517d\uff0c\u79fb\u52a8\u901f\u5ea6\u53ef\u4ee5\u63d0\u9ad8\u4e00\u500d\uff0c\u4e14\u4e0d\u4f1a\u9047\u5230\u4efb\u4f55\u654c\u4eba\uff01\u65e0\u9650\u4f7f\u7528\uff0c\u5fc3\u52a8\u4e0d\u5982\u884c\u52a8\uff0c\u5feb\u8d2d\u4e70\u5427\uff01"}, new String[]{"\u6b63\u7248\u9a8c\u8bc1", "\u6e38\u620f\u8bd5\u73a9\u7ed3\u675f\uff0c\u8d2d\u4e70\u6b64\u9879\u5c06\u5f00\u542f\u540e\u7eed\u6240\u6709\u6e38\u620f\u5185\u5bb9\u3001\u5730\u56fe\u3002\u540c\u65f6\u5c06\u514d\u8d39\u8d60\u9001\u60a85\u679a\u5fbd\u7ae0\uff08\u53ef\u8d2d\u4e70\u5f3a\u529b\u9053\u5177\uff09"}, new String[]{"\u5347\u7ea7\u590d\u6d3b", "\u8ba9\u60a8\u643a\u5e26\u7684\u6240\u6709\u5ba0\u7269\u5168\u6062\u590d\uff0c\u540c\u65f6\u7acb\u523b\u8ba9\u60a8\u643a\u5e26\u7684\u5ba0\u7269\u63d0\u53475\u7ea7\uff08\u8d85\u8fc770\u7ea7\u5ba0\u7269\u4e0d\u80fd\u518d\u5347\u7ea7\uff09\uff0c\u8ba9\u63a5\u4e0b\u6765\u7684\u6218\u6597\u53d8\u7684\u66f4\u8f7b\u677e\u3002"}};
    }

    public void go(int menu_state_, boolean bb) {
        if (bb) {
            this.tState = GameRun.run_state;
            this.tMyState = gr.map.my.state;
        } else {
            this.tState = -1;
        }
        this.sms_a = true;
        this.sms_b = false;
        GameRun.run_state = -20;
        this.menu_state = (byte) menu_state_;
        byte[] bArr = this.sel;
        byte[] bArr2 = this.sel;
        byte b = (byte) (this.menu[this.menu_state].length > 1 ? 1 : 0);
        bArr2[1] = b;
        bArr[0] = b;
        smsType = (byte) (this.menu[this.menu_state][this.sel[0]] - 1);
        goWord();
        if (smsType == 5 || smsType == 6 || smsType == 7 || (this.menu_state == 4 && smsType == 1)) {
            this.sendSms = (byte) 1;
        } else {
            this.sendSms = (byte) -1;
            isWorking = false;
        }
    }

    private void goWord() {
        this.showLine = (byte) 3;
    }

    public void paint() {
        draw();
    }

    public void run() {
        if (this.sendSms == 1) {
            this.sendSms = (byte) 2;
            pk.setSmshah();
        }
    }

    public void setSmsType() {
        smsType = (byte) (this.menu[this.menu_state][this.sel[0]] - 1);
    }

    public void key() {
        if (this.sendSms == -1 && Ms.i().key_Up_Down()) {
            if (!Ms.i().key_delay() && this.menu[this.menu_state].length > 1) {
                Ms.i().selectS(this.sel, 1, this.menu[this.menu_state].length, this.showLine);
                setSmsType();
                return;
            }
            return;
        }
        if ((this.sendSms == -1 || this.sendSms == 0) && Ms.i().key_S1()) {
            Ms.i().keyRelease();
            if (smsType == 4 && this.sel[0] != 7 && (gr.myMon_length < 1 || !isMyMonLevel())) {
                this.sendSms = (byte) -1;
                gr.say("\u76ee\u524d\u6ca1\u6709\u53ef\u4ee5\u5347\u7ea7\u7684\u5ba0\u7269\uff01", 0);
                return;
            } else {
                this.sendSms = (byte) 1;
                return;
            }
        }
        if ((this.sendSms == -1 || this.sendSms == 0 || this.sendSms == 3 || this.sendSms == 24) && Ms.i().key_S2()) {
            Ms.i().keyRelease();
            outState();
            if (smsType == 6) {
                GameRun.run_state = -10;
                isWorking = true;
            }
            this.sendSms = (byte) -1;
        }
    }

    public void draw() {
        if (this.menu_state == 0) {
            int i = Constants_H.WIDTH_ - 2;
            int i2 = Constants_H.HEIGHT_ - 1;
            Ui.i().fillRectB();
            Ui.i().drawK2(1, 1, i, i2, 0);
            Ui.i().drawK1(Constants_H.WIDTH_H_ - 75, 1 + 3, 150, 28 - 4, 4);
            Ui.i().drawString(this.menuTxt[this.menu[this.menu_state][0]][0], Constants_H.WIDTH_H_, 1 + 1, 17, 0, 1);
            Log.e("sk", "draw");
            int i3 = 1 + 5;
            int i4 = 28 + 1;
            int i5 = 1 + 29;
            int i6 = i - 10;
            if (this.menu[this.menu_state].length > 1) {
                Ui.i().drawK1(i3, i5, i6 - 15, 28 * this.showLine, 1);
                Ui.i().sliding((i3 + 628) - 13, i5, 28 * this.showLine, this.sel[0] - 1, this.menu[this.menu_state].length - 1, true);
                Ui.i().drawListKY(this.showLine, i3, i5 + 2, i6 - 15, 2, 28, -1, this.sel[0] - this.sel[1], 4, 2);
                int i7 = this.sel[1];
                while (i7 < this.sel[1] + this.showLine && i7 < this.menu[this.menu_state].length) {
                    int i8 = i6 >> 1;
                    int i9 = i5 + 2;
                    Ui.i().drawString(this.menuTxt[this.menu[this.menu_state][i7]][0], i3 + 314, ((i7 - this.sel[1]) * 28) + 32, 17, this.sel[0] == i7 ? 0 : 3, 0);
                    int i10 = i5 + 2;
                    if (this.pkey.isSelect(i3, ((i7 - this.sel[1]) * 28) + 32, Constants_H.WIDTH_, 28)) {
                        this.sel[0] = (byte) i7;
                        setSmsType();
                    }
                    i7++;
                }
                i5 = (this.showLine * 28) + 5 + 30;
            }
            Ui.i().drawK1(i3, i5, i6, i2 - (i5 + 10), 2);
            draw0();
        }
    }

    private void draw0() {
        boolean bLeft = true;
        boolean bRight = true;
        if (this.sendSms > -1) {
            String smsTip = "";
            if (this.sendSms == 0) {
                int i = this.smsCount[smsType][2];
                int i2 = i < 0 ? 0 : gr.rmsSms[i];
                smsTip = getSmsTip(i2, this.smsCount[smsType][1] - i2);
            } else if (this.sendSms != 1 && this.sendSms != 2 && this.sendSms != 3) {
                if ((this.sendSms > 3 && this.sendSms < 15) || (this.sendSms > 23 && this.sendSms < 34)) {
                    smsTip = "\u8d2d\u4e70\u5df2\u6210\u529f\uff01";
                    bRight = false;
                    bLeft = false;
                    if (this.sendSms > 23 && this.sendSms < 34) {
                        this.sendSms = (byte) (this.sendSms + 1);
                    }
                } else if (this.sendSms == 15) {
                    smsTip = "\u81ea\u52a8\u4fdd\u5b58\u6e38\u620f\u3002";
                    bRight = false;
                    bLeft = false;
                } else if (this.sendSms < 23) {
                    smsTip = "\u4fdd\u5b58\u6e38\u620f\u6210\u529f\u3002";
                    this.sendSms = (byte) (this.sendSms + 1);
                    bRight = false;
                    bLeft = false;
                    if (smsType == 5 && this.sendSms == 23) {
                        gr.say("\u8d2d\u4e70\u5df2\u6210\u529f\uff01\u6e38\u620f\u5df2\u4fdd\u5b58\u3002#n\u65b0\u6e38\u620f\u540e\u6b64\u529f\u80fd\u4e0d\u518d\u8981\u6c42\u4ed8\u8d39\u3002", -1);
                    } else if (smsType == 6 && this.sendSms == 23) {
                        gr.say("\u8d2d\u4e70\u5df2\u6210\u529f\uff01\u83b7\u5f975\u679a\u5fbd\u7ae0(\u80cc\u5305\u7684\u5377\u8f74\u754c\u9762\u53ef\u67e5\u770b\uff09\u3002\u6e38\u620f\u5df2\u4fdd\u5b58\u3002#n\u65b0\u6e38\u620f\u540e\u6b64\u529f\u80fd\u4e0d\u518d\u8981\u6c42\u4ed8\u8d39\u3002", 0);
                    }
                }
            }
            if (this.sendSms != 3 && this.sendSms != 1 && this.sendSms != 2) {
                gr.showString(smsTip, Constants_H.HEIGHT_H - 50, 0);
            }
        }
        Ui.i().drawYesNo(bLeft, bRight);
    }

    private String getSmsTip(int i0, int i1) {
        String tip = String.valueOf("") + "\u60a8\u5df2\u53d1\u9001" + i0 + "\u6761\u77ed\u4fe1\u3002\u8d2d\u4e70\u6b64\u9879\uff0c\u8fd8\u9700\u53d1\u9001" + i1 + "\u6761\u77ed\u4fe1\u3002\u786e\u8ba4\u53d1\u9001\u77ed\u4fe1\u5417\uff1f";
        return tip;
    }

    private void outState() {
        if (this.tState != -1) {
            GameRun.run_state = this.tState;
            gr.map.my.state = this.tMyState;
            return;
        }
        GameRun.run_state = -10;
    }

    public void paintLevel() {
        if (gr.b_c == 1) {
            gr.drawEvolveUI(0, this.idSmsLevel, true);
        }
    }

    public void runLevel() {
        if (gr.b_c == 0) {
            if (gr.levelUp_in_battle[this.idSmsLevel][0] == 1) {
                gr.levelUp_in_battle[this.idSmsLevel][0] = 0;
                gr.b_c = (byte) 1;
                gr.say_s = 52;
                gr.levelPro(this.idSmsLevel, true);
                gr.setStringB("\u751f\u547d;+" + ((int) gr.proReplace[this.idSmsLevel][0]) + "#n" + Constants_H.PRO_TXT_1 + ";+" + ((int) gr.proReplace[this.idSmsLevel][1]), Constants_H.WIDTH, 0);
                gr.setStringB("\u529b\u91cf;+" + ((int) gr.proReplace[this.idSmsLevel][3]) + "#n" + Constants_H.PRO_TXT_4 + ";+" + ((int) gr.proReplace[this.idSmsLevel][4]) + "#n" + Constants_H.PRO_TXT_5 + ";+" + ((int) gr.proReplace[this.idSmsLevel][5]), Constants_H.WIDTH, 1);
                gr.initMonStream(2, gr.mList_id[gr.myMonsters[this.idSmsLevel].monster[0]][0], 1);
            } else {
                this.idSmsLevel = (byte) (this.idSmsLevel + 1);
            }
            if (this.idSmsLevel >= gr.myMon_length) {
                if (this.tState == -1) {
                    GameRun.run_state = -20;
                    gr.levelUp_in_battle = null;
                    gr.proReplace = null;
                    return;
                }
                GameRun.run_state = this.tState;
                if (this.tState == -31) {
                    gr.initMonStream(2, gr.mList_id[gr.myB.getMon().monster[0]][0], 1);
                    gr.myB.act_num = (byte) 0;
                    gr.initSkillList(gr.myB.getMon());
                    for (byte i = 0; i < gr.myMon_length; i = (byte) (i + 1)) {
                        gr.proReplace[gr.myMonsters[i].monster[1]][6] = gr.myMonsters[i].monster[2];
                    }
                    return;
                }
                return;
            }
            return;
        }
        if (gr.b_c == 1) {
            gr.say_s = (byte) Ms.i().mathSpeedDown(gr.say_s, 4, true);
        }
    }

    public void keyLevel() {
        if (!Ms.i().key_delay() && gr.b_c == 1 && gr.say_s == 0) {
            gr.b_c = (byte) 0;
        }
    }

    public void goLevel() {
        GameRun.run_state = -21;
        this.idSmsLevel = (byte) 0;
        gr.b_c = (byte) 0;
        if (this.tState != -31) {
            gr.levelUp_in_battle = null;
            gr.levelUp_in_battle = (byte[][]) Array.newInstance((Class<?>) Byte.TYPE, gr.max_takes, 2);
            gr.proReplace = null;
            gr.proReplace = (short[][]) Array.newInstance((Class<?>) Short.TYPE, gr.myMonsters.length, 7);
        }
        for (byte i = 0; i < gr.myMon_length; i = (byte) (i + 1)) {
            if (gr.myMonsters[i].monster[2] >= 70) {
                gr.healMonster(gr.myMonsters[i]);
            } else {
                gr.proReplace[i][6] = gr.myMonsters[i].monster[2];
                gr.levelUp_in_battle[i][0] = 1;
                gr.levelUp_in_battle[i][1] = -1;
                for (byte j = 0; j < 5; j = (byte) (j + 1)) {
                    gr.levelPro(i, false);
                    gr.getMagic(gr.myMonsters[i]);
                    if (gr.getSkill != -1) {
                        gr.levelUp_in_battle[i][1] = gr.getSkill;
                    }
                }
            }
        }
    }

    public boolean isMyMonLevel() {
        int i = gr.myMon_length - 1;
        while (true) {
            byte i2 = (byte) i;
            if (i2 > -1) {
                if (gr.myMonsters[i2].monster[2] < 70) {
                    return true;
                }
                i = i2 - 1;
            } else {
                return false;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void sendSuccess() {
        if (this.sendSms == 4 && this.smsCount[smsType][1] > 1) {
            byte[] bArr = gr.rmsSms;
            byte b = this.smsCount[smsType][2];
            byte b2 = (byte) (bArr[b] + 1);
            bArr[b] = b2;
            if (b2 != this.smsCount[smsType][1]) {
                this.sendSms = (byte) 0;
                Ms.i().rmsOptions(5, gr.rmsSms, 2);
                Ms.i().rmsOptions(5, null, 4);
            } else {
                gr.rmsSms[this.smsCount[smsType][2]] = 0;
            }
        }
        switch (smsType) {
            case 1:
                gr.money += 5000;
                gr.say("\u8d2d\u4e705000\u91d1\u5e01", -1);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
            case 2:
                gr.coin += 50;
                gr.say("\u5728\u5377\u8f74\u5546\u5e97\u4e2d\u624d\u80fd\u770b\u5230\u5fbd\u7ae0\u6570\u91cf", -1);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
            case 3:
                gr.coin += 10;
                gr.say("\u5728\u5377\u8f74\u5546\u5e97\u4e2d\u624d\u80fd\u770b\u5230\u5fbd\u7ae0\u6570\u91cf", -1);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
            case 4:
                this.tState = -1;
                gr.say("\u643a\u5e26\u7684\u5ba0\u7269\u5168\u90e8\u53475\u7ea7,\u5ba0\u7269\u9875\u9762\u67e5\u770b\u65b0\u5c5e\u6027", 0, -1);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                goLevel();
                GameRun.mc.setSmsIsSetRun_state(true);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
            case 5:
                gr.rmsSms[0] = 10;
                gr.say("\u8d2d\u4e70\u540e\u6b64\u529f\u80fd\u4e0d\u518d\u8981\u6c42\u4ed8\u8d39", 0, -1);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
            case 6:
                gr.rmsSms[this.smsCount[smsType][2]] = 10;
                gr.coin += 5;
                this.sms_b = true;
                gr.say("\u8d2d\u4e70\u540e\u6b64\u529f\u80fd\u4e0d\u518d\u8981\u6c42\u4ed8\u8d39", 0, -1);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
            case 7:
                goLevel();
                GameRun.mc.setSmsIsSetRun_state(true);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
                break;
        }
        gr.saveGame();
        if (this.menu_state != 0) {
            this.sendSms = (byte) -1;
            if (gr.say_c == 0) {
                outState();
                GameRun.mc.setSmsIsSetRun_state(true);
                GameRun.run_state = -10;
                GameRun.mc.temp_state = GameRun.run_state;
            }
        } else {
            this.sendSms = (byte) -1;
            Sound.i().setMusic(false);
        }
        this.sendSms = (byte) -1;
        GameRun.run_state = -10;
        GameRun.mc.temp_state = GameRun.run_state;
    }

    public byte getSendSms() {
        return this.sendSms;
    }

    public void setSendSms(int value) {
        this.sendSms = (byte) value;
    }

    public byte getSmsSenderMenuState() {
        return this.menu_state;
    }

    public int getTstate() {
        return this.tState;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:2:0x0002. Please report as an issue. */
    public void setSmsValue(int type) {
        switch (smsType) {
        }
    }
}
