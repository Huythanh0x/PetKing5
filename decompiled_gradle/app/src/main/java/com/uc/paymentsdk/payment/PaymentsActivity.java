package com.uc.paymentsdk.payment;

import android.app.Activity;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.sqlite.SQLiteAbortException;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.Html;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.PasswordTransformationMethod;
import android.text.util.Linkify;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.HeaderViewListAdapter;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import com.uc.paymentsdk.commons.ui.CustomAdapter;
import com.uc.paymentsdk.model.IType;
import com.uc.paymentsdk.model.TypeFactory;
import com.uc.paymentsdk.network.Api;
import com.uc.paymentsdk.network.ApiTask;
import com.uc.paymentsdk.network.XMLParser;
import com.uc.paymentsdk.network.chain.Handler;
import com.uc.paymentsdk.network.chain.HandlerProxy;
import com.uc.paymentsdk.network.chain.SyncChargeChannelHandler;
import com.uc.paymentsdk.network.chain.SyncPayChannelHandler;
import com.uc.paymentsdk.network.chain.SyncSmsInfoHandler;
import com.uc.paymentsdk.payment.sms.SimCardNotSupportException;
import com.uc.paymentsdk.payment.sms.SmsInfo;
import com.uc.paymentsdk.payment.upoint.UPointInfo;
import com.uc.paymentsdk.payment.upoint.UPointPayInfo;
import com.uc.paymentsdk.util.Constants;
import com.uc.paymentsdk.util.DialogUtil;
import com.uc.paymentsdk.util.PrefUtil;
import com.uc.paymentsdk.util.Utils;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Pattern;
import javax.microedition.media.Player;
import main.Constants_H;
import org.apache.http.HttpResponse;

