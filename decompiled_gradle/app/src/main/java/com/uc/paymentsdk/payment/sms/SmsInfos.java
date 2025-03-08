package com.uc.paymentsdk.payment.sms;

import android.content.Context;
import java.util.ArrayList;
import java.util.Iterator;

public class SmsInfos {
    public ArrayList<SmsInfo> smsInfos = new ArrayList<>();

    public void add(SmsInfo paramSmsInfo) {
        this.smsInfos.add(paramSmsInfo);
    }

    public SmsInfo filterSmsInfo(Context paramContext, int paymoney) throws SimCardNotSupportException {
        ArrayList<Integer> smsSuitPriceArr = null;
        int maxMoney = 0;
        int selectIndex = -1;
        if (this.smsInfos.size() == 1) {
            return this.smsInfos.get(0);
        }
        for (int i = 0; i < this.smsInfos.size(); i++) {
            SmsInfo localSmsInfo = this.smsInfos.get(i);
            if (smsSuitPriceArr == null) {
                smsSuitPriceArr = parsePayment(paymoney);
            }
            Iterator<Integer> smsSuitriceIte = smsSuitPriceArr.iterator();
            while (smsSuitriceIte.hasNext()) {
                Integer aPrice = smsSuitriceIte.next();
                if (localSmsInfo.money == aPrice.intValue() && localSmsInfo.money > maxMoney) {
                    maxMoney = localSmsInfo.money;
                    selectIndex = i;
                }
            }
        }
        if (selectIndex != -1) {
            return this.smsInfos.get(selectIndex);
        }
        throw new SimCardNotSupportException("\u5bf9\u4e0d\u8d77\uff0c\u60a8\u6240\u4f7f\u7528\u7684\u624b\u673a\u8fd0\u8425\u5546\u4e0d\u652f\u6301\u6b64\u77ed\u4fe1\u6fc0\u6d3b\u529f\u80fd\u3002");
    }

    private static ArrayList<Integer> parsePayment(int paymoney) {
        ArrayList<Integer> smsSuitPrice = new ArrayList<>();
        int i = paymoney;
        do {
            if (paymoney % i == 0) {
                smsSuitPrice.add(Integer.valueOf(i));
            }
            i--;
        } while (i > 0);
        return smsSuitPrice;
    }
}
