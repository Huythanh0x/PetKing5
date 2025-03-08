package com.uc.paymentsdk.network.chain;

import android.content.Context;
import com.uc.paymentsdk.network.chain.Handler;

public class HandlerProxy extends Handler {
    private Handler handler;

    public HandlerProxy(Context paramContext, Handler.OnFinishListener paramOnFinishListener) {
        super(paramContext);
        this.handler = new SyncSmsInfoHandler(paramContext, paramOnFinishListener);
    }

    public HandlerProxy(Context paramContext) {
        super(paramContext);
        this.handler = new SyncSmsInfoHandler(paramContext);
    }

    @Override
    public void handleRequest() {
        this.handler.handleRequest();
    }
}
