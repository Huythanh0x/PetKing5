package com.uc.paymentsdk.network.chain;

import android.content.Context;
import android.text.TextUtils;
import com.uc.paymentsdk.network.Api;
import com.uc.paymentsdk.network.ApiTask;
import com.uc.paymentsdk.network.JSONParser;
import com.uc.paymentsdk.network.chain.Handler;
import com.uc.paymentsdk.util.PrefUtil;
import com.uc.paymentsdk.util.Utils;
import org.apache.http.HttpResponse;
import org.json.JSONException;

public class SyncChargeChannelHandler extends Handler implements ApiTask.TaskHandler {
    private static int sStatus;
    private final Integer LOCK;
    private Handler.OnFinishListener mOnFinishListener;

    public SyncChargeChannelHandler(Context paramContext) {
        super(paramContext);
        this.LOCK = 0;
    }

    public SyncChargeChannelHandler(Context paramContext, Handler.OnFinishListener paramOnFinishListener) {
        super(paramContext);
        this.LOCK = 0;
        this.mOnFinishListener = paramOnFinishListener;
    }

    public static void init() {
        sStatus = 0;
    }

    @Override
    public void handleRequest() {
        switch (sStatus) {
            case 0:
                sStatus = 1;
                Api.syncChargeChannel(this.mContext, this);
                break;
            case 1:
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        synchronized (SyncChargeChannelHandler.this.LOCK) {
                            try {
                                SyncChargeChannelHandler.this.LOCK.wait();
                            } catch (InterruptedException localInterruptedException) {
                                localInterruptedException.printStackTrace();
                            }
                        }
                        SyncChargeChannelHandler.this.mHandler.post(new Runnable() {
                            @Override
                            public void run() {
                                SyncChargeChannelHandler.this.handleRequest();
                            }
                        });
                    }
                }).start();
                break;
            case 2:
                if (getSuccessor() == null) {
                    if (this.mOnFinishListener != null) {
                        this.mOnFinishListener.onFinish();
                        break;
                    }
                } else {
                    getSuccessor().handleRequest();
                    break;
                }
                break;
        }
    }

    @Override
    public void onSuccess(int paramInt, Object paramObject) {
        PrefUtil.syncChargeChannels(this.mContext, (String[]) paramObject);
        sStatus = 2;
        synchronized (this.LOCK) {
            this.LOCK.notifyAll();
        }
        if (getSuccessor() == null) {
            if (this.mOnFinishListener != null) {
                this.mOnFinishListener.onFinish();
                return;
            }
            return;
        }
        getSuccessor().handleRequest();
    }

    @Override
    public Object onPreHandle(int paramInt, HttpResponse paramHttpResponse) {
        String str = Utils.getBodyString(paramInt, paramHttpResponse);
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return JSONParser.parseChargeChannel(str);
        } catch (JSONException e) {
            return null;
        }
    }

    @Override
    public void onError(int paramInt1, int paramInt2) {
        sStatus = 0;
        synchronized (this.LOCK) {
            this.LOCK.notifyAll();
        }
        if (getSuccessor() == null) {
            if (this.mOnFinishListener != null) {
                this.mOnFinishListener.onFinish();
                return;
            }
            return;
        }
        getSuccessor().handleRequest();
    }
}
