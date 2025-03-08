package com.uc.paymentsdk.network.chain;

import android.content.Context;
import android.text.TextUtils;
import com.uc.paymentsdk.network.Api;
import com.uc.paymentsdk.network.ApiTask;
import com.uc.paymentsdk.network.XMLParser;
import com.uc.paymentsdk.network.chain.Handler;
import com.uc.paymentsdk.payment.sms.SmsInfos;
import com.uc.paymentsdk.util.PrefUtil;
import com.uc.paymentsdk.util.Utils;
import java.io.IOException;
import org.apache.http.HttpResponse;

public class SyncSmsInfoHandler extends Handler implements ApiTask.TaskHandler {
    private static int sStatus;
    private final Integer LOCK;
    private Handler.OnFinishListener mOnFinishListener;

    public SyncSmsInfoHandler(Context paramContext) {
        super(paramContext);
        this.LOCK = 0;
    }

    public SyncSmsInfoHandler(Context paramContext, Handler.OnFinishListener paramOnFinishListener) {
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
                Api.syncSmsInfo(this.mContext, this, Utils.getPaymentInfo().getCpID(), Utils.getPaymentInfo().getmGameID());
                break;
            case 1:
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        synchronized (SyncSmsInfoHandler.this.LOCK) {
                            try {
                                SyncSmsInfoHandler.this.LOCK.wait();
                            } catch (InterruptedException localInterruptedException) {
                                localInterruptedException.printStackTrace();
                            }
                        }
                        SyncSmsInfoHandler.this.mHandler.post(new Runnable() {
                            @Override
                            public void run() {
                                SyncSmsInfoHandler.this.handleRequest();
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
        sStatus = 2;
        Utils.setSmsInfo((SmsInfos) paramObject);
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
            SmsInfos localSmsInfos = XMLParser.parseSmsInfo(str);
            PrefUtil.setSmsInfo(this.mContext, str);
            return localSmsInfos;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void onError(int paramInt1, int paramInt2) {
        sStatus = 2;
        if (Utils.getSmsInfos() == null) {
            try {
                String str = PrefUtil.getSmsInfo(this.mContext);
                if (str == null) {
                    Utils.setSmsInfo(null);
                } else {
                    SmsInfos localSmsInfos = XMLParser.parseSmsInfo(str);
                    if (localSmsInfos == null) {
                        Utils.setSmsInfo(null);
                    } else if (Utils.dateDiffByDay(localSmsInfos.smsInfos.get(0).getSmsendtime(), Utils.getCurrentTime(true), "yyyy-MM-dd") >= 0) {
                        Utils.setSmsInfo(null);
                    } else {
                        Utils.setSmsInfo(localSmsInfos);
                    }
                }
            } catch (IOException localIOException) {
                sStatus = 0;
                localIOException.printStackTrace();
            } catch (Exception localException) {
                sStatus = 0;
                localException.printStackTrace();
            }
        }
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