public class PaymentsActivity extends Activity implements View.OnClickListener, ApiTask.TaskHandler, AdapterView.OnItemClickListener, DialogUtil.WarningDialogListener, Handler.OnFinishListener {
    private static final String CONTENT_SMS_INBOX = "content://sms/";
    private static final int DIALOG_500 = 11;
    private static final int DIALOG_ACCOUNT_WRONG = 34;
    private static final int DIALOG_CONNECTING = 14;
    private static final int DIALOG_CONNECTING_FAILED = 15;
    private static final int DIALOG_INSUFFICIENT_BALANCE = 5;
    private static final int DIALOG_PASSWORD_IS_EMPTY = 29;
    private static final int DIALOG_PASSWORD_OR_USERNAME_IS_EMPTY = 28;
    private static final int DIALOG_PASSWORD_WRONG = 33;
    private static final int DIALOG_PAY_DES = 3;
    private static final int DIALOG_PAY_ERROR_INPUT = 8;
    private static final int DIALOG_PAY_FAILED = 7;
    private static final int DIALOG_PAY_INVALID_ACCOUNT = 9;
    private static final int DIALOG_PAY_NEED_TO_CONFIRM_PAY_RESULT = 10;
    private static final int DIALOG_PAY_SMS_BACK_CONFIRM = 24;
    private static final int DIALOG_PAY_SMS_DELETE_BACK_CONFIRM = 25;
    private static final int DIALOG_PAY_SMS_DELETE_CONFIRM = 23;
    private static final int DIALOG_PAY_SMS_ERROR = 16;
    private static final int DIALOG_PAY_SMS_FAILED = 21;
    private static final int DIALOG_PAY_SMS_RETRY = 26;
    private static final int DIALOG_PAY_SMS_RETRY_MULTIPLE = 27;
    private static final int DIALOG_PAY_SMS_SENDING = 17;
    private static final int DIALOG_PAY_SMS_SEND_FAILED = 18;
    private static final int DIALOG_PAY_SMS_SUCCESS = 20;
    private static final int DIALOG_PAY_SMS_SYNC = 19;
    private static final int DIALOG_PAY_SUCCESS = 13;
    private static final int DIALOG_PROGRESS_BAR = 6;
    private static final int DIALOG_SMS_FAIL = 38;
    private static final int DIALOG_START_ERROR_APPKEY_INVALID = 1;
    private static final int DIALOG_START_ERROR_CPID_INVALID = 22;
    private static final int DIALOG_START_ERROR_PAYMENT_INVALID = 0;
    private static final int DIALOG_TIP = 2;
    private static final int DIALOG_UPOINT_PAYING = 35;
    private static final int DIALOG_UPOINT_PAYPASS_WRONG = 37;
    private static final int DIALOG_UPOINT_TIMESTAMP_WRONG = 36;
    private static final int DIALOG_USERNAME_IS_EMPTY = 30;
    private static final int DIALOG_USERNAME_WRONG = 31;
    private static final int DIALOG_USERNAME_WRONG2 = 32;
    public static final String EXTRA_KEY_NUMBER = "number";
    public static final String EXTRA_KEY_ORDER_ID = "orderId";
    public static final String EXTRA_KEY_PAYMENTINFO = "com.mappn.sdk.paymentinfo";
    public static final int ID_BACK = 9;
    public static final int ID_CANCEL = 10;
    private static final int ID_PAYMENT_TIP = 0;
    private static final int ID_PAY_SMS_CANCEL = 4;
    private static final int ID_PAY_SMS_CONFIRM = 5;
    private static final int ID_PAY_SMS_CONFIRM_CANCEL = 6;
    private static final int ID_PAY_SMS_OK = 3;
    private static final int ID_PAY_UPOINT = 7;
    private static final int ID_PAY_UPOINT_PAYPASS = 8;
    private static final long PAY_SMS_TIMEOUT = 60000;
    private static final int RETRY_MAX = 2;
    private static final String TERM = ",,,,";
    private static final int TYPE_PAYMENT_LIST = 0;
    private static final int TYPE_PAYMENT_SMS = 4;
    private static final int TYPE_PAYMENT_SMS_CONFIRM = 5;
    private static final int TYPE_PAYMENT_UPOINT_DISCOUNT = 1;
    private static final int TYPE_PAYMENT_UPOINT_LOGIN = 2;
    private static final int TYPE_PAYMENT_UPOINT_PAYPASS = 3;
    private int mBalance;
    private Button mBtnPay;
    private String mConfirmSmsInfoString;
    private EditText mEtPassword;
    private EditText mEtPayPass;
    private CheckBox mEtSavePass;
    private EditText mEtUsername;
    private boolean mIsShowInfo;
    private boolean mIsSynced;
    private boolean mIsValid;
    private int mLeftSmsToReceiveCount;
    private int mLeftSmsToSendCount;
    private ListView mListView;
    private String mNumber;
    private PaymentInfo mPaymentInfo;
    private ContentObserver mSmsContent;
    private android.os.Handler mSmsHander;
    private int mSmsId;
    private SmsInfo mSmsInfo;
    private String mSmsResultInfo;
    private int mTimeoutCounter;
    private TextView mTvDiscountTextView;
    private TextView mTvProduct;
    private TextView mTvVipDiscountInfo;
    private TextView mTvVipDiscountTextView;
    private TextView mTvVipDiscountTimeTextView;
    private int mType;
    private UPointPayInfo mUPayInfo;
    private final BroadcastReceiver mSmsReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context paramContext, Intent paramIntent) {
            switch (getResultCode()) {
                case -1:
                    if (4 == PaymentsActivity.this.mType) {
                        if (PaymentsActivity.this.mSmsInfo.isNeedconfirm()) {
                            try {
                                Thread.sleep(5000L);
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                            PaymentsActivity.this.removeDialog(17);
                            String smsConfirmText = PaymentsActivity.this.mSmsInfo.getSmsConfirmContent();
                            String smsaddress = PaymentsActivity.this.mSmsInfo.getSmsConfirmNumber();
                            PaymentsActivity.this.buildSmsPaymentConfirmView(smsaddress, smsConfirmText);
                            break;
                        } else {
                            PaymentsActivity.this.mLeftSmsToSendCount--;
                            PaymentsActivity.this.removeDialog(17);
                            PrefUtil.setPayedAmount(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this.getPayedAmount());
                            if (PaymentsActivity.this.mLeftSmsToSendCount < 1) {
                                try {
                                    PaymentsActivity.this.unregisterReceiver(PaymentsActivity.this.mSmsReceiver);
                                } catch (IllegalArgumentException e2) {
                                }
                                PaymentsActivity.this.mSmsResultInfo = "\u652f\u4ed8\u5df2\u5b8c\u6210\uff0c\u795d\u60a8\u73a9\u5f97\u5f00\u5fc3\u3002";
                                PaymentsActivity.this.showDialog(20);
                            } else {
                                PaymentsActivity.this.buildSmsPaymentView();
                            }
                            if (PaymentsActivity.this.mSmsInfo.getSmstype() == 1) {
                                Api.postSmsPayment(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this, PaymentsActivity.this.mPaymentInfo.getCpID(), PaymentsActivity.this.mPaymentInfo.getmGameID(), PaymentsActivity.this.mPaymentInfo.getmActionID(), Utils.getSmsPayment(), PaymentsActivity.this.mPaymentInfo.getmActionID(), PaymentsActivity.this.mSmsInfo.getSmschannelid(), PaymentsActivity.this.mSmsInfo.getSmsnumber(), PaymentsActivity.this.mSmsInfo.getContent(), PaymentsActivity.this.mSmsInfo.getSmstype());
                                break;
                            }
                        }
                    } else {
                        PaymentsActivity.this.removeDialog(17);
                        PaymentsActivity.this.mLeftSmsToSendCount--;
                        PrefUtil.setPayedAmount(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this.getPayedAmount());
                        if (PaymentsActivity.this.mLeftSmsToSendCount < 1) {
                            try {
                                PaymentsActivity.this.unregisterReceiver(PaymentsActivity.this.mSmsReceiver);
                            } catch (IllegalArgumentException e3) {
                            }
                            PaymentsActivity.this.mSmsResultInfo = "\u652f\u4ed8\u5df2\u5b8c\u6210\uff0c\u795d\u60a8\u73a9\u5f97\u5f00\u5fc3\u3002";
                            PaymentsActivity.this.showDialog(20);
                        } else {
                            PaymentsActivity.this.buildSmsPaymentView();
                        }
                        if (PaymentsActivity.this.mSmsInfo.getSmstype() == 1) {
                            Api.postSmsPayment(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this, PaymentsActivity.this.mPaymentInfo.getCpID(), PaymentsActivity.this.mPaymentInfo.getmGameID(), PaymentsActivity.this.mPaymentInfo.getmActionID(), Utils.getSmsPayment(), PaymentsActivity.this.mPaymentInfo.getmActionID(), PaymentsActivity.this.mSmsInfo.getSmschannelid(), PaymentsActivity.this.mSmsInfo.getSmsnumber(), PaymentsActivity.this.mSmsInfo.getContent(), PaymentsActivity.this.mSmsInfo.getSmstype());
                            break;
                        }
                    }
                    break;
                case 1:
                case 133404:
                    break;
                case 2:
                    PaymentsActivity.this.removeDialog(17);
                    PaymentsActivity.this.mSmsResultInfo = "\u5f53\u524d\u624b\u673a\u8bbe\u7f6e\u4e3a\u98de\u884c\u6a21\u5f0f\uff0c\u4e0d\u80fd\u53d1\u9001\u77ed\u4fe1\u3002";
                    PaymentsActivity.this.showDialog(21);
                    if ((PaymentsActivity.this.mLeftSmsToSendCount != -1 || 5 == PaymentsActivity.this.mType) && PaymentsActivity.this.mSmsContent != null) {
                        PaymentsActivity.this.getContentResolver().unregisterContentObserver(PaymentsActivity.this.mSmsContent);
                        break;
                    }
                    break;
                default:
                    PaymentsActivity.this.removeDialog(17);
                    PaymentsActivity.this.mSmsResultInfo = Constants.TEXT_PAY_SMS_FAILED_INSUFFENT_BALANCE;
                    PaymentsActivity.this.showDialog(21);
                    if ((PaymentsActivity.this.mLeftSmsToSendCount != -1 || 5 == PaymentsActivity.this.mType) && PaymentsActivity.this.mSmsContent != null) {
                        PaymentsActivity.this.getContentResolver().unregisterContentObserver(PaymentsActivity.this.mSmsContent);
                        break;
                    }
                    break;
            }
        }
    };
    private final Runnable mSmsRunnable = new Runnable() {
        @Override
        public void run() {
            if (PaymentsActivity.this.mSmsContent != null) {
                PaymentsActivity.this.getContentResolver().unregisterContentObserver(PaymentsActivity.this.mSmsContent);
            }
            PaymentsActivity.this.removeDialog(17);
            if (PaymentsActivity.this.mSmsInfo.needconfirm) {
                PaymentsActivity.this.mSmsResultInfo = "\u5bf9\u4e0d\u8d77\uff0c\u63a5\u6536\u786e\u8ba4\u77ed\u4fe1\u8d85\u65f6\uff0c\u8bf7\u91cd\u65b0\u5c1d\u8bd5\u652f\u4ed8\uff01";
                PaymentsActivity.this.showDialog(21);
            } else if (PaymentsActivity.this.mLeftSmsToSendCount > 0) {
                PaymentsActivity.this.mSmsResultInfo = "\u5bf9\u4e0d\u8d77\uff0c\u77ed\u4fe1\u652f\u4ed8\u5df2\u7ecf\u8d85\u65f6\uff0c\u8bf7\u91cd\u65b0\u652f\u4ed8\uff01";
                PaymentsActivity.this.showDialog(21);
            } else {
                PrefUtil.setPayedAmount(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this.getPayedAmount());
                PaymentsActivity.this.mSmsResultInfo = "\u611f\u8c22\u60a8\u7684\u4f7f\u7528\uff0c\u795d\u60a8\u73a9\u5f97\u5f00\u5fc3\uff01";
                PaymentsActivity.this.showDialog(20);
            }
            try {
                PaymentsActivity.this.unregisterReceiver(PaymentsActivity.this.mSmsReceiver);
            } catch (IllegalArgumentException e) {
            }
        }
    };

    @Override
    protected void onCreate(Bundle paramBundle) {
        super.onCreate(paramBundle);
        this.mIsValid = initPayment();
        if (this.mIsValid) {
            Utils.init(getApplicationContext());
            Utils.initTitleBar(this);
            buildPaymentView();
            confirmEnterPaymentPoint();
            new HandlerProxy(getApplicationContext()).handleRequest();
        }
    }

    public void confirmEnterPaymentPoint() {
        PrefUtil.increaseArriveCount(getApplicationContext());
    }

    private boolean initPayment() {
        String str;
        this.mPaymentInfo = (PaymentInfo) getIntent().getSerializableExtra(EXTRA_KEY_PAYMENTINFO);
        if (this.mPaymentInfo == null) {
            throw new IllegalArgumentException("PaymentInfo\u5fc5\u987b\u8bbe\u7f6e");
        }
        this.mPaymentInfo.setPaytype("sms");
        int i = this.mPaymentInfo.getMoney();
        if (i <= 0 || i > 10000 || i % 5 != 0) {
            showDialog(0);
            return false;
        }
        if (this.mPaymentInfo.getPayname() == null) {
            throw new IllegalArgumentException("\u5fc5\u987b\u6307\u5b9a\u652f\u4ed8\u5185\u5bb9\u540d\u79f0");
        }
        if (this.mPaymentInfo.getPaydesc() == null) {
            throw new IllegalArgumentException("\u5fc5\u987b\u6307\u5b9a\u652f\u4ed8\u5185\u5bb9\u63cf\u8ff0");
        }
        if (this.mPaymentInfo.getmGameID() == null) {
            throw new IllegalArgumentException("\u5fc5\u987b\u6307\u5b9a\u6e38\u620fID");
        }
        if (this.mPaymentInfo.getmGameID().length() != 2) {
            throw new IllegalArgumentException("\u6e38\u620fID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57");
        }
        if (!Utils.isNumeric(this.mPaymentInfo.getmGameID())) {
            throw new IllegalArgumentException("\u6e38\u620fID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57");
        }
        if (this.mPaymentInfo.getmActionID() == null) {
            throw new IllegalArgumentException("\u5fc5\u987b\u6307\u5b9a\u652f\u4ed8\u70b9ID");
        }
        if (this.mPaymentInfo.getmActionID().length() != 2) {
            throw new IllegalArgumentException("\u652f\u4ed8\u70b9ID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57");
        }
        if (!Utils.isNumeric(this.mPaymentInfo.getmActionID())) {
            throw new IllegalArgumentException("\u652f\u4ed8\u70b9ID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57");
        }
        if (this.mPaymentInfo.getPayname().length() > 50) {
            this.mPaymentInfo.setPayname(this.mPaymentInfo.getPayname().substring(0, 50));
        }
        if (this.mPaymentInfo.getPaydesc().length() > 100) {
            this.mPaymentInfo.setPaydesc(this.mPaymentInfo.getPaydesc().substring(0, 100));
        }
        try {
            str = Utils.getCpID(getApplicationContext());
        } catch (PackageManager.NameNotFoundException e) {
            showDialog(22);
        } catch (NullPointerException e2) {
            showDialog(22);
        }
        if (!Pattern.matches(Constants.CPID_PATTERN, str)) {
            showDialog(22);
            return false;
        }
        this.mPaymentInfo.setCpID(str);
        if (this.mPaymentInfo.getUsername() != null) {
            PrefUtil.setUCUserName(getApplicationContext(), this.mPaymentInfo.getUsername());
        }
        Utils.setPaymentInfo(this.mPaymentInfo);
        return true;
    }

    @Override
    protected void onPrepareDialog(int paramInt, Dialog paramDialog) {
        super.onPrepareDialog(paramInt, paramDialog);
        if (paramDialog.isShowing()) {
            paramDialog.dismiss();
        }
    }

    @Override
    protected Dialog onCreateDialog(int paramInt) {
        switch (paramInt) {
            case 0:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u8be5\u5e94\u7528\u8981\u6c42\u652f\u4ed8\u7684\u91d1\u989d\u4e0d\u7b26\u5408\u8981\u6c42\uff0c\u4e0d\u80fd\u6210\u529f\u652f\u4ed8\u3002", this);
            case 1:
            case 3:
            case 4:
            case 12:
            default:
                return super.onCreateDialog(paramInt);
            case 2:
                return DialogUtil.createOKWarningDialogSupportLink(this, paramInt, "\u4ec0\u4e48\u662fU\u70b9?", "U\u70b9\u662f<a href='http://wap.uc.cn'>UC-\u4f18\u89c6</a>\u63d0\u4f9b\u7684\u4e00\u79cd\u865a\u62df\u8d27\u5e01\uff0c\u4e3b\u8981\u7528\u4e8e\u8d2d\u4e70\u8f6f\u4ef6\u548c\u6e38\u620f\u91cc\u7684\u5185\u5bb9\uff08\u5982\uff1a\u9053\u5177\u3001\u5173\u5361\u3001\u8f6f\u4ef6\u3001\u4f7f\u7528\u65f6\u957f\u7b49\uff09\u3002<br /><br />U\u70b9\u5151\u6362\u6807\u51c6\uff1a<br />1\u5143\u53ef\u5151\u636210U\u70b9\u3002<br />\u901a\u8fc7\u4ee5\u4e0b\u94fe\u63a5\u5145\u503cU\u70b9\uff1a<br /><a href='http://pay.uc.cn'>UC-\u4f18\u89c6</a>", null);
            case 5:
                return DialogUtil.createOKWarningDialog(this, paramInt, "U\u70b9\u4e0d\u8db3,\u4e0d\u80fd\u7ee7\u7eed\u652f\u4ed8\uff01", null);
            case 6:
                return DialogUtil.createIndeterminateProgressDialog(this, paramInt, "\u6b63\u5728\u652f\u4ed8\uff0c\u8bf7\u52ff\u5173\u95ed\u7a0b\u5e8f\uff0c\u8bf7\u7a0d\u540e......", false, null);
            case 7:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002", null);
            case 8:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002", null);
            case 9:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002", null);
            case 10:
                return DialogUtil.createYesNoDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8fde\u63a5\u670d\u52a1\u5668\u8d85\u65f6\uff0c\u662f\u5426\u91cd\u8bd5?", this);
            case 11:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002\n\u8bf7\u8054\u7cfb\u5ba2\u670d4006-400-401\u3002", null);
            case 13:
                return DialogUtil.createOKWarningDialog(this, paramInt, "U\u70b9\u652f\u4ed8\u6210\u529f\uff0c\u795d\u60a8\u73a9\u7684\u5f00\u5fc3", String.format("\u60a8\u7684\u4f59\u989d\u4e3a%dU\u70b9", this.mNumber, Integer.valueOf(this.mBalance)), this);
            case 14:
                return DialogUtil.createIndeterminateProgressDialog(this, paramInt, "\u8fde\u63a5\u670d\u52a1\u5668\uff0c\u8bf7\u7a0d\u7b49...", false, null);
            case 15:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u7f51\u7edc\u8fde\u63a5\u9519\u8bef\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u518d\u8bd5\u3002", this);
            case 16:
                return DialogUtil.createOKWarningDialog(this, paramInt, this.mSmsResultInfo, this);
            case 17:
                return DialogUtil.createIndeterminateProgressDialog(this, paramInt, "\u77ed\u4fe1\u53d1\u9001\u8fc7\u7a0b\u53ef\u80fd\u6301\u7eed\u4e00\u5206\u949f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85...", false, null);
            case 18:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u77ed\u4fe1\u53d1\u9001\u5931\u8d25", null);
            case 19:
                return DialogUtil.createIndeterminateProgressDialog(this, paramInt, "\u6b63\u5728\u83b7\u53d6\u4fe1\u606f\uff0c\u8bf7\u7a0d\u5019......", false, null);
            case 20:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants_H.MONEY_TXT_18, this.mSmsResultInfo, this);
            case 21:
                return DialogUtil.createOKWarningDialog(this, paramInt, this.mSmsResultInfo, this);
            case 22:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_START_CPID_INVALID, this);
            case 23:
                return DialogUtil.createTwoButtonsDialog(this, paramInt, "\u60a8\u5df2\u7ecf\u53d6\u6d88\u4e86\u8d2d\u4e70\uff0c\u5c06\u4e0d\u4f1a\u83b7\u5f97\u76f8\u5e94\u5185\u5bb9\u3002\u8bf7\u786e\u8ba4\u662f\u5426\u53d6\u6d88\uff1f", "\u53d6\u6d88", "\u4e0d\u53d6\u6d88", this);
            case 24:
                return DialogUtil.createTwoButtonsDialog(this, paramInt, Html.fromHtml(Constants.TEXT_PAY_SMS_BACK_CONFIRM), Constants.TEXT_BACK_TO_PAYPOINT, Constants.TEXT_EXIT, this);
            case DIALOG_PAY_SMS_DELETE_BACK_CONFIRM:
                return DialogUtil.createTwoButtonsDialog(this, paramInt, Constants.TEXT_PAY_SMS_DELETE_BACK_CONFIRM, Constants.TEXT_BACK_TO_PAYPOINT, Constants.TEXT_EXIT, this);
            case 26:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u8d85\u65f6\uff0c\u70b9\u51fb\u786e\u5b9a\u91cd\u65b0\u9a8c\u8bc1\u652f\u4ed8\u7ed3\u679c\u3002\u6700\u591a \u9700\u89811\u5206\u949f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85...", this);
            case DIALOG_PAY_SMS_RETRY_MULTIPLE:
                int i = getPayedAmount();
                int j = PrefUtil.getPayedAmount(getApplicationContext());
                return DialogUtil.createTwoButtonsDialog(this, paramInt, String.format(Constants.TEXT_PAY_SMS_CHANCEL_CONFIRM, Integer.valueOf(j + i), this.mPaymentInfo.getPayname(), this.mPaymentInfo.getPayname()), Constants.TEXT_BACK_TO_PAY, Constants.TEXT_CONFIRM_TO_CANCEL, this);
            case DIALOG_PASSWORD_OR_USERNAME_IS_EMPTY:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_PASSWORD_OR_USERNAME_IS_EMPTY, null);
            case DIALOG_PASSWORD_IS_EMPTY:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_PASSWORD_IS_EMPTY, null);
            case DIALOG_USERNAME_IS_EMPTY:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_USERNAME_IS_EMPTY, null);
            case DIALOG_USERNAME_WRONG:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_REGISTER_USERNAME_WRONG, null);
            case 32:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_REGISTER_UNSERNAME_WRONG2, null);
            case 33:
                return DialogUtil.createOKWarningDialog(this, paramInt, Constants.ERROR_REGISTER_PASSWORD_WRONG, null);
            case DIALOG_ACCOUNT_WRONG:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u767b\u5f55\u5931\u8d25\uff0c\u60a8\u7684\u5e10\u53f7\u548c\u5bc6\u7801\u4e0d\u5339\u914d\u3002", null);
            case DIALOG_UPOINT_PAYING:
                return DialogUtil.createIndeterminateProgressDialog(this, paramInt, "U\u70b9\u652f\u4ed8\u4e2d\uff0c\u8bf7\u7a0d\u5019...", false, null);
            case 36:
                return DialogUtil.createYesNoDialog(this, paramInt, "\u60a8\u624b\u673a\u65f6\u95f4\u4e0d\u6b63\u786e\uff0c\u4e3a\u4e86\u786e\u4fdd\u5b89\u5168\u652f\u4ed8\uff0c\u662f\u5426\u9700\u8981\u7cfb\u7edf\u81ea\u52a8\u4fee\u6b63\u5e76\u5b8c\u6210\u652f\u4ed8?", this);
            case DIALOG_UPOINT_PAYPASS_WRONG:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u60a8\u7684\u652f\u4ed8\u5bc6\u7801\u6709\u8bef\uff0c\u4e0d\u80fd\u652f\u4ed8\u6210\u529f\uff01", null);
            case DIALOG_SMS_FAIL:
                return DialogUtil.createOKWarningDialog(this, paramInt, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u60a8\u5df2\u7ecf\u7981\u6b62\u4e86\u53d1\u9001\u652f\u4ed8\u77ed\u4fe1\uff0c\u8bf7\u91cd\u65b0\u5c1d\u8bd5\u652f\u4ed8\u3002", null);
        }
    }

    public int getPayedAmount() {
        int i = Utils.getSmsPayment() - PrefUtil.getPayedAmount(getApplicationContext());
        int j = i / this.mSmsInfo.money;
        return this.mSmsInfo.money * (j - this.mLeftSmsToSendCount);
    }

    private void buildPaymentView() {
        this.mType = 0;
        this.mTimeoutCounter = 0;
        this.mLeftSmsToReceiveCount = -1;
        this.mLeftSmsToSendCount = -1;
        this.mIsSynced = false;
        this.mIsShowInfo = false;
        this.mSmsHander = null;
        this.mSmsContent = null;
        RelativeLayout paytitle = Utils.initSubTitle(getApplicationContext(), this, "\u8d2d\u4e70\u5185\u5bb9", false);
        TextView payContentTextView = new TextView(getApplicationContext());
        payContentTextView.setTextSize(16.0f);
        payContentTextView.setTextColor(Color.parseColor("#FF858D8D"));
        payContentTextView.setPadding(10, 10, 0, 10);
        payContentTextView.setText("\u5c0a\u656c\u7684\u7528\u6237\uff0c\u60a8\u9700\u8981\u4e3a\u4ee5\u4e0b\u5185\u5bb9\u652f\u4ed8\u8d39\u7528\uff0c\u8bf7\u9605\u8bfb\u4ee5\u4e0b\u4fe1\u606f\uff0c\u786e\u8ba4\u6240\u8d2d\u5185\u5bb9\u65e0\u8bef\u3002");
        TextView payContentDetailTextView = new TextView(getApplicationContext());
        payContentDetailTextView.setTextSize(16.0f);
        payContentDetailTextView.setPadding(20, 0, 20, 0);
        payContentDetailTextView.setText(String.format("\u6240\u8d2d\u5185\u5bb9 : %s", this.mPaymentInfo.getPaydesc()));
        payContentDetailTextView.setTextColor(-12303292);
        String moneyStr = new DecimalFormat("##0.00").format(this.mPaymentInfo.getMoney() / 10.0f);
        TextView payCountTextView = new TextView(getApplicationContext());
        payCountTextView.setTextSize(16.0f);
        payCountTextView.setPadding(20, 0, 0, 20);
        payCountTextView.setText(String.format("\u652f\u4ed8\u91d1\u989d: %s\u5143", moneyStr));
        payCountTextView.setTextColor(-12303292);
        LinearLayout linearLayout = new LinearLayout(getApplicationContext());
        linearLayout.setBackgroundColor(-1);
        linearLayout.setOrientation(1);
        LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-1, -2);
        linearLayout.addView(paytitle, localLayoutParams);
        linearLayout.addView(payContentTextView, localLayoutParams);
        linearLayout.addView(payContentDetailTextView, localLayoutParams);
        linearLayout.addView(payCountTextView, localLayoutParams);
        this.mListView = new ListView(getApplicationContext());
        this.mListView.setBackgroundColor(-1);
        this.mListView.setCacheColorHint(-1);
        this.mListView.addHeaderView(linearLayout, null, true);
        this.mListView.setOnItemClickListener(this);
        this.mListView.addFooterView(Utils.generateFooterView(this), null, false);
        setContentView(this.mListView);
        fillData();
        new HandlerProxy(getApplicationContext(), this).handleRequest();
    }

    private void buildUPointPaymentView() {
        this.mType = 1;
        TextView payTypeNameTextView = new TextView(getApplicationContext());
        payTypeNameTextView.setTextSize(16.0f);
        payTypeNameTextView.setPadding(20, 0, 20, 0);
        payTypeNameTextView.setTextColor(-12303292);
        payTypeNameTextView.setText(String.format("\u652f\u4ed8\u540d\u79f0 : %s", this.mPaymentInfo.getPayname()));
        this.mTvProduct = new TextView(getApplicationContext());
        this.mTvProduct.setTextSize(16.0f);
        this.mTvProduct.setPadding(20, 0, 20, 0);
        this.mTvProduct.setText("\u4ea7\u54c1\u540d : ");
        this.mTvProduct.setTextColor(-12303292);
        TextView payContentTextView = new TextView(getApplicationContext());
        payContentTextView.setTextSize(16.0f);
        payContentTextView.setPadding(20, 0, 20, 20);
        payContentTextView.setText(String.format("\u6240\u8d2d\u5185\u5bb9 : %s", this.mPaymentInfo.getPaydesc()));
        payContentTextView.setTextColor(-12303292);
        TextView payCountTextView = new TextView(getApplicationContext());
        payCountTextView.setTextSize(16.0f);
        payCountTextView.setPadding(20, 0, 20, 0);
        payCountTextView.setText(String.format("\u652f\u4ed8\u6570\u989d : %dU\u70b9\uff08\u4ef7\u503c%s\u5143\uff09", Integer.valueOf(this.mPaymentInfo.getMoney()), new DecimalFormat("##0.00").format(this.mPaymentInfo.getMoney() / 10.0f)));
        payCountTextView.setTextColor(-13487566);
        this.mTvDiscountTextView = new TextView(getApplicationContext());
        this.mTvDiscountTextView.setTextSize(16.0f);
        this.mTvDiscountTextView.setPadding(20, 0, 20, 0);
        this.mTvDiscountTextView.setText("U\u70b9\u6298\u6263 : ");
        this.mTvDiscountTextView.setTextColor(-13487566);
        this.mTvVipDiscountTextView = new TextView(getApplicationContext());
        this.mTvVipDiscountTextView.setTextSize(16.0f);
        this.mTvVipDiscountTextView.setPadding(20, 0, 20, 0);
        this.mTvVipDiscountTextView.setText("\u4f1a\u5458\u6298\u6263 : ");
        this.mTvVipDiscountTextView.setTextColor(-13487566);
        this.mTvVipDiscountTimeTextView = new TextView(getApplicationContext());
        this.mTvVipDiscountTimeTextView.setTextSize(16.0f);
        this.mTvVipDiscountTimeTextView.setPadding(20, 0, 20, 0);
        this.mTvVipDiscountTimeTextView.setText("\u4f1a\u5458\u6298\u6263\u5230\u671f\u65f6\u95f4 : ");
        this.mTvVipDiscountInfo = new TextView(getApplicationContext());
        this.mTvVipDiscountInfo.setTextColor(-13487566);
        this.mTvVipDiscountInfo = new TextView(getApplicationContext());
        this.mTvVipDiscountInfo.setTextSize(16.0f);
        this.mTvVipDiscountInfo.setPadding(20, 0, 20, 0);
        this.mTvVipDiscountInfo.setText("\u4f1a\u5458\u6298\u6263\u4fe1\u606f : ");
        this.mTvVipDiscountInfo.setTextColor(-13487566);
        this.mBtnPay = new Button(getApplicationContext());
        this.mBtnPay.setText("\u786e\u8ba4");
        this.mBtnPay.setOnClickListener(this);
        this.mBtnPay.setVisibility(8);
        LinearLayout.LayoutParams localLayoutParams3 = new LinearLayout.LayoutParams(Player.PREFETCHED, -2);
        localLayoutParams3.gravity = 1;
        LinearLayout localLinearLayout2 = new LinearLayout(getApplicationContext());
        localLinearLayout2.addView(this.mBtnPay, localLayoutParams3);
        localLinearLayout2.setGravity(1);
        LinearLayout localLinearLayout3 = new LinearLayout(getApplicationContext());
        localLinearLayout3.setOrientation(1);
        localLinearLayout3.setBackgroundColor(-1);
        LinearLayout.LayoutParams localLayoutParams4 = new LinearLayout.LayoutParams(-1, -2);
        localLinearLayout3.addView(Utils.initSubTitle(getApplicationContext(), this, "\u9700\u8981\u652f\u4ed8\u7684\u5185\u5bb9", true), localLayoutParams4);
        localLinearLayout3.addView(payTypeNameTextView, localLayoutParams4);
        localLinearLayout3.addView(this.mTvProduct, localLayoutParams4);
        localLinearLayout3.addView(payContentTextView, localLayoutParams4);
        localLinearLayout3.addView(payCountTextView, localLayoutParams4);
        localLinearLayout3.addView(this.mTvDiscountTextView, localLayoutParams4);
        localLinearLayout3.addView(this.mTvVipDiscountTextView, localLayoutParams4);
        localLinearLayout3.addView(this.mTvVipDiscountTimeTextView, localLayoutParams4);
        localLinearLayout3.addView(this.mTvVipDiscountInfo, localLayoutParams4);
        localLinearLayout3.addView(localLinearLayout2, localLayoutParams4);
        ScrollView localScrollView = new ScrollView(getApplicationContext());
        localScrollView.setBackgroundColor(-1);
        localScrollView.addView(localLinearLayout3);
        setContentView(localScrollView);
        if (Utils.getUPointInfo() == null) {
            showDialog(14);
            Api.queryUPointDiscount(getApplicationContext(), this, Utils.getPaymentInfo().getCpID(), Utils.getPaymentInfo().getmGameID(), Utils.getPaymentInfo().getMoney());
        } else {
            initUPointPayView(Utils.getUPointInfo());
        }
    }

    private void initUPointPayView(UPointInfo info) {
        this.mTvDiscountTextView.setText(String.format("U\u70b9\u6298\u6263 : %s\u6298(%sU\u70b9)", info.getDiscount(), info.getDiscounttext()));
        if (info.getVipdiscount() != null && info.getVipdiscount().length() > 0) {
            this.mTvDiscountTextView.setText(String.format("\u4f1a\u5458\u6298\u6263 : %s\u6298(%sU\u70b9)", info.getVipdiscount(), info.getVipdiscounttext()));
            this.mTvVipDiscountTimeTextView.setText(String.format("\u4f1a\u5458\u6298\u6263\u5230\u671f\u65f6\u95f4 : ", info.getVipdiscounttime()));
            this.mTvVipDiscountInfo.setText("\u4f1a\u5458\u6298\u6263\u5230\u671f\u65f6\u95f4 : " + info.getDiscountinfo());
        } else {
            this.mTvVipDiscountTextView.setVisibility(8);
            this.mTvVipDiscountTimeTextView.setVisibility(8);
            this.mTvVipDiscountInfo.setVisibility(8);
        }
        this.mBtnPay.setVisibility(0);
    }

    private void buildUPointPayLoginView() {
        this.mType = 2;
        RelativeLayout title = Utils.initSubTitle(getApplicationContext(), this, "\u8bf7\u60a8\u8f93\u5165UC\u5e10\u53f7", true);
        title.setId(10);
        RelativeLayout.LayoutParams titleParams = new RelativeLayout.LayoutParams(-1, -2);
        titleParams.addRule(10, -1);
        title.setLayoutParams(titleParams);
        TextView noticeTextView = new TextView(getApplicationContext());
        RelativeLayout.LayoutParams noticeParams = new RelativeLayout.LayoutParams(-1, -2);
        noticeParams.addRule(3, 10);
        noticeParams.setMargins(10, 5, 10, 10);
        noticeTextView.setLayoutParams(noticeParams);
        noticeTextView.setId(1);
        noticeTextView.setCompoundDrawablePadding(10);
        noticeTextView.setTextColor(-13487566);
        noticeTextView.setCompoundDrawablesWithIntrinsicBounds(Utils.getDrawableFromFile(Utils.isHdpi() ? Constants.RES_LOCK_HDPI : Constants.RES_LOCK), (Drawable) null, (Drawable) null, (Drawable) null);
        noticeTextView.setText("\u60a8\u597d\uff0c\u8d2d\u4e70\u6b64\u5185\u5bb9\uff0c\u8bf7\u5148\u767b\u5f55UC\u8d26\u53f7\u3002\u60a8\u53ef\u4ee5\u8f93\u5165UC\u5e10\u53f7\u6216\u8005\u624b\u673a\u53f7\u7801\u8fdb\u884c\u767b\u5f55");
        TextView lineTextView = Utils.generateBorderView(getApplication());
        lineTextView.setId(11);
        RelativeLayout.LayoutParams lineParams = new RelativeLayout.LayoutParams(-1, 1);
        lineParams.addRule(3, 1);
        lineTextView.setLayoutParams(lineParams);
        RelativeLayout.LayoutParams accountParams = new RelativeLayout.LayoutParams(-1, -2);
        accountParams.setMargins(10, 10, 10, 5);
        TextView accountLable = new TextView(getApplicationContext());
        accountLable.setLayoutParams(accountParams);
        accountLable.setId(2);
        accountLable.setText("UC\u8d26\u53f7:");
        accountLable.setTextColor(-13487566);
        RelativeLayout.LayoutParams usernameParams = new RelativeLayout.LayoutParams(-1, -2);
        usernameParams.addRule(3, 2);
        usernameParams.setMargins(10, 5, 10, 5);
        this.mEtUsername = new EditText(getApplicationContext());
        this.mEtUsername.setLayoutParams(usernameParams);
        this.mEtUsername.setSingleLine();
        this.mEtUsername.setId(3);
        this.mEtUsername.setHint("\u7528\u6237\u540d");
        this.mEtPassword = new EditText(getApplicationContext());
        this.mEtPassword.setId(4);
        this.mEtPassword.setHint("\u5bc6\u7801");
        this.mEtPassword.setSingleLine();
        this.mEtPassword.setTransformationMethod(PasswordTransformationMethod.getInstance());
        RelativeLayout.LayoutParams userpassParams = new RelativeLayout.LayoutParams(-1, -2);
        userpassParams.addRule(3, 3);
        userpassParams.setMargins(10, 5, 10, 5);
        this.mEtPassword.setLayoutParams(userpassParams);
        this.mEtSavePass = new CheckBox(getApplicationContext());
        RelativeLayout.LayoutParams savepassParams = new RelativeLayout.LayoutParams(-1, -2);
        savepassParams.addRule(3, 4);
        savepassParams.setMargins(10, 5, 10, 5);
        this.mEtSavePass.setId(5);
        this.mEtSavePass.setTextColor(-12303292);
        this.mEtSavePass.setText("\u4fdd\u5b58\u5bc6\u7801");
        this.mEtSavePass.setLayoutParams(savepassParams);
        if (PrefUtil.getUCUserName(getApplicationContext()) != null) {
            this.mEtUsername.setText(PrefUtil.getUCUserName(getApplicationContext()));
            this.mEtSavePass.setChecked(true);
        } else {
            this.mEtSavePass.setChecked(false);
        }
        if (PrefUtil.getUCUserPass(getApplicationContext()) != null) {
            this.mEtPassword.setText(PrefUtil.getUCUserPass(getApplicationContext()));
        }
        Button submitBtn = new Button(getApplicationContext());
        submitBtn.setId(7);
        submitBtn.setText("\u786e\u5b9a\u8d2d\u4e70");
        submitBtn.setOnClickListener(this);
        RelativeLayout.LayoutParams submitLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
        submitLayoutParams.topMargin = 10;
        submitLayoutParams.addRule(3, 5);
        submitLayoutParams.addRule(14);
        submitBtn.setLayoutParams(submitLayoutParams);
        RelativeLayout inputareaLayout = new RelativeLayout(getApplicationContext());
        inputareaLayout.setId(7);
        inputareaLayout.setBackgroundColor(Constants.COLOR_LISTVIEW_ITEM_BACKGROUND);
        RelativeLayout.LayoutParams localLayoutParams8 = new RelativeLayout.LayoutParams(-1, -2);
        localLayoutParams8.addRule(3, 11);
        inputareaLayout.setLayoutParams(localLayoutParams8);
        inputareaLayout.addView(accountLable);
        inputareaLayout.addView(this.mEtUsername);
        inputareaLayout.addView(this.mEtPassword);
        inputareaLayout.addView(this.mEtSavePass);
        inputareaLayout.addView(submitBtn);
        RelativeLayout relativeLayout = new RelativeLayout(getApplicationContext());
        relativeLayout.setBackgroundColor(-1);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        relativeLayout.addView(title);
        relativeLayout.addView(noticeTextView);
        relativeLayout.addView(lineTextView);
        relativeLayout.addView(inputareaLayout);
        TextView lineTextView1 = Utils.generateBorderView(getApplication());
        RelativeLayout.LayoutParams localLayoutParams9 = new RelativeLayout.LayoutParams(-1, 1);
        localLayoutParams9.addRule(3, 7);
        lineTextView1.setLayoutParams(localLayoutParams9);
        relativeLayout.addView(lineTextView1);
        ScrollView scrollView = new ScrollView(getApplication());
        scrollView.setBackgroundColor(-1);
        scrollView.addView(relativeLayout);
        setContentView(scrollView);
    }

    private void buildUPointPayPassView() {
        this.mType = 3;
        RelativeLayout title = Utils.initSubTitle(getApplicationContext(), this, "\u8bf7\u60a8\u8f93\u5165U\u70b9\u652f\u4ed8\u5bc6\u7801", true);
        title.setId(10);
        RelativeLayout.LayoutParams titleParams = new RelativeLayout.LayoutParams(-1, -2);
        titleParams.addRule(10, -1);
        title.setLayoutParams(titleParams);
        TextView noticeTextView = new TextView(getApplicationContext());
        RelativeLayout.LayoutParams noticeParams = new RelativeLayout.LayoutParams(-1, -2);
        noticeParams.addRule(3, 10);
        noticeParams.setMargins(10, 5, 10, 10);
        noticeTextView.setLayoutParams(noticeParams);
        noticeTextView.setId(1);
        noticeTextView.setCompoundDrawablePadding(10);
        noticeTextView.setTextColor(-13487566);
        noticeTextView.setCompoundDrawablesWithIntrinsicBounds(Utils.getDrawableFromFile(Utils.isHdpi() ? Constants.RES_LOCK_HDPI : Constants.RES_LOCK), (Drawable) null, (Drawable) null, (Drawable) null);
        noticeTextView.setText("\u60a8\u597d\uff0c\u60a8\u7684U\u70b9\u8bbe\u7f6e\u6709\u652f\u4ed8\u5bc6\u7801\uff0c\u8bf7\u6536\u5165\u540e\u70b9\u51fb\u786e\u8ba4\u8fdb\u884c\u652f\u4ed8");
        TextView lineTextView = Utils.generateBorderView(getApplication());
        lineTextView.setId(11);
        RelativeLayout.LayoutParams lineParams = new RelativeLayout.LayoutParams(-1, 1);
        lineParams.addRule(3, 1);
        lineTextView.setLayoutParams(lineParams);
        RelativeLayout.LayoutParams accountParams = new RelativeLayout.LayoutParams(-1, -2);
        accountParams.setMargins(10, 10, 10, 5);
        TextView accountLable = new TextView(getApplicationContext());
        accountLable.setLayoutParams(accountParams);
        accountLable.setId(2);
        accountLable.setText("UC\u652f\u4ed8\u5bc6\u7801:");
        accountLable.setTextColor(-13487566);
        RelativeLayout.LayoutParams usernameParams = new RelativeLayout.LayoutParams(-1, -2);
        usernameParams.addRule(3, 2);
        usernameParams.setMargins(10, 5, 10, 5);
        this.mEtPayPass = new EditText(getApplicationContext());
        this.mEtPayPass.setLayoutParams(usernameParams);
        this.mEtPayPass.setSingleLine();
        this.mEtPayPass.setId(3);
        this.mEtPayPass.setHint("\u652f\u4ed8\u5bc6\u7801");
        Button submitBtn = new Button(getApplicationContext());
        submitBtn.setId(7);
        submitBtn.setText("\u786e\u5b9a\u8d2d\u4e70");
        submitBtn.setOnClickListener(this);
        RelativeLayout.LayoutParams submitLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
        submitLayoutParams.topMargin = 10;
        submitLayoutParams.addRule(3, 5);
        submitLayoutParams.addRule(14);
        submitBtn.setLayoutParams(submitLayoutParams);
        RelativeLayout inputareaLayout = new RelativeLayout(getApplicationContext());
        inputareaLayout.setId(7);
        inputareaLayout.setBackgroundColor(Constants.COLOR_LISTVIEW_ITEM_BACKGROUND);
        RelativeLayout.LayoutParams localLayoutParams8 = new RelativeLayout.LayoutParams(-1, -2);
        localLayoutParams8.addRule(3, 11);
        inputareaLayout.setLayoutParams(localLayoutParams8);
        inputareaLayout.addView(accountLable);
        inputareaLayout.addView(this.mEtPayPass);
        inputareaLayout.addView(submitBtn);
        RelativeLayout relativeLayout = new RelativeLayout(getApplicationContext());
        relativeLayout.setBackgroundColor(-1);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        relativeLayout.addView(title);
        relativeLayout.addView(noticeTextView);
        relativeLayout.addView(lineTextView);
        relativeLayout.addView(inputareaLayout);
        TextView lineTextView1 = Utils.generateBorderView(getApplication());
        RelativeLayout.LayoutParams localLayoutParams9 = new RelativeLayout.LayoutParams(-1, 1);
        localLayoutParams9.addRule(3, 7);
        lineTextView1.setLayoutParams(localLayoutParams9);
        relativeLayout.addView(lineTextView1);
        ScrollView scrollView = new ScrollView(getApplication());
        scrollView.setBackgroundColor(-1);
        scrollView.addView(relativeLayout);
        setContentView(scrollView);
    }

    public void buildSmsPaymentView() {
        this.mType = 4;
        this.mSmsId = 0;
        RelativeLayout relativeLayout = new RelativeLayout(getApplicationContext());
        relativeLayout.setBackgroundColor(-1);
        relativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        RelativeLayout title = Utils.initSubTitle(getApplicationContext(), this, "\u77ed\u4fe1\u652f\u4ed8", false);
        title.setId(1);
        title.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        relativeLayout.addView(title);
        TextView waitTextView = new TextView(this);
        waitTextView.setId(2);
        waitTextView.setTextSize(18.0f);
        waitTextView.setTextColor(-12303292);
        waitTextView.setPadding(10, 10, 0, 0);
        waitTextView.setFocusable(true);
        waitTextView.setClickable(true);
        waitTextView.setLinkTextColor(Constants.COLOR_LINK_TEXT);
        waitTextView.setText("\u5c0a\u656c\u7684\u7528\u6237\uff0c\u6b63\u5728\u83b7\u53d6\u4fe1\u606f\uff0c\u8bf7\u7a0d\u540e......");
        RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(-1, -2);
        localLayoutParams1.addRule(3, 1);
        waitTextView.setLayoutParams(localLayoutParams1);
        relativeLayout.addView(waitTextView);
        TextView beforeSendText = new TextView(this);
        beforeSendText.setId(3);
        beforeSendText.setTextSize(16.0f);
        beforeSendText.setTextColor(-7829368);
        beforeSendText.setPadding(10, DIALOG_USERNAME_IS_EMPTY, 0, 0);
        beforeSendText.setFocusable(true);
        beforeSendText.setClickable(true);
        beforeSendText.setLinkTextColor(Constants.COLOR_LINK_TEXT);
        RelativeLayout.LayoutParams localLayoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        localLayoutParams2.addRule(3, 2);
        beforeSendText.setLayoutParams(localLayoutParams2);
        relativeLayout.addView(beforeSendText);
        Button submitBtn = new Button(getApplicationContext());
        submitBtn.setText("\u70b9\u64ad");
        submitBtn.setId(3);
        submitBtn.setOnClickListener(this);
        Button cancelButton = new Button(getApplicationContext());
        cancelButton.setText("\u53d6\u6d88");
        cancelButton.setId(4);
        cancelButton.setOnClickListener(this);
        try {
            Utils.CheckSimCardSupprotInfo(getApplicationContext());
            int smsPayCount = Utils.getSmsPayment();
            if (smsPayCount <= PrefUtil.getPayedAmount(getApplicationContext())) {
                this.mSmsResultInfo = "\u60a8\u5df2\u652f\u4ed8\u5b8c\u6210\uff0c\u5c06\u8fd4\u56de\u60a8\u7684\u6e38\u620f\u4e2d\u3002";
                showDialog(20);
            } else if (!this.mIsSynced) {
                showDialog(19);
                new SyncSmsInfoHandler(getApplicationContext(), new Handler.OnFinishListener(waitTextView, beforeSendText, smsPayCount, cancelButton, submitBtn, relativeLayout) {
                    Button cancelBtn;
                    RelativeLayout contentPanel;
                    Button okBtn;
                    int smsPayment;
                    TextView tvInfo2;
                    TextView waitTV;

                    {
                        this.waitTV = waitTextView;
                        this.tvInfo2 = beforeSendText;
                        this.smsPayment = smsPayCount;
                        this.cancelBtn = cancelButton;
                        this.okBtn = submitBtn;
                        this.contentPanel = relativeLayout;
                    }

                    @Override
                    public void onFinish() {
                        if (Utils.getSmsInfos() != null) {
                            PaymentsActivity.this.mIsSynced = true;
                            PaymentsActivity.this.removeDialog(19);
                            PaymentsActivity.this.initSmsPayView(this.waitTV, this.tvInfo2, this.smsPayment, this.cancelBtn, this.okBtn, this.contentPanel);
                        } else {
                            PaymentsActivity.this.removeDialog(19);
                            PaymentsActivity.this.showDialog(15);
                        }
                    }
                }).handleRequest();
            } else {
                initSmsPayView(waitTextView, beforeSendText, smsPayCount, cancelButton, submitBtn, relativeLayout);
            }
        } catch (SimCardNotSupportException localSimCardNotSupportException) {
            this.mSmsResultInfo = localSimCardNotSupportException.getMessage();
            showDialog(16);
        }
    }

    public void initSmsPayView(TextView tvSmsMessage, TextView tvSmsText, int payMoney, Button cancelBtn, Button okBtn, RelativeLayout tableLayout) {
        Spanned showtext;
        Spanned showtext2;
        RelativeLayout.LayoutParams okBtnParams = new RelativeLayout.LayoutParams(150, -2);
        try {
            int payedCount = PrefUtil.getPayedAmount(getApplicationContext());
            if (payedCount == 0) {
                if (this.mSmsInfo == null) {
                    this.mSmsInfo = Utils.getSmsInfos().filterSmsInfo(getApplicationContext(), payMoney);
                    this.mSmsInfo.setExtInfo(this.mPaymentInfo);
                }
                int smsTotalToSendCount = payMoney / this.mSmsInfo.money;
                if (payMoney % this.mSmsInfo.money != 0) {
                    smsTotalToSendCount++;
                }
                if (!this.mSmsInfo.isNeedconfirm()) {
                    if (this.mLeftSmsToSendCount == -1) {
                        this.mLeftSmsToReceiveCount = smsTotalToSendCount;
                        this.mLeftSmsToSendCount = smsTotalToSendCount;
                        showtext2 = Html.fromHtml(String.format("\u5c0a\u656c\u7684\u7528\u6237\uff0c\u611f\u8c22\u60a8\u4e3a\u6e38\u620f\u652f\u4ed8\uff0c\u60a8\u9700\u8981\u53d1\u9001<font color='#FF4500'>[ %d ]</font>\u6761 %d \u5143\u7684\u77ed\u4fe1\uff0c\u8d2d\u4e70<font color='#FF4500'>[%s]</font>\uff0c\u5171\u8ba1<font color='#FF4500'>[ %d ]</font>\u5143\uff0c\u70b9\u51fb<font color='#FF4500'>[\u70b9\u64ad]</font>\u5f00\u59cb\u53d1\u9001\u3002\u8bf7\u6ce8\u610f\u53d1\u9001\u5f00\u59cb\u540e\uff0c\u60a8\u4e0d\u80fd\u4e2d\u65ad\u53d1\u9001\uff0c\u5426\u5219\u8d2d\u4e70\u5c06\u4e0d\u6210\u529f\u3002", Integer.valueOf(this.mLeftSmsToSendCount), Integer.valueOf(this.mSmsInfo.money), this.mPaymentInfo.getPayname(), Integer.valueOf(payMoney)));
                        this.mIsShowInfo = true;
                    } else {
                        showtext2 = Html.fromHtml(String.format("\u5c0a\u656c\u7684\u7528\u6237\uff0c\u70b9\u51fb<font color='#FF4500'>[\u786e\u5b9a]</font>\u6309\u94ae\uff0c\u53d1\u9001\u7b2c<font color='#FF4500'>[ %d ]</font>\u6761\u77ed\u4fe1\u3002", Integer.valueOf((smsTotalToSendCount - this.mLeftSmsToSendCount) + 1)));
                        cancelBtn.setVisibility(8);
                        okBtn.setText("\u786e\u5b9a");
                        okBtnParams.addRule(14, -1);
                    }
                    tvSmsMessage.setText(showtext2);
                    tvSmsText.setText(this.mSmsInfo.getInfobeforesend());
                } else {
                    tvSmsMessage.setText(this.mSmsInfo.getInfobeforesend());
                    cancelBtn.setVisibility(8);
                    okBtn.setText("\u786e\u5b9a");
                    okBtnParams.addRule(14, -1);
                }
            } else {
                int payMoney2 = payMoney - payedCount;
                if (this.mSmsInfo == null) {
                    this.mSmsInfo = Utils.getSmsInfos().filterSmsInfo(getApplicationContext(), payMoney2);
                    this.mSmsInfo.setExtInfo(this.mPaymentInfo);
                }
                if (!this.mSmsInfo.isNeedconfirm()) {
                    if (this.mLeftSmsToSendCount == -1) {
                        int smsTotalToSendCount2 = payMoney2 / this.mSmsInfo.money;
                        if (payMoney2 % this.mSmsInfo.money != 0) {
                            smsTotalToSendCount2++;
                        }
                        this.mIsShowInfo = true;
                        this.mLeftSmsToSendCount = smsTotalToSendCount2;
                        this.mLeftSmsToReceiveCount = smsTotalToSendCount2;
                        showtext = Html.fromHtml(String.format("\u60a8\u4ee5\u524d\u6210\u529f\u53d1\u9001\u8fc7\u603b\u8ba1 %d \u5143\u7684\u77ed\u4fe1\u8d2d\u4e70<font color='#FF4500'>[%s]</font>\uff0c\u76ee\u524d\u8fd8\u9700\u53d1\u9001<font color='#FF4500'>[ %d ]</font>\u6761  %d \u5143\u77ed\u4fe1\u7ee7\u7eed\u8d2d\u4e70\uff0c\u70b9\u51fb<font color='#FF4500'>[\u70b9\u64ad]</font>\u6309\u94ae\u5f00\u59cb\u53d1\u9001\u3002", Integer.valueOf(payedCount), this.mPaymentInfo.getPayname(), Integer.valueOf(this.mLeftSmsToSendCount), Integer.valueOf(this.mSmsInfo.money)));
                    } else {
                        showtext = Html.fromHtml(String.format("\u5c0a\u656c\u7684\u7528\u6237\uff0c\u70b9\u51fb<font color='#FF4500'>[\u786e\u5b9a]</font>\u6309\u94ae\uff0c\u5f00\u59cb\u53d1\u9001\u7b2c<font color='#FF4500'>[ %d ]</font>\u6761\u77ed\u4fe1\u3002", Integer.valueOf(((payMoney2 / this.mSmsInfo.money) - this.mLeftSmsToSendCount) + 1), Integer.valueOf(this.mLeftSmsToSendCount)));
                        cancelBtn.setVisibility(8);
                        okBtn.setText("\u786e\u5b9a");
                        okBtnParams.addRule(14, -1);
                    }
                    tvSmsMessage.setText(showtext);
                    tvSmsText.setText(this.mSmsInfo.getInfobeforesend());
                } else {
                    tvSmsMessage.setText(this.mSmsInfo.getInfobeforesend());
                    cancelBtn.setVisibility(8);
                    okBtn.setText("\u786e\u5b9a");
                    okBtnParams.addRule(14, -1);
                }
            }
            Linkify.addLinks(tvSmsMessage, 4);
            Linkify.addLinks(tvSmsText, 4);
        } catch (SimCardNotSupportException localSimCardNotSupportException) {
            this.mSmsResultInfo = localSimCardNotSupportException.getMessage();
            showDialog(16);
        }
        okBtnParams.addRule(12, -1);
        okBtnParams.setMargins(10, 20, 10, 10);
        okBtn.setLayoutParams(okBtnParams);
        tableLayout.addView(okBtn);
        RelativeLayout.LayoutParams cancelBtnParams = new RelativeLayout.LayoutParams(150, -2);
        cancelBtnParams.addRule(11, -1);
        cancelBtnParams.addRule(12, -1);
        cancelBtnParams.setMargins(10, 20, 10, 10);
        cancelBtn.setLayoutParams(cancelBtnParams);
        tableLayout.addView(cancelBtn);
        setContentView(tableLayout);
    }

    public void buildSmsPaymentConfirmView(String smsaddress, String smsconfirmnumber) {
        this.mType = 5;
        try {
            Utils.CheckSimCardSupprotInfo(getApplicationContext());
            RelativeLayout relativeLayout = new RelativeLayout(getApplicationContext());
            relativeLayout.setBackgroundColor(-1);
            relativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
            RelativeLayout title = Utils.initSubTitle(getApplicationContext(), this, "\u8d2d\u4e70\u5185\u5bb9", true);
            title.setId(1);
            title.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
            relativeLayout.addView(title);
            TextView localTextView2 = new TextView(this);
            localTextView2.setId(2);
            localTextView2.setTextSize(16.0f);
            localTextView2.setTextColor(-13487566);
            localTextView2.setPadding(10, 10, 0, 0);
            localTextView2.setFocusable(true);
            localTextView2.setClickable(true);
            localTextView2.setLinkTextColor(Constants.COLOR_LINK_TEXT);
            localTextView2.setText(String.format("\u518d\u6b21\u70b9\u51fb\u4e0b\u4e00\u6b65\u5373\u540c\u610f\u5411\n%s\u53d1\u9001\u77ed\u4fe1\u4ee5\u5b8c\u6210\u672c\u6b21\u77ed\u4fe1\u53d1\u9001\u8fc7\u7a0b\u3002", smsaddress, this.mPaymentInfo.getPayname(), Integer.valueOf(Utils.getSmsPayment())));
            Linkify.addLinks(localTextView2, 4);
            RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(-1, -2);
            localLayoutParams1.addRule(3, 1);
            localTextView2.setLayoutParams(localLayoutParams1);
            relativeLayout.addView(localTextView2);
            Button localButton1 = new Button(getApplicationContext());
            localButton1.setText("\u4e0b\u4e00\u6b65");
            localButton1.setId(5);
            this.mConfirmSmsInfoString = String.valueOf(smsaddress) + TERM + smsconfirmnumber;
            localButton1.setTag(this.mConfirmSmsInfoString);
            localButton1.setOnClickListener(this);
            RelativeLayout.LayoutParams localLayoutParams2 = new RelativeLayout.LayoutParams(150, -2);
            localLayoutParams2.addRule(12, -1);
            localLayoutParams2.setMargins(10, 20, 10, 10);
            localButton1.setLayoutParams(localLayoutParams2);
            relativeLayout.addView(localButton1);
            Button localButton2 = new Button(getApplicationContext());
            localButton2.setText("\u53d6\u6d88");
            localButton2.setId(6);
            localButton2.setOnClickListener(this);
            RelativeLayout.LayoutParams localLayoutParams3 = new RelativeLayout.LayoutParams(150, -2);
            localLayoutParams3.addRule(11, -1);
            localLayoutParams3.addRule(12, -1);
            localLayoutParams3.setMargins(10, 20, 10, 10);
            localButton2.setLayoutParams(localLayoutParams3);
            relativeLayout.addView(localButton2);
            setContentView(relativeLayout);
        } catch (SimCardNotSupportException localSimCardNotSupportException) {
            this.mSmsResultInfo = localSimCardNotSupportException.getMessage();
            showDialog(16);
        }
    }

    private void fillData() {
        ArrayList<IType> arrayListofPayType = PrefUtil.getAvailablePayType(getApplicationContext(), this.mPaymentInfo.getPaytype());
        IType[] arrayOfPayType = new IType[arrayListofPayType.size()];
        if (PaymentInfo.PAYTYPE_OVERAGE.equals(this.mPaymentInfo.getPaytype())) {
            Iterator<IType> localIterator = arrayListofPayType.iterator();
            while (true) {
                if (!localIterator.hasNext()) {
                    break;
                }
                IType aPayType = localIterator.next();
                if (TypeFactory.TYPE_PAY_UPOINT.equals(aPayType.getId())) {
                    arrayOfPayType[0] = aPayType;
                    break;
                }
            }
        } else if ("sms".equals(this.mPaymentInfo.getPaytype())) {
            Iterator<IType> localIterator2 = arrayListofPayType.iterator();
            while (true) {
                if (!localIterator2.hasNext()) {
                    break;
                }
                IType aPayType2 = localIterator2.next();
                if ("sms".equals(aPayType2.getId())) {
                    arrayOfPayType[0] = aPayType2;
                    break;
                }
            }
        } else {
            Iterator<IType> localIterator3 = arrayListofPayType.iterator();
            while (localIterator3.hasNext()) {
                IType aPayType3 = localIterator3.next();
                if (TypeFactory.TYPE_PAY_UPOINT.equals(aPayType3.getId())) {
                    arrayOfPayType[0] = aPayType3;
                } else if ("sms".equals(aPayType3.getId())) {
                    arrayOfPayType[arrayOfPayType.length - 1] = aPayType3;
                }
            }
        }
        this.mListView.setAdapter((ListAdapter) new CustomAdapter(getApplicationContext(), arrayOfPayType));
    }

    @Override
    public void onClick(View paramView) {
        if (paramView == this.mBtnPay) {
            this.mBtnPay.setEnabled(false);
            buildUPointPayLoginView();
            return;
        }
        switch (paramView.getId()) {
            case 3:
                break;
            case 4:
                buildPaymentView();
                return;
            case 5:
                if (this.mConfirmSmsInfoString != null && this.mConfirmSmsInfoString.contains(TERM)) {
                    sendConfirmSms(this.mConfirmSmsInfoString);
                    return;
                }
                return;
            case 6:
                showDialog(23);
                return;
            case 7:
                ((Button) paramView).setEnabled(false);
                String usernamestr = this.mEtUsername.getText().toString();
                String pwdstr = this.mEtPassword.getText().toString();
                if (TextUtils.isEmpty(usernamestr) && TextUtils.isEmpty(pwdstr)) {
                    showDialog(DIALOG_PASSWORD_OR_USERNAME_IS_EMPTY);
                    return;
                }
                if (TextUtils.isEmpty(pwdstr)) {
                    showDialog(DIALOG_PASSWORD_IS_EMPTY);
                    return;
                } else if (TextUtils.isEmpty(usernamestr)) {
                    showDialog(DIALOG_USERNAME_IS_EMPTY);
                    return;
                } else {
                    this.mUPayInfo = new UPointPayInfo(usernamestr, pwdstr, "", this.mPaymentInfo.getCpID(), this.mPaymentInfo.getmGameID(), this.mPaymentInfo.getMoney(), "");
                    pay();
                    return;
                }
            case 8:
                ((Button) paramView).setEnabled(false);
                String paypassstr = this.mEtPayPass.getText().toString();
                if (TextUtils.isEmpty(paypassstr)) {
                    showDialog(DIALOG_PASSWORD_OR_USERNAME_IS_EMPTY);
                    break;
                } else {
                    this.mUPayInfo.setPaypwd(paypassstr);
                    pay();
                    break;
                }
            case 9:
                switch (this.mType) {
                    case 0:
                        finish();
                        break;
                    case 1:
                        buildPaymentView();
                        break;
                    case 2:
                        buildUPointPaymentView();
                        break;
                    case 3:
                        buildUPointPayLoginView();
                        break;
                    case 4:
                        if (!this.mSmsInfo.isNeedconfirm() && !this.mIsShowInfo) {
                            int totalToPay = Utils.getSmsPayment();
                            int totalSMS = totalToPay / this.mSmsInfo.money;
                            if (this.mLeftSmsToSendCount != -1 && this.mLeftSmsToSendCount != totalSMS) {
                                showDialog(DIALOG_PAY_SMS_RETRY_MULTIPLE);
                                break;
                            } else {
                                buildSmsPaymentView();
                                break;
                            }
                        } else {
                            buildPaymentView();
                            break;
                        }
                        break;
                    case 5:
                        showDialog(23);
                        break;
                }
                return;
            case 10:
                switch (this.mType) {
                    case 4:
                        if (this.mSmsInfo.isNeedconfirm() || this.mIsShowInfo) {
                            int i = Utils.getSmsPayment();
                            int j = i / this.mSmsInfo.money;
                            if (this.mLeftSmsToSendCount != -1 && this.mLeftSmsToSendCount != j) {
                                showDialog(DIALOG_PAY_SMS_RETRY_MULTIPLE);
                                break;
                            } else {
                                buildPaymentView();
                                break;
                            }
                        }
                        break;
                    case 5:
                        showDialog(23);
                        break;
                    default:
                        finish();
                        break;
                }
                return;
            default:
                return;
        }
        if (this.mIsShowInfo) {
            buildSmsPaymentView();
            this.mIsShowInfo = false;
        } else if (this.mSmsInfo != null) {
            registerReceiver(this.mSmsReceiver, new IntentFilter(SmsInfo.ACTION_SMS_SENT));
            sendFirstSms(this.mSmsInfo);
        }
    }

    private void sendFirstSms(SmsInfo paramSmsInfo) {
        showDialog(17);
        try {
            paramSmsInfo.sendFirstSms(getApplicationContext());
        } catch (Exception e) {
            if (this.mSmsHander != null && this.mSmsRunnable != null) {
                this.mSmsHander.removeCallbacks(this.mSmsRunnable);
                getContentResolver().unregisterContentObserver(this.mSmsContent);
                try {
                    unregisterReceiver(this.mSmsReceiver);
                } catch (IllegalArgumentException e2) {
                }
            }
            removeDialog(17);
            showDialog(DIALOG_SMS_FAIL);
        }
    }

    private void sendConfirmSms(String paramString) {
        showDialog(17);
        try {
            SmsInfo.sendSms(getApplicationContext(), paramString.split(TERM)[0], paramString.split(TERM)[1]);
        } catch (Exception e) {
            if (this.mSmsHander != null && this.mSmsRunnable != null) {
                this.mSmsHander.removeCallbacks(this.mSmsRunnable);
                getContentResolver().unregisterContentObserver(this.mSmsContent);
                try {
                    unregisterReceiver(this.mSmsReceiver);
                } catch (IllegalArgumentException e2) {
                }
            }
            removeDialog(17);
            showDialog(DIALOG_SMS_FAIL);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override
    public void onWarningDialogOK(int paramInt) {
        switch (paramInt) {
            case 0:
            case 1:
            case 22:
                finish();
                break;
            case 10:
                pay();
                break;
            case 13:
                Intent localIntent = new Intent();
                setResult(-1, localIntent);
                finish();
                break;
            case 15:
            case 16:
            case 24:
                buildPaymentView();
                break;
            case 20:
                PrefUtil.clearPayedAmount(getApplicationContext());
                Intent localIntent2 = new Intent();
                setResult(-1, localIntent2);
                finish();
                break;
            case 21:
            case DIALOG_PAY_SMS_DELETE_BACK_CONFIRM:
                if (this.mSmsHander != null && this.mSmsRunnable != null) {
                    this.mSmsHander.removeCallbacks(this.mSmsRunnable);
                }
                if (this.mSmsContent != null) {
                    getContentResolver().unregisterContentObserver(this.mSmsContent);
                }
                try {
                    unregisterReceiver(this.mSmsReceiver);
                } catch (IllegalArgumentException e) {
                }
                buildPaymentView();
                break;
            case 23:
                showDialog(24);
                break;
            case 26:
                if (4 == this.mType) {
                    sendFirstSms(this.mSmsInfo);
                    break;
                } else {
                    sendConfirmSms(this.mConfirmSmsInfoString);
                    break;
                }
            case 36:
                pay();
                break;
        }
    }

    @Override
    public void onWarningDialogCancel(int paramInt) {
        switch (paramInt) {
            case 24:
            case DIALOG_PAY_SMS_DELETE_BACK_CONFIRM:
                if (this.mSmsHander != null && this.mSmsRunnable != null) {
                    this.mSmsHander.removeCallbacks(this.mSmsRunnable);
                    getContentResolver().unregisterContentObserver(this.mSmsContent);
                    try {
                        unregisterReceiver(this.mSmsReceiver);
                    } catch (IllegalArgumentException e) {
                    }
                }
                finish();
                break;
            case DIALOG_PAY_SMS_RETRY_MULTIPLE:
                if (this.mSmsHander != null && this.mSmsRunnable != null) {
                    this.mSmsHander.removeCallbacks(this.mSmsRunnable);
                    getContentResolver().unregisterContentObserver(this.mSmsContent);
                    try {
                        unregisterReceiver(this.mSmsReceiver);
                    } catch (IllegalArgumentException e2) {
                    }
                }
                buildPaymentView();
                break;
        }
    }

    private void pay() {
        showDialog(6);
        Api.pay(getApplicationContext(), this, this.mPaymentInfo, this.mUPayInfo);
    }

    @Override
    protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent) {
        super.onActivityResult(paramInt1, paramInt2, paramIntent);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (this.mIsValid) {
            PrefUtil.logout(getApplicationContext());
            Utils.clearSmsInfos();
            Utils.clearUPointInfo();
            TypeFactory.clear();
            Utils.clearUPointPayInfo();
            SyncChargeChannelHandler.init();
            SyncPayChannelHandler.init();
            SyncSmsInfoHandler.init();
        }
    }

    public static void init(Context paramContext) {
        SyncChargeChannelHandler.init();
        SyncPayChannelHandler.init();
        SyncSmsInfoHandler.init();
    }

    @Override
    public void onSuccess(int paramInt, Object paramObject) {
        switch (paramInt) {
            case 3:
                String resultstr = (String) paramObject;
                String[] resultarr = resultstr.split("#");
                int returncodeint = Integer.parseInt(resultarr[0]);
                String errormsg = resultarr[1];
                removeDialog(6);
                if (returncodeint == -110) {
                    showDialog(7);
                    this.mUPayInfo.updateConsumeId();
                    break;
                } else if (returncodeint == -102 && errormsg.equals("uc_tm_modify")) {
                    String timestr = resultarr[2];
                    this.mUPayInfo.setTm(timestr);
                    showDialog(36);
                    break;
                } else if (returncodeint < 0) {
                    if (returncodeint == -102) {
                        if (errormsg.equals("uc_password_error")) {
                            showDialog(DIALOG_ACCOUNT_WRONG);
                            break;
                        } else if (errormsg.equals("um_account_error")) {
                            showDialog(5);
                            break;
                        } else if (errormsg.equals("um_paypwd_error")) {
                            showDialog(DIALOG_UPOINT_PAYPASS_WRONG);
                            break;
                        } else if (errormsg.equals("um_paypwd_error")) {
                            if (this.mType == 3) {
                                showDialog(7);
                                break;
                            } else {
                                if (this.mEtSavePass.isChecked()) {
                                    PrefUtil.setUCUserName(getApplicationContext(), this.mEtUsername.getText().toString());
                                    PrefUtil.setUCUserPass(getApplicationContext(), this.mEtPassword.getText().toString());
                                } else {
                                    PrefUtil.clearUCUserName(getApplicationContext());
                                    PrefUtil.clearUCUserPass(getApplicationContext());
                                }
                                buildUPointPayPassView();
                                break;
                            }
                        } else if (errormsg.equals("um_system_error")) {
                            showDialog(7);
                            this.mUPayInfo.updateConsumeId();
                            break;
                        }
                    }
                } else {
                    if (this.mEtSavePass.isChecked()) {
                        PrefUtil.setUCUserName(getApplicationContext(), this.mEtUsername.getText().toString());
                        PrefUtil.setUCUserPass(getApplicationContext(), this.mEtPassword.getText().toString());
                    } else {
                        PrefUtil.clearUCUserName(getApplicationContext());
                        PrefUtil.clearUCUserPass(getApplicationContext());
                    }
                    showDialog(13);
                    break;
                }
                break;
            case 18:
                UPointInfo info = (UPointInfo) paramObject;
                initUPointPayView(info);
                Utils.setUPointInfo(info);
                dismissDialog(14);
                break;
        }
    }

    @Override
    public Object onPreHandle(int paramInt, HttpResponse paramHttpResponse) {
        if (5 == paramInt || 8 == paramInt) {
            return true;
        }
        String str = Utils.getBodyString(paramInt, paramHttpResponse);
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        switch (paramInt) {
            case 3:
                try {
                    return XMLParser.parsePayOrder(str);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            case 18:
                try {
                    return XMLParser.parseUPointInfo(str);
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            default:
                return null;
        }
    }

    @Override
    public void onError(int paramInt1, int paramInt2) {
        switch (paramInt1) {
            case 3:
                switch (paramInt2) {
                    case -1:
                        this.mTimeoutCounter++;
                        if (this.mTimeoutCounter < 2) {
                            Api.pay(getApplicationContext(), this, this.mPaymentInfo, this.mUPayInfo);
                            break;
                        } else {
                            this.mTimeoutCounter = 0;
                            this.mBtnPay.setEnabled(true);
                            removeDialog(6);
                            showDialog(10);
                            break;
                        }
                    case Constants.ERROR_CODE_INSUFFICIENT_BALANCE:
                        this.mBtnPay.setEnabled(false);
                        removeDialog(6);
                        showDialog(5);
                        buildPaymentView();
                        break;
                    case Constants.ERROR_CODE_ARG_OUT_OF_SCROPE:
                        this.mBtnPay.setEnabled(true);
                        removeDialog(6);
                        showDialog(8);
                        break;
                    case Constants.ERROR_CODE_UNKNOWN:
                        this.mBtnPay.setEnabled(true);
                        removeDialog(6);
                        showDialog(11);
                        break;
                    default:
                        this.mBtnPay.setEnabled(true);
                        removeDialog(6);
                        showDialog(7);
                        break;
                }
            case 18:
                dismissDialog(14);
                showDialog(15);
                buildPaymentView();
                break;
        }
    }

    @Override
    public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong) {
        if (paramInt != 0) {
            IType localIType = ((CustomAdapter) ((HeaderViewListAdapter) paramAdapterView.getAdapter()).getWrappedAdapter()).getItem(paramInt - 1);
            String str = localIType.getId();
            if (TypeFactory.TYPE_PAY_UPOINT.equals(str)) {
                buildUPointPaymentView();
            } else if ("sms".equals(str)) {
                buildSmsPaymentView();
            }
        }
    }

    @Override
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent) {
        switch (paramInt) {
            case 4:
                switch (this.mType) {
                    case 1:
                        buildPaymentView();
                        return true;
                    case 2:
                        buildUPointPaymentView();
                        return true;
                    case 3:
                        buildUPointPayLoginView();
                        return true;
                    case 4:
                        if (this.mSmsInfo.isNeedconfirm() || this.mIsShowInfo) {
                            int i = Utils.getSmsPayment();
                            int j = i / this.mSmsInfo.money;
                            if (this.mLeftSmsToSendCount != -1 && this.mLeftSmsToSendCount != j) {
                                showDialog(DIALOG_PAY_SMS_RETRY_MULTIPLE);
                            } else {
                                buildPaymentView();
                            }
                        } else {
                            buildPaymentView();
                        }
                        return true;
                    case 5:
                        showDialog(23);
                        return true;
                }
        }
        return super.onKeyDown(paramInt, paramKeyEvent);
    }

    @Override
    public void onFinish() {
        fillData();
    }

    private class SmsContent extends ContentObserver {
        private static final String BODY = "body";
        private static final String NUMBER = "address";
        private Cursor mCursor;

        public SmsContent(android.os.Handler arg2) {
            super(arg2);
        }

        @Override
        public void onChange(boolean paramBoolean) {
            super.onChange(paramBoolean);
            Uri localUri = Uri.parse("content://sms/inbox");
            this.mCursor = PaymentsActivity.this.managedQuery(localUri, new String[]{"_id", NUMBER, BODY}, " address like ? or address like ? and read=?", new String[]{String.valueOf(PaymentsActivity.this.mSmsInfo.getSmsnumber()) + "%%", String.valueOf(PaymentsActivity.this.mSmsInfo.getSmsConfirmNumber()) + "%%", "0"}, "date desc");
            if (this.mCursor != null) {
                if (this.mCursor.moveToFirst()) {
                    if (PaymentsActivity.this.mSmsId <= 0 || PaymentsActivity.this.mSmsId <= this.mCursor.getInt(0)) {
                        if (PaymentsActivity.this.mLeftSmsToReceiveCount <= 1) {
                            PaymentsActivity.this.mSmsHander.removeCallbacks(PaymentsActivity.this.mSmsRunnable);
                            PaymentsActivity.this.getContentResolver().unregisterContentObserver(PaymentsActivity.this.mSmsContent);
                            try {
                                PaymentsActivity.this.unregisterReceiver(PaymentsActivity.this.mSmsReceiver);
                            } catch (IllegalArgumentException e) {
                            }
                        }
                        PaymentsActivity.this.mSmsId = this.mCursor.getInt(0);
                        ContentValues localContentValues = new ContentValues();
                        localContentValues.put("read", "1");
                        try {
                            PaymentsActivity.this.getContentResolver().update(localUri, localContentValues, " _id=?", new String[]{new StringBuilder().append(PaymentsActivity.this.mSmsId).toString()});
                        } catch (SQLiteAbortException localSQLiteAbortException) {
                            localSQLiteAbortException.printStackTrace();
                        }
                        String smscontent = this.mCursor.getString(this.mCursor.getColumnIndex(BODY));
                        String smsaddress = this.mCursor.getString(this.mCursor.getColumnIndex(NUMBER));
                        if (4 == PaymentsActivity.this.mType) {
                            if (PaymentsActivity.this.mSmsInfo.isNeedconfirm()) {
                                PaymentsActivity.this.removeDialog(17);
                                String smsconfirmnumber = PaymentsActivity.this.mSmsInfo.parseConfirmSmsConfirmNumber(smscontent);
                                if (PaymentsActivity.this.mSmsInfo.isSuccess(smscontent) && smsconfirmnumber != null) {
                                    PaymentsActivity.this.mSmsHander.removeCallbacks(PaymentsActivity.this.mSmsRunnable);
                                    PaymentsActivity.this.buildSmsPaymentConfirmView(smsaddress, smsconfirmnumber);
                                } else {
                                    PaymentsActivity.this.removeDialog(17);
                                    PaymentsActivity.this.mSmsResultInfo = Constants.TEXT_PAY_SMS_FAILED_INSUFFENT_BALANCE;
                                    PaymentsActivity.this.showDialog(21);
                                }
                            } else {
                                PrefUtil.setPayedAmount(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this.getPayedAmount());
                                if (PaymentsActivity.this.mLeftSmsToReceiveCount <= 1) {
                                    if (PaymentsActivity.this.mLeftSmsToReceiveCount <= 1) {
                                        PaymentsActivity.this.removeDialog(17);
                                    }
                                    PaymentsActivity.this.mSmsResultInfo = "\u652f\u4ed8\u5df2\u5b8c\u6210\uff0c\u795d\u60a8\u73a9\u5f97\u5f00\u5fc3\u3002";
                                    PaymentsActivity.this.showDialog(20);
                                } else {
                                    PaymentsActivity.this.mLeftSmsToReceiveCount--;
                                }
                                if (PaymentsActivity.this.mSmsInfo.getSmstype() == 1) {
                                    Api.postSmsPayment(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this, PaymentsActivity.this.mPaymentInfo.getCpID(), PaymentsActivity.this.mPaymentInfo.getmGameID(), PaymentsActivity.this.mPaymentInfo.getmActionID(), Utils.getSmsPayment(), PaymentsActivity.this.mPaymentInfo.getmActionID(), PaymentsActivity.this.mSmsInfo.getSmschannelid(), PaymentsActivity.this.mSmsInfo.getSmsnumber(), PaymentsActivity.this.mSmsInfo.getContent(), PaymentsActivity.this.mSmsInfo.getSmstype());
                                }
                            }
                        } else {
                            PaymentsActivity.this.removeDialog(17);
                            boolean bool = PaymentsActivity.this.mSmsInfo.parseConfirmResultSms(smscontent);
                            if (!bool) {
                                PaymentsActivity.this.mSmsResultInfo = smscontent;
                                PaymentsActivity.this.showDialog(21);
                            } else {
                                PrefUtil.setPayedAmount(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this.getPayedAmount());
                                if (PaymentsActivity.this.mLeftSmsToReceiveCount <= 1) {
                                    PaymentsActivity.this.mSmsResultInfo = smscontent.replace(Constants.SMS_SUCCESS, Constants_H.MONEY_TXT_18);
                                    PaymentsActivity.this.showDialog(20);
                                } else {
                                    PaymentsActivity.this.mLeftSmsToReceiveCount--;
                                    PaymentsActivity.this.mLeftSmsToSendCount--;
                                    PaymentsActivity.this.mSmsHander.removeCallbacks(PaymentsActivity.this.mSmsRunnable);
                                    PaymentsActivity.this.removeDialog(17);
                                    PaymentsActivity.this.buildSmsPaymentView();
                                }
                                if (PaymentsActivity.this.mSmsInfo.getSmstype() == 1) {
                                    Api.postSmsPayment(PaymentsActivity.this.getApplicationContext(), PaymentsActivity.this, PaymentsActivity.this.mPaymentInfo.getCpID(), PaymentsActivity.this.mPaymentInfo.getmGameID(), PaymentsActivity.this.mPaymentInfo.getmActionID(), Utils.getSmsPayment(), PaymentsActivity.this.mPaymentInfo.getmActionID(), PaymentsActivity.this.mSmsInfo.getSmschannelid(), PaymentsActivity.this.mSmsInfo.getSmsnumber(), PaymentsActivity.this.mSmsInfo.getContent(), PaymentsActivity.this.mSmsInfo.getSmstype());
                                }
                            }
                        }
                    } else {
                        this.mCursor.close();
                        return;
                    }
                }
                this.mCursor.close();
            }
        }
    }
}
