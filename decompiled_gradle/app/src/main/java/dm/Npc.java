package dm;

import main.Key_H;

public class Npc implements Key_H {
    public byte brow_action;
    public byte brow_time;
    public byte[] other;
    public byte speed_x;
    public byte speed_y;
    public byte state;
    public byte timeMove;
    public short x;
    public short y;
    public boolean b_check = true;
    public boolean b_auto = false;
    public boolean bdir = false;
    public byte npc_num = 0;
    public byte frame_c = -1;
    public byte frame_num = 1;
    public byte lastAction = Byte.MAX_VALUE;
    public byte speed = 5;
    public byte brow_type = -1;
    public byte ix = -1;
    public byte iy = -1;
    public byte dir = 3;
    public byte now_time = 0;
    public byte now_action = 0;

    public Npc() {
    }

    public Npc(int len) {
        this.other = new byte[len];
    }

    public void setXY_npc() {
        setXY(this.other[0], this.other[1], 0, 0);
    }

    public void setIxIy_npc() {
        this.other[0] = getIx();
        this.other[1] = getIy();
    }

    public void setActionNo(boolean mode) {
        if (!this.bdir) {
            if (this.dir == 2) {
                this.other[7] = mode ? (byte) 3 : (byte) 0;
            } else if (this.dir == 1) {
                this.other[7] = mode ? (byte) 4 : (byte) 1;
            } else {
                this.other[7] = mode ? (byte) 5 : (byte) 2;
            }
            byte[] bArr = this.other;
            bArr[7] = (byte) (bArr[7] + (this.npc_num * 6));
        }
    }

    public void setNpcNum(int length) {
        this.npc_num = (byte) (this.other[7] / 6);
        if ((this.npc_num + 1) * 6 > length) {
            this.npc_num = (byte) 0;
        }
    }

    public void setSpeedXY(int _speed_x, int _speed_y) {
        this.speed_x = (byte) _speed_x;
        this.speed_y = (byte) _speed_y;
    }

    public void setIXY(int _ix, int _iy) {
        this.ix = (byte) _ix;
        this.iy = (byte) _iy;
    }

    public void setLastAction(boolean _bdir, int _lastAction) {
        this.bdir = _bdir;
        this.lastAction = (byte) _lastAction;
    }

    public void setXY(int ix, int iy, int offx, int offy) {
        this.x = (short) ((ix * 20) + offx);
        this.y = (short) ((iy * 20) + offy);
    }

    public byte getIx() {
        return (byte) (this.x / 20);
    }

    public byte getIy() {
        return (byte) (this.y / 20);
    }

    public byte getIx_off() {
        return (byte) (this.x % 20);
    }

    public byte getIy_off() {
        return (byte) (this.y % 20);
    }
}
