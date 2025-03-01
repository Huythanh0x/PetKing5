.class public Lcom/uc/paymentsdk/payment/PaymentsActivity;
.super Landroid/app/Activity;
.source "PaymentsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/uc/paymentsdk/network/ApiTask$TaskHandler;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;
.implements Lcom/uc/paymentsdk/network/chain/Handler$OnFinishListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/uc/paymentsdk/payment/PaymentsActivity$SmsContent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Activity;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/uc/paymentsdk/network/ApiTask$TaskHandler;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;",
        "Lcom/uc/paymentsdk/network/chain/Handler$OnFinishListener;"
    }
.end annotation


# static fields
.field private static final CONTENT_SMS_INBOX:Ljava/lang/String; = "content://sms/"

.field private static final DIALOG_500:I = 0xb

.field private static final DIALOG_ACCOUNT_WRONG:I = 0x22

.field private static final DIALOG_CONNECTING:I = 0xe

.field private static final DIALOG_CONNECTING_FAILED:I = 0xf

.field private static final DIALOG_INSUFFICIENT_BALANCE:I = 0x5

.field private static final DIALOG_PASSWORD_IS_EMPTY:I = 0x1d

.field private static final DIALOG_PASSWORD_OR_USERNAME_IS_EMPTY:I = 0x1c

.field private static final DIALOG_PASSWORD_WRONG:I = 0x21

.field private static final DIALOG_PAY_DES:I = 0x3

.field private static final DIALOG_PAY_ERROR_INPUT:I = 0x8

.field private static final DIALOG_PAY_FAILED:I = 0x7

.field private static final DIALOG_PAY_INVALID_ACCOUNT:I = 0x9

.field private static final DIALOG_PAY_NEED_TO_CONFIRM_PAY_RESULT:I = 0xa

.field private static final DIALOG_PAY_SMS_BACK_CONFIRM:I = 0x18

.field private static final DIALOG_PAY_SMS_DELETE_BACK_CONFIRM:I = 0x19

.field private static final DIALOG_PAY_SMS_DELETE_CONFIRM:I = 0x17

.field private static final DIALOG_PAY_SMS_ERROR:I = 0x10

.field private static final DIALOG_PAY_SMS_FAILED:I = 0x15

.field private static final DIALOG_PAY_SMS_RETRY:I = 0x1a

.field private static final DIALOG_PAY_SMS_RETRY_MULTIPLE:I = 0x1b

.field private static final DIALOG_PAY_SMS_SENDING:I = 0x11

.field private static final DIALOG_PAY_SMS_SEND_FAILED:I = 0x12

.field private static final DIALOG_PAY_SMS_SUCCESS:I = 0x14

.field private static final DIALOG_PAY_SMS_SYNC:I = 0x13

.field private static final DIALOG_PAY_SUCCESS:I = 0xd

.field private static final DIALOG_PROGRESS_BAR:I = 0x6

.field private static final DIALOG_SMS_FAIL:I = 0x26

.field private static final DIALOG_START_ERROR_APPKEY_INVALID:I = 0x1

.field private static final DIALOG_START_ERROR_CPID_INVALID:I = 0x16

.field private static final DIALOG_START_ERROR_PAYMENT_INVALID:I = 0x0

.field private static final DIALOG_TIP:I = 0x2

.field private static final DIALOG_UPOINT_PAYING:I = 0x23

.field private static final DIALOG_UPOINT_PAYPASS_WRONG:I = 0x25

.field private static final DIALOG_UPOINT_TIMESTAMP_WRONG:I = 0x24

.field private static final DIALOG_USERNAME_IS_EMPTY:I = 0x1e

.field private static final DIALOG_USERNAME_WRONG:I = 0x1f

.field private static final DIALOG_USERNAME_WRONG2:I = 0x20

.field public static final EXTRA_KEY_NUMBER:Ljava/lang/String; = "number"

.field public static final EXTRA_KEY_ORDER_ID:Ljava/lang/String; = "orderId"

.field public static final EXTRA_KEY_PAYMENTINFO:Ljava/lang/String; = "com.mappn.sdk.paymentinfo"

.field public static final ID_BACK:I = 0x9

.field public static final ID_CANCEL:I = 0xa

.field private static final ID_PAYMENT_TIP:I = 0x0

.field private static final ID_PAY_SMS_CANCEL:I = 0x4

.field private static final ID_PAY_SMS_CONFIRM:I = 0x5

.field private static final ID_PAY_SMS_CONFIRM_CANCEL:I = 0x6

.field private static final ID_PAY_SMS_OK:I = 0x3

.field private static final ID_PAY_UPOINT:I = 0x7

.field private static final ID_PAY_UPOINT_PAYPASS:I = 0x8

.field private static final PAY_SMS_TIMEOUT:J = 0xea60L

.field private static final RETRY_MAX:I = 0x2

.field private static final TERM:Ljava/lang/String; = ",,,,"

.field private static final TYPE_PAYMENT_LIST:I = 0x0

.field private static final TYPE_PAYMENT_SMS:I = 0x4

.field private static final TYPE_PAYMENT_SMS_CONFIRM:I = 0x5

.field private static final TYPE_PAYMENT_UPOINT_DISCOUNT:I = 0x1

.field private static final TYPE_PAYMENT_UPOINT_LOGIN:I = 0x2

.field private static final TYPE_PAYMENT_UPOINT_PAYPASS:I = 0x3


# instance fields
.field private mBalance:I

.field private mBtnPay:Landroid/widget/Button;

.field private mConfirmSmsInfoString:Ljava/lang/String;

.field private mEtPassword:Landroid/widget/EditText;

.field private mEtPayPass:Landroid/widget/EditText;

.field private mEtSavePass:Landroid/widget/CheckBox;

.field private mEtUsername:Landroid/widget/EditText;

.field private mIsShowInfo:Z

.field private mIsSynced:Z

.field private mIsValid:Z

.field private mLeftSmsToReceiveCount:I

.field private mLeftSmsToSendCount:I

.field private mListView:Landroid/widget/ListView;

.field private mNumber:Ljava/lang/String;

.field private mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

.field private mSmsContent:Landroid/database/ContentObserver;

.field private mSmsHander:Landroid/os/Handler;

.field private mSmsId:I

.field private mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

.field private final mSmsReceiver:Landroid/content/BroadcastReceiver;

.field private mSmsResultInfo:Ljava/lang/String;

.field private final mSmsRunnable:Ljava/lang/Runnable;

.field private mTimeoutCounter:I

.field private mTvDiscountTextView:Landroid/widget/TextView;

.field private mTvProduct:Landroid/widget/TextView;

.field private mTvVipDiscountInfo:Landroid/widget/TextView;

.field private mTvVipDiscountTextView:Landroid/widget/TextView;

.field private mTvVipDiscountTimeTextView:Landroid/widget/TextView;

.field private mType:I

.field private mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 154
    new-instance v0, Lcom/uc/paymentsdk/payment/PaymentsActivity$1;

    invoke-direct {v0, p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity$1;-><init>(Lcom/uc/paymentsdk/payment/PaymentsActivity;)V

    iput-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    .line 282
    new-instance v0, Lcom/uc/paymentsdk/payment/PaymentsActivity$2;

    invoke-direct {v0, p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity$2;-><init>(Lcom/uc/paymentsdk/payment/PaymentsActivity;)V

    iput-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    .line 63
    return-void
.end method

.method static synthetic access$0(Lcom/uc/paymentsdk/payment/PaymentsActivity;)I
    .locals 1

    .prologue
    .line 124
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    return v0
.end method

.method static synthetic access$1(Lcom/uc/paymentsdk/payment/PaymentsActivity;)Lcom/uc/paymentsdk/payment/sms/SmsInfo;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    return-object v0
.end method

.method static synthetic access$10(Lcom/uc/paymentsdk/payment/PaymentsActivity;)Landroid/database/ContentObserver;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    return-object v0
.end method

.method static synthetic access$11(Lcom/uc/paymentsdk/payment/PaymentsActivity;)I
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsId:I

    return v0
.end method

.method static synthetic access$12(Lcom/uc/paymentsdk/payment/PaymentsActivity;)I
    .locals 1

    .prologue
    .line 149
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToReceiveCount:I

    return v0
.end method

.method static synthetic access$13(Lcom/uc/paymentsdk/payment/PaymentsActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$14(Lcom/uc/paymentsdk/payment/PaymentsActivity;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$15(Lcom/uc/paymentsdk/payment/PaymentsActivity;I)V
    .locals 0

    .prologue
    .line 142
    iput p1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsId:I

    return-void
.end method

.method static synthetic access$16(Lcom/uc/paymentsdk/payment/PaymentsActivity;I)V
    .locals 0

    .prologue
    .line 149
    iput p1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToReceiveCount:I

    return-void
.end method

.method static synthetic access$17(Lcom/uc/paymentsdk/payment/PaymentsActivity;Z)V
    .locals 0

    .prologue
    .line 151
    iput-boolean p1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsSynced:Z

    return-void
.end method

.method static synthetic access$18(Lcom/uc/paymentsdk/payment/PaymentsActivity;Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/Button;Landroid/widget/Button;Landroid/widget/RelativeLayout;)V
    .locals 0

    .prologue
    .line 1017
    invoke-direct/range {p0 .. p6}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->initSmsPayView(Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/Button;Landroid/widget/Button;Landroid/widget/RelativeLayout;)V

    return-void
.end method

.method static synthetic access$2(Lcom/uc/paymentsdk/payment/PaymentsActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1149
    invoke-direct {p0, p1, p2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildSmsPaymentConfirmView(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3(Lcom/uc/paymentsdk/payment/PaymentsActivity;)I
    .locals 1

    .prologue
    .line 148
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    return v0
.end method

.method static synthetic access$4(Lcom/uc/paymentsdk/payment/PaymentsActivity;I)V
    .locals 0

    .prologue
    .line 148
    iput p1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    return-void
.end method

.method static synthetic access$5(Lcom/uc/paymentsdk/payment/PaymentsActivity;)I
    .locals 1

    .prologue
    .line 542
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getPayedAmount()I

    move-result v0

    return v0
.end method

.method static synthetic access$6(Lcom/uc/paymentsdk/payment/PaymentsActivity;)V
    .locals 0

    .prologue
    .line 923
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildSmsPaymentView()V

    return-void
.end method

.method static synthetic access$7(Lcom/uc/paymentsdk/payment/PaymentsActivity;)Landroid/content/BroadcastReceiver;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic access$8(Lcom/uc/paymentsdk/payment/PaymentsActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 137
    iput-object p1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$9(Lcom/uc/paymentsdk/payment/PaymentsActivity;)Lcom/uc/paymentsdk/payment/PaymentInfo;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    return-object v0
.end method

.method private buildPaymentView()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    const/16 v13, 0x14

    const/4 v12, 0x1

    const/4 v11, -0x1

    const/4 v10, 0x0

    .line 550
    iput v10, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    .line 551
    iput v10, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTimeoutCounter:I

    .line 552
    iput v11, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToReceiveCount:I

    iput v11, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    .line 553
    iput-boolean v10, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsSynced:Z

    .line 554
    iput-boolean v10, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    .line 555
    iput-object v14, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    .line 556
    iput-object v14, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    .line 557
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 558
    const-string v8, "\u8d2d\u4e70\u5185\u5bb9"

    .line 557
    invoke-static {v7, p0, v8, v10}, Lcom/uc/paymentsdk/util/Utils;->initSubTitle(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/lang/String;Z)Landroid/widget/RelativeLayout;

    move-result-object v6

    .line 559
    .local v6, "paytitle":Landroid/widget/RelativeLayout;
    new-instance v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v4, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 560
    .local v4, "payContentTextView":Landroid/widget/TextView;
    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 561
    const-string v7, "#FF858D8D"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 562
    const/16 v7, 0xa

    const/16 v8, 0xa

    const/16 v9, 0xa

    invoke-virtual {v4, v7, v8, v10, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 563
    const-string v7, "\u5c0a\u656c\u7684\u7528\u6237\uff0c\u60a8\u9700\u8981\u4e3a\u4ee5\u4e0b\u5185\u5bb9\u652f\u4ed8\u8d39\u7528\uff0c\u8bf7\u9605\u8bfb\u4ee5\u4e0b\u4fe1\u606f\uff0c\u786e\u8ba4\u6240\u8d2d\u5185\u5bb9\u65e0\u8bef\u3002"

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 564
    new-instance v3, Landroid/widget/TextView;

    .line 565
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 564
    invoke-direct {v3, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 566
    .local v3, "payContentDetailTextView":Landroid/widget/TextView;
    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 567
    invoke-virtual {v3, v13, v10, v13, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 568
    const-string v7, "\u6240\u8d2d\u5185\u5bb9 : %s"

    .line 569
    new-array v8, v12, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaydesc()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    .line 568
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 570
    const v7, -0xbbbbbc

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 571
    new-instance v7, Ljava/text/DecimalFormat;

    const-string v8, "##0.00"

    invoke-direct {v7, v8}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 572
    invoke-virtual {v8}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getMoney()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x41200000    # 10.0f

    div-float/2addr v8, v9

    float-to-double v8, v8

    .line 571
    invoke-virtual {v7, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    .line 573
    .local v2, "moneyStr":Ljava/lang/String;
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 574
    .local v5, "payCountTextView":Landroid/widget/TextView;
    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 575
    invoke-virtual {v5, v13, v10, v10, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 576
    const-string v7, "\u652f\u4ed8\u91d1\u989d: %s\u5143"

    .line 577
    new-array v8, v12, [Ljava/lang/Object;

    aput-object v2, v8, v10

    .line 576
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 578
    const v7, -0xbbbbbc

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 579
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v0, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 580
    .local v0, "linearLayout":Landroid/widget/LinearLayout;
    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 581
    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 582
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 584
    const/4 v7, -0x2

    .line 582
    invoke-direct {v1, v11, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 585
    .local v1, "localLayoutParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v0, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 586
    invoke-virtual {v0, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 587
    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 588
    invoke-virtual {v0, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 589
    new-instance v7, Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    .line 590
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v7, v11}, Landroid/widget/ListView;->setBackgroundColor(I)V

    .line 591
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v7, v11}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 592
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v7, v0, v14, v12}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 593
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v7, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 594
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    invoke-static {p0}, Lcom/uc/paymentsdk/util/Utils;->generateFooterView(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v8

    invoke-virtual {v7, v8, v14, v10}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 596
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setContentView(Landroid/view/View;)V

    .line 597
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->fillData()V

    .line 598
    new-instance v7, Lcom/uc/paymentsdk/network/chain/HandlerProxy;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8, p0}, Lcom/uc/paymentsdk/network/chain/HandlerProxy;-><init>(Landroid/content/Context;Lcom/uc/paymentsdk/network/chain/Handler$OnFinishListener;)V

    invoke-virtual {v7}, Lcom/uc/paymentsdk/network/chain/HandlerProxy;->handleRequest()V

    .line 599
    return-void
.end method

.method private buildSmsPaymentConfirmView(Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p1, "smsaddress"    # Ljava/lang/String;
    .param p2, "smsconfirmnumber"    # Ljava/lang/String;

    .prologue
    .line 1151
    const/4 v9, 0x5

    iput v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    .line 1153
    :try_start_0
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/uc/paymentsdk/util/Utils;->CheckSimCardSupprotInfo(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1159
    new-instance v5, Landroid/widget/RelativeLayout;

    .line 1160
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 1159
    invoke-direct {v5, v9}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 1161
    .local v5, "localRelativeLayout":Landroid/widget/RelativeLayout;
    const/4 v9, -0x1

    invoke-virtual {v5, v9}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 1162
    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x1

    invoke-direct {v9, v10, v11}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v9}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1163
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 1164
    const-string v10, "\u8d2d\u4e70\u5185\u5bb9"

    const/4 v11, 0x1

    .line 1163
    invoke-static {v9, p0, v10, v11}, Lcom/uc/paymentsdk/util/Utils;->initSubTitle(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/lang/String;Z)Landroid/widget/RelativeLayout;

    move-result-object v8

    .line 1165
    .local v8, "title":Landroid/widget/RelativeLayout;
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 1166
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x2

    invoke-direct {v9, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1167
    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1168
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1169
    .local v7, "localTextView2":Landroid/widget/TextView;
    const/4 v9, 0x2

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setId(I)V

    .line 1170
    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1171
    const v9, -0xcdcdce

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1172
    const/16 v9, 0xa

    const/16 v10, 0xa

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1173
    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 1174
    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setClickable(Z)V

    .line 1175
    const/16 v9, -0x6000

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 1176
    const-string v9, "\u518d\u6b21\u70b9\u51fb\u4e0b\u4e00\u6b65\u5373\u540c\u610f\u5411\n%s\u53d1\u9001\u77ed\u4fe1\u4ee5\u5b8c\u6210\u672c\u6b21\u77ed\u4fe1\u53d1\u9001\u8fc7\u7a0b\u3002"

    .line 1177
    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    const/4 v11, 0x1

    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v12}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    .line 1178
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsPayment()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 1176
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1179
    const/4 v9, 0x4

    invoke-static {v7, v9}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    .line 1180
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1181
    const/4 v9, -0x1

    const/4 v10, -0x2

    .line 1180
    invoke-direct {v2, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1182
    .local v2, "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v9, 0x3

    const/4 v10, 0x1

    invoke-virtual {v2, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1183
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1184
    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1185
    new-instance v0, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v0, v9}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 1186
    .local v0, "localButton1":Landroid/widget/Button;
    const-string v9, "\u4e0b\u4e00\u6b65"

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1187
    const/4 v9, 0x5

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setId(I)V

    .line 1188
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, ",,,,"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mConfirmSmsInfoString:Ljava/lang/String;

    .line 1189
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mConfirmSmsInfoString:Ljava/lang/String;

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 1190
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1191
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1192
    const/16 v9, 0x96

    const/4 v10, -0x2

    .line 1191
    invoke-direct {v3, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1193
    .local v3, "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v9, 0xc

    const/4 v10, -0x1

    invoke-virtual {v3, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1194
    const/16 v9, 0xa

    const/16 v10, 0x14

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-virtual {v3, v9, v10, v11, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 1195
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1196
    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1197
    new-instance v1, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v1, v9}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 1198
    .local v1, "localButton2":Landroid/widget/Button;
    const-string v9, "\u53d6\u6d88"

    invoke-virtual {v1, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1199
    const/4 v9, 0x6

    invoke-virtual {v1, v9}, Landroid/widget/Button;->setId(I)V

    .line 1200
    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1201
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1202
    const/16 v9, 0x96

    const/4 v10, -0x2

    .line 1201
    invoke-direct {v4, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1203
    .local v4, "localLayoutParams3":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v9, 0xb

    const/4 v10, -0x1

    invoke-virtual {v4, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1204
    const/16 v9, 0xc

    const/4 v10, -0x1

    invoke-virtual {v4, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1205
    const/16 v9, 0xa

    const/16 v10, 0x14

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-virtual {v4, v9, v10, v11, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 1206
    invoke-virtual {v1, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1207
    invoke-virtual {v5, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1208
    invoke-virtual {p0, v5}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setContentView(Landroid/view/View;)V

    .line 1209
    .end local v0    # "localButton1":Landroid/widget/Button;
    .end local v1    # "localButton2":Landroid/widget/Button;
    .end local v2    # "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v4    # "localLayoutParams3":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v5    # "localRelativeLayout":Landroid/widget/RelativeLayout;
    .end local v7    # "localTextView2":Landroid/widget/TextView;
    .end local v8    # "title":Landroid/widget/RelativeLayout;
    :goto_0
    return-void

    .line 1154
    :catch_0
    move-exception v9

    move-object v6, v9

    .line 1155
    .local v6, "localSimCardNotSupportException":Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;
    invoke-virtual {v6}, Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;->getMessage()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 1156
    const/16 v9, 0x10

    invoke-virtual {p0, v9}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0
.end method

.method private buildSmsPaymentView()V
    .locals 12

    .prologue
    .line 924
    const/4 v0, 0x4

    iput v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    .line 925
    const/4 v0, 0x0

    iput v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsId:I

    .line 926
    new-instance v7, Landroid/widget/RelativeLayout;

    .line 927
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 926
    invoke-direct {v7, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 928
    .local v7, "tableLayout":Landroid/widget/RelativeLayout;
    const/4 v0, -0x1

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 929
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 930
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 931
    const-string v1, "\u77ed\u4fe1\u652f\u4ed8"

    const/4 v2, 0x0

    .line 930
    invoke-static {v0, p0, v1, v2}, Lcom/uc/paymentsdk/util/Utils;->initSubTitle(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/lang/String;Z)Landroid/widget/RelativeLayout;

    move-result-object v11

    .line 932
    .local v11, "title":Landroid/widget/RelativeLayout;
    const/4 v0, 0x1

    invoke-virtual {v11, v0}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 933
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 934
    invoke-virtual {v7, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 935
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 936
    .local v2, "waitTextView":Landroid/widget/TextView;
    const/4 v0, 0x2

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setId(I)V

    .line 937
    const/high16 v0, 0x41900000    # 18.0f

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 938
    const v0, -0xbbbbbc

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 939
    const/16 v0, 0xa

    const/16 v1, 0xa

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v1, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 940
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 941
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setClickable(Z)V

    .line 942
    const/16 v0, -0x6000

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 943
    const-string v0, "\u5c0a\u656c\u7684\u7528\u6237\uff0c\u6b63\u5728\u83b7\u53d6\u4fe1\u606f\uff0c\u8bf7\u7a0d\u540e......"

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 944
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    .line 945
    const/4 v0, -0x1

    const/4 v1, -0x2

    .line 944
    invoke-direct {v8, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 946
    .local v8, "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-virtual {v8, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 947
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 948
    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 949
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 950
    .local v3, "beforeSendText":Landroid/widget/TextView;
    const/4 v0, 0x3

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setId(I)V

    .line 951
    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 952
    const v0, -0x777778

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 953
    const/16 v0, 0xa

    const/16 v1, 0x1e

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v0, v1, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 954
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 955
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setClickable(Z)V

    .line 956
    const/16 v0, -0x6000

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 957
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    .line 958
    const/4 v0, -0x1

    const/4 v1, -0x2

    .line 957
    invoke-direct {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 959
    .local v9, "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v0, 0x3

    const/4 v1, 0x2

    invoke-virtual {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 960
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 961
    invoke-virtual {v7, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 962
    new-instance v6, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v6, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 963
    .local v6, "submitBtn":Landroid/widget/Button;
    const-string v0, "\u70b9\u64ad"

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 964
    const/4 v0, 0x3

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setId(I)V

    .line 965
    invoke-virtual {v6, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 966
    new-instance v5, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v5, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 967
    .local v5, "cancelButton":Landroid/widget/Button;
    const-string v0, "\u53d6\u6d88"

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 968
    const/4 v0, 0x4

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setId(I)V

    .line 969
    invoke-virtual {v5, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 971
    :try_start_0
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/uc/paymentsdk/util/Utils;->CheckSimCardSupprotInfo(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException; {:try_start_0 .. :try_end_0} :catch_0

    .line 977
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsPayment()I

    move-result v4

    .line 978
    .local v4, "smsPayCount":I
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/uc/paymentsdk/util/PrefUtil;->getPayedAmount(Landroid/content/Context;)I

    move-result v0

    if-gt v4, v0, :cond_0

    .line 979
    const-string v0, "\u60a8\u5df2\u652f\u4ed8\u5b8c\u6210\uff0c\u5c06\u8fd4\u56de\u60a8\u7684\u6e38\u620f\u4e2d\u3002"

    iput-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 980
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1015
    .end local v4    # "smsPayCount":I
    .end local v8    # "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v9    # "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_0
    return-void

    .line 972
    .restart local v8    # "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v9    # "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_0
    move-exception v0

    move-object v10, v0

    .line 973
    .local v10, "localSimCardNotSupportException":Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;
    invoke-virtual {v10}, Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;->getMessage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 974
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 983
    .end local v10    # "localSimCardNotSupportException":Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;
    .restart local v4    # "smsPayCount":I
    :cond_0
    iget-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsSynced:Z

    if-nez v0, :cond_1

    .line 984
    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 985
    new-instance v8, Lcom/uc/paymentsdk/network/chain/SyncSmsInfoHandler;

    .end local v8    # "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 986
    .end local v9    # "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v0, Lcom/uc/paymentsdk/payment/PaymentsActivity$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity$3;-><init>(Lcom/uc/paymentsdk/payment/PaymentsActivity;Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/Button;Landroid/widget/Button;Landroid/widget/RelativeLayout;)V

    .line 985
    invoke-direct {v8, v9, v0}, Lcom/uc/paymentsdk/network/chain/SyncSmsInfoHandler;-><init>(Landroid/content/Context;Lcom/uc/paymentsdk/network/chain/Handler$OnFinishListener;)V

    .line 1010
    invoke-virtual {v8}, Lcom/uc/paymentsdk/network/chain/SyncSmsInfoHandler;->handleRequest()V

    goto :goto_0

    .restart local v8    # "localLayoutParams1":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v9    # "localLayoutParams2":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1
    move-object v1, p0

    .line 1012
    invoke-direct/range {v1 .. v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->initSmsPayView(Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/Button;Landroid/widget/Button;Landroid/widget/RelativeLayout;)V

    goto :goto_0
.end method

.method private buildUPointPayLoginView()V
    .locals 28

    .prologue
    .line 717
    const/16 v24, 0x2

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    .line 718
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    .line 719
    const-string v25, "\u8bf7\u60a8\u8f93\u5165UC\u5e10\u53f7"

    const/16 v26, 0x1

    .line 718
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    move/from16 v3, v26

    invoke-static {v0, v1, v2, v3}, Lcom/uc/paymentsdk/util/Utils;->initSubTitle(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/lang/String;Z)Landroid/widget/RelativeLayout;

    move-result-object v20

    .line 720
    .local v20, "title":Landroid/widget/RelativeLayout;
    const/16 v24, 0xa

    move-object/from16 v0, v20

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 721
    new-instance v21, Landroid/widget/RelativeLayout$LayoutParams;

    .line 722
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 721
    move-object/from16 v0, v21

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 723
    .local v21, "titleParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0xa

    const/16 v25, -0x1

    move-object/from16 v0, v21

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 724
    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 725
    new-instance v16, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 726
    .local v16, "noticeTextView":Landroid/widget/TextView;
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    .line 727
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 726
    move-object v0, v15

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 728
    .local v15, "noticeParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0xa

    move-object v0, v15

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 729
    const/16 v24, 0xa

    const/16 v25, 0x5

    const/16 v26, 0xa

    const/16 v27, 0xa

    move-object v0, v15

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 730
    move-object/from16 v0, v16

    move-object v1, v15

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 731
    const/16 v24, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 732
    const/16 v24, 0xa

    move-object/from16 v0, v16

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 733
    const v24, -0xcdcdce

    move-object/from16 v0, v16

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 735
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->isHdpi()Z

    move-result v24

    if-eqz v24, :cond_1

    const-string v24, "lock_hdpi.png"

    :goto_0
    invoke-static/range {v24 .. v24}, Lcom/uc/paymentsdk/util/Utils;->getDrawableFromFile(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v24

    .line 736
    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    .line 734
    move-object/from16 v0, v16

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 737
    const-string v24, "\u60a8\u597d\uff0c\u8d2d\u4e70\u6b64\u5185\u5bb9\uff0c\u8bf7\u5148\u767b\u5f55UC\u8d26\u53f7\u3002\u60a8\u53ef\u4ee5\u8f93\u5165UC\u5e10\u53f7\u6216\u8005\u624b\u673a\u53f7\u7801\u8fdb\u884c\u767b\u5f55"

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 738
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/uc/paymentsdk/util/Utils;->generateBorderView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v9

    .line 739
    .local v9, "lineTextView":Landroid/widget/TextView;
    const/16 v24, 0xb

    move-object v0, v9

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 740
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    .line 741
    const/16 v24, -0x1

    const/16 v25, 0x1

    .line 740
    move-object v0, v8

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 742
    .local v8, "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0x1

    move-object v0, v8

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 743
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 744
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    .line 745
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 744
    move-object v0, v6

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 746
    .local v6, "accountParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0xa

    const/16 v25, 0xa

    const/16 v26, 0xa

    const/16 v27, 0x5

    move-object v0, v6

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 747
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    move-object v0, v5

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 748
    .local v5, "accountLable":Landroid/widget/TextView;
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 749
    const/16 v24, 0x2

    move-object v0, v5

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 750
    const-string v24, "UC\u8d26\u53f7:"

    move-object v0, v5

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 751
    const v24, -0xcdcdce

    move-object v0, v5

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 752
    new-instance v22, Landroid/widget/RelativeLayout$LayoutParams;

    .line 753
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 752
    move-object/from16 v0, v22

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 754
    .local v22, "usernameParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0x2

    move-object/from16 v0, v22

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 755
    const/16 v24, 0xa

    const/16 v25, 0x5

    const/16 v26, 0xa

    const/16 v27, 0x5

    move-object/from16 v0, v22

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 756
    new-instance v24, Landroid/widget/EditText;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    .line 757
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 758
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/widget/EditText;->setSingleLine()V

    .line 759
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    move-object/from16 v24, v0

    const/16 v25, 0x3

    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setId(I)V

    .line 760
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    move-object/from16 v24, v0

    const-string v25, "\u7528\u6237\u540d"

    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 761
    new-instance v24, Landroid/widget/EditText;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    .line 762
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    const/16 v25, 0x4

    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setId(I)V

    .line 763
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    const-string v25, "\u5bc6\u7801"

    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 764
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/widget/EditText;->setSingleLine()V

    .line 765
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    .line 766
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v25

    .line 765
    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 767
    new-instance v23, Landroid/widget/RelativeLayout$LayoutParams;

    .line 768
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 767
    invoke-direct/range {v23 .. v25}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 769
    .local v23, "userpassParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0x3

    invoke-virtual/range {v23 .. v25}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 770
    const/16 v24, 0xa

    const/16 v25, 0x5

    const/16 v26, 0xa

    const/16 v27, 0x5

    invoke-virtual/range {v23 .. v27}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 771
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 772
    new-instance v24, Landroid/widget/CheckBox;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    .line 773
    new-instance v17, Landroid/widget/RelativeLayout$LayoutParams;

    .line 774
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 773
    move-object/from16 v0, v17

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 775
    .local v17, "savepassParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0x4

    move-object/from16 v0, v17

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 776
    const/16 v24, 0xa

    const/16 v25, 0x5

    const/16 v26, 0xa

    const/16 v27, 0x5

    move-object/from16 v0, v17

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 777
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    const/16 v25, 0x5

    invoke-virtual/range {v24 .. v25}, Landroid/widget/CheckBox;->setId(I)V

    .line 778
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    const v25, -0xbbbbbc

    invoke-virtual/range {v24 .. v25}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    const-string v25, "\u4fdd\u5b58\u5bc6\u7801"

    invoke-virtual/range {v24 .. v25}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 781
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/uc/paymentsdk/util/PrefUtil;->getUCUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v24

    if-eqz v24, :cond_2

    .line 782
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    move-object/from16 v24, v0

    .line 783
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/uc/paymentsdk/util/PrefUtil;->getUCUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v25

    .line 782
    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 784
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    const/16 v25, 0x1

    invoke-virtual/range {v24 .. v25}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 788
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/uc/paymentsdk/util/PrefUtil;->getUCUserPass(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v24

    if-eqz v24, :cond_0

    .line 789
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    .line 790
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/uc/paymentsdk/util/PrefUtil;->getUCUserPass(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v25

    .line 789
    invoke-virtual/range {v24 .. v25}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 792
    :cond_0
    new-instance v18, Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 793
    .local v18, "submitBtn":Landroid/widget/Button;
    const/16 v24, 0x7

    move-object/from16 v0, v18

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setId(I)V

    .line 794
    const-string v24, "\u786e\u5b9a\u8d2d\u4e70"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 795
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 796
    new-instance v19, Landroid/widget/RelativeLayout$LayoutParams;

    .line 797
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 796
    move-object/from16 v0, v19

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 798
    .local v19, "submitLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0xa

    move/from16 v0, v24

    move-object/from16 v1, v19

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 799
    const/16 v24, 0x3

    const/16 v25, 0x5

    move-object/from16 v0, v19

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 800
    const/16 v24, 0xe

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 801
    invoke-virtual/range {v18 .. v19}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 802
    new-instance v7, Landroid/widget/RelativeLayout;

    .line 803
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    .line 802
    move-object v0, v7

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 804
    .local v7, "inputareaLayout":Landroid/widget/RelativeLayout;
    const/16 v24, 0x7

    move-object v0, v7

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 805
    const v24, -0xf0506

    move-object v0, v7

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 806
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    .line 807
    const/16 v24, -0x1

    const/16 v25, -0x2

    .line 806
    move-object v0, v11

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 808
    .local v11, "localLayoutParams8":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0xb

    move-object v0, v11

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 809
    invoke-virtual {v7, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 810
    invoke-virtual {v7, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 811
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    move-object/from16 v24, v0

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 812
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    move-object/from16 v24, v0

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 813
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 814
    move-object v0, v7

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 815
    new-instance v14, Landroid/widget/RelativeLayout;

    .line 816
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    .line 815
    move-object v0, v14

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 817
    .local v14, "maintableLayout":Landroid/widget/RelativeLayout;
    const/16 v24, -0x1

    move-object v0, v14

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 819
    new-instance v24, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v25, -0x1

    const/16 v26, -0x1

    invoke-direct/range {v24 .. v26}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    move-object v0, v14

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 820
    move-object v0, v14

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 821
    move-object v0, v14

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 822
    invoke-virtual {v14, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 823
    invoke-virtual {v14, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 824
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/uc/paymentsdk/util/Utils;->generateBorderView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v10

    .line 825
    .local v10, "lineTextView1":Landroid/widget/TextView;
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    .line 826
    const/16 v24, -0x1

    const/16 v25, 0x1

    .line 825
    move-object v0, v12

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 827
    .local v12, "localLayoutParams9":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0x3

    const/16 v25, 0x7

    move-object v0, v12

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 828
    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 829
    invoke-virtual {v14, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 830
    new-instance v13, Landroid/widget/ScrollView;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v24

    move-object v0, v13

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 831
    .local v13, "localScrollView":Landroid/widget/ScrollView;
    const/16 v24, -0x1

    move-object v0, v13

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 832
    invoke-virtual {v13, v14}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 833
    move-object/from16 v0, p0

    move-object v1, v13

    invoke-virtual {v0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setContentView(Landroid/view/View;)V

    .line 834
    return-void

    .line 736
    .end local v5    # "accountLable":Landroid/widget/TextView;
    .end local v6    # "accountParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "inputareaLayout":Landroid/widget/RelativeLayout;
    .end local v8    # "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v9    # "lineTextView":Landroid/widget/TextView;
    .end local v10    # "lineTextView1":Landroid/widget/TextView;
    .end local v11    # "localLayoutParams8":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v12    # "localLayoutParams9":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v13    # "localScrollView":Landroid/widget/ScrollView;
    .end local v14    # "maintableLayout":Landroid/widget/RelativeLayout;
    .end local v17    # "savepassParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v18    # "submitBtn":Landroid/widget/Button;
    .end local v19    # "submitLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v22    # "usernameParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v23    # "userpassParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1
    const-string v24, "lock.png"

    goto/16 :goto_0

    .line 786
    .restart local v5    # "accountLable":Landroid/widget/TextView;
    .restart local v6    # "accountParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v8    # "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v9    # "lineTextView":Landroid/widget/TextView;
    .restart local v17    # "savepassParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v22    # "usernameParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v23    # "userpassParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto/16 :goto_1
.end method

.method private buildUPointPayPassView()V
    .locals 26

    .prologue
    .line 837
    const/16 v22, 0x3

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    .line 838
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    .line 839
    const-string v23, "\u8bf7\u60a8\u8f93\u5165U\u70b9\u652f\u4ed8\u5bc6\u7801"

    const/16 v24, 0x1

    .line 838
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v1, v2, v3}, Lcom/uc/paymentsdk/util/Utils;->initSubTitle(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/lang/String;Z)Landroid/widget/RelativeLayout;

    move-result-object v19

    .line 840
    .local v19, "title":Landroid/widget/RelativeLayout;
    const/16 v22, 0xa

    move-object/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 841
    new-instance v20, Landroid/widget/RelativeLayout$LayoutParams;

    .line 842
    const/16 v22, -0x1

    const/16 v23, -0x2

    .line 841
    move-object/from16 v0, v20

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 843
    .local v20, "titleParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0xa

    const/16 v23, -0x1

    move-object/from16 v0, v20

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 844
    invoke-virtual/range {v19 .. v20}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 845
    new-instance v16, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 846
    .local v16, "noticeTextView":Landroid/widget/TextView;
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    .line 847
    const/16 v22, -0x1

    const/16 v23, -0x2

    .line 846
    move-object v0, v15

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 848
    .local v15, "noticeParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0x3

    const/16 v23, 0xa

    move-object v0, v15

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 849
    const/16 v22, 0xa

    const/16 v23, 0x5

    const/16 v24, 0xa

    const/16 v25, 0xa

    move-object v0, v15

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 850
    move-object/from16 v0, v16

    move-object v1, v15

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 851
    const/16 v22, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 852
    const/16 v22, 0xa

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 853
    const v22, -0xcdcdce

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 855
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->isHdpi()Z

    move-result v22

    if-eqz v22, :cond_0

    const-string v22, "lock_hdpi.png"

    :goto_0
    invoke-static/range {v22 .. v22}, Lcom/uc/paymentsdk/util/Utils;->getDrawableFromFile(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    .line 856
    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    .line 854
    move-object/from16 v0, v16

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    move-object/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 857
    const-string v22, "\u60a8\u597d\uff0c\u60a8\u7684U\u70b9\u8bbe\u7f6e\u6709\u652f\u4ed8\u5bc6\u7801\uff0c\u8bf7\u6536\u5165\u540e\u70b9\u51fb\u786e\u8ba4\u8fdb\u884c\u652f\u4ed8"

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 858
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lcom/uc/paymentsdk/util/Utils;->generateBorderView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v9

    .line 859
    .local v9, "lineTextView":Landroid/widget/TextView;
    const/16 v22, 0xb

    move-object v0, v9

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 860
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    .line 861
    const/16 v22, -0x1

    const/16 v23, 0x1

    .line 860
    move-object v0, v8

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 862
    .local v8, "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0x3

    const/16 v23, 0x1

    move-object v0, v8

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 863
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 864
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    .line 865
    const/16 v22, -0x1

    const/16 v23, -0x2

    .line 864
    move-object v0, v6

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 866
    .local v6, "accountParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0xa

    const/16 v23, 0xa

    const/16 v24, 0xa

    const/16 v25, 0x5

    move-object v0, v6

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 867
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 868
    .local v5, "accountLable":Landroid/widget/TextView;
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 869
    const/16 v22, 0x2

    move-object v0, v5

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 870
    const-string v22, "UC\u652f\u4ed8\u5bc6\u7801:"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 871
    const v22, -0xcdcdce

    move-object v0, v5

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 872
    new-instance v21, Landroid/widget/RelativeLayout$LayoutParams;

    .line 873
    const/16 v22, -0x1

    const/16 v23, -0x2

    .line 872
    invoke-direct/range {v21 .. v23}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 874
    .local v21, "usernameParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0x3

    const/16 v23, 0x2

    invoke-virtual/range {v21 .. v23}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 875
    const/16 v22, 0xa

    const/16 v23, 0x5

    const/16 v24, 0xa

    const/16 v25, 0x5

    invoke-virtual/range {v21 .. v25}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 876
    new-instance v22, Landroid/widget/EditText;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    .line 877
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 878
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/widget/EditText;->setSingleLine()V

    .line 879
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    move-object/from16 v22, v0

    const/16 v23, 0x3

    invoke-virtual/range {v22 .. v23}, Landroid/widget/EditText;->setId(I)V

    .line 880
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    move-object/from16 v22, v0

    const-string v23, "\u652f\u4ed8\u5bc6\u7801"

    invoke-virtual/range {v22 .. v23}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 881
    new-instance v17, Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 882
    .local v17, "submitBtn":Landroid/widget/Button;
    const/16 v22, 0x7

    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setId(I)V

    .line 883
    const-string v22, "\u786e\u5b9a\u8d2d\u4e70"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 884
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 885
    new-instance v18, Landroid/widget/RelativeLayout$LayoutParams;

    .line 886
    const/16 v22, -0x1

    const/16 v23, -0x2

    .line 885
    move-object/from16 v0, v18

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 887
    .local v18, "submitLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0xa

    move/from16 v0, v22

    move-object/from16 v1, v18

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 888
    const/16 v22, 0x3

    const/16 v23, 0x5

    move-object/from16 v0, v18

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 889
    const/16 v22, 0xe

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 890
    invoke-virtual/range {v17 .. v18}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 891
    new-instance v7, Landroid/widget/RelativeLayout;

    .line 892
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    .line 891
    move-object v0, v7

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 893
    .local v7, "inputareaLayout":Landroid/widget/RelativeLayout;
    const/16 v22, 0x7

    move-object v0, v7

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 894
    const v22, -0xf0506

    move-object v0, v7

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 895
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    .line 896
    const/16 v22, -0x1

    const/16 v23, -0x2

    .line 895
    move-object v0, v11

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 897
    .local v11, "localLayoutParams8":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0x3

    const/16 v23, 0xb

    move-object v0, v11

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 898
    invoke-virtual {v7, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 899
    invoke-virtual {v7, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 900
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    move-object/from16 v22, v0

    move-object v0, v7

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 901
    move-object v0, v7

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 902
    new-instance v14, Landroid/widget/RelativeLayout;

    .line 903
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    .line 902
    move-object v0, v14

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 904
    .local v14, "maintableLayout":Landroid/widget/RelativeLayout;
    const/16 v22, -0x1

    move-object v0, v14

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 906
    new-instance v22, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v23, -0x1

    const/16 v24, -0x1

    invoke-direct/range {v22 .. v24}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    move-object v0, v14

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 907
    move-object v0, v14

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 908
    move-object v0, v14

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 909
    invoke-virtual {v14, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 910
    invoke-virtual {v14, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 911
    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lcom/uc/paymentsdk/util/Utils;->generateBorderView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v10

    .line 912
    .local v10, "lineTextView1":Landroid/widget/TextView;
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    .line 913
    const/16 v22, -0x1

    const/16 v23, 0x1

    .line 912
    move-object v0, v12

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 914
    .local v12, "localLayoutParams9":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v22, 0x3

    const/16 v23, 0x7

    move-object v0, v12

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 915
    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 916
    invoke-virtual {v14, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 917
    new-instance v13, Landroid/widget/ScrollView;

    invoke-virtual/range {p0 .. p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplication()Landroid/app/Application;

    move-result-object v22

    move-object v0, v13

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 918
    .local v13, "localScrollView":Landroid/widget/ScrollView;
    const/16 v22, -0x1

    move-object v0, v13

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 919
    invoke-virtual {v13, v14}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 920
    move-object/from16 v0, p0

    move-object v1, v13

    invoke-virtual {v0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setContentView(Landroid/view/View;)V

    .line 921
    return-void

    .line 856
    .end local v5    # "accountLable":Landroid/widget/TextView;
    .end local v6    # "accountParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "inputareaLayout":Landroid/widget/RelativeLayout;
    .end local v8    # "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v9    # "lineTextView":Landroid/widget/TextView;
    .end local v10    # "lineTextView1":Landroid/widget/TextView;
    .end local v11    # "localLayoutParams8":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v12    # "localLayoutParams9":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v13    # "localScrollView":Landroid/widget/ScrollView;
    .end local v14    # "maintableLayout":Landroid/widget/RelativeLayout;
    .end local v17    # "submitBtn":Landroid/widget/Button;
    .end local v18    # "submitLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v21    # "usernameParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    const-string v22, "lock.png"

    goto/16 :goto_0
.end method

.method private buildUPointPaymentView()V
    .locals 14

    .prologue
    .line 602
    const/4 v8, 0x1

    iput v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    .line 603
    new-instance v7, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 604
    .local v7, "payTypeNameTextView":Landroid/widget/TextView;
    const/high16 v8, 0x41800000    # 16.0f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 605
    const/16 v8, 0x14

    const/4 v9, 0x0

    const/16 v10, 0x14

    const/4 v11, 0x0

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 606
    const v8, -0xbbbbbc

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 607
    const-string v8, "\u652f\u4ed8\u540d\u79f0 : %s"

    .line 608
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v11}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 607
    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 609
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvProduct:Landroid/widget/TextView;

    .line 610
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvProduct:Landroid/widget/TextView;

    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 611
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvProduct:Landroid/widget/TextView;

    const/16 v9, 0x14

    const/4 v10, 0x0

    const/16 v11, 0x14

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 612
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvProduct:Landroid/widget/TextView;

    const-string v9, "\u4ea7\u54c1\u540d : "

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 613
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvProduct:Landroid/widget/TextView;

    const v9, -0xbbbbbc

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 614
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 615
    .local v5, "payContentTextView":Landroid/widget/TextView;
    const/high16 v8, 0x41800000    # 16.0f

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 616
    const/16 v8, 0x14

    const/4 v9, 0x0

    const/16 v10, 0x14

    const/16 v11, 0x14

    invoke-virtual {v5, v8, v9, v10, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 617
    const-string v8, "\u6240\u8d2d\u5185\u5bb9 : %s"

    .line 618
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v11}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaydesc()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 617
    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 619
    const v8, -0xbbbbbc

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 620
    new-instance v6, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v6, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 621
    .local v6, "payCountTextView":Landroid/widget/TextView;
    const/high16 v8, 0x41800000    # 16.0f

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 622
    const/16 v8, 0x14

    const/4 v9, 0x0

    const/16 v10, 0x14

    const/4 v11, 0x0

    invoke-virtual {v6, v8, v9, v10, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 624
    const-string v8, "\u652f\u4ed8\u6570\u989d : %dU\u70b9\uff08\u4ef7\u503c%s\u5143\uff09"

    .line 625
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    .line 626
    iget-object v11, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v11}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getMoney()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    .line 627
    new-instance v11, Ljava/text/DecimalFormat;

    const-string v12, "##0.00"

    invoke-direct {v11, v12}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 628
    invoke-virtual {v12}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getMoney()I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x41200000    # 10.0f

    div-float/2addr v12, v13

    float-to-double v12, v12

    .line 627
    invoke-virtual {v11, v12, v13}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 623
    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 629
    const v8, -0xcdcdce

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 630
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    .line 631
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 632
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    const/16 v9, 0x14

    const/4 v10, 0x0

    const/16 v11, 0x14

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 633
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    const-string v9, "U\u70b9\u6298\u6263 : "

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 634
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    const v9, -0xcdcdce

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 635
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    .line 636
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 637
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    const/16 v9, 0x14

    const/4 v10, 0x0

    const/16 v11, 0x14

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 638
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    const-string v9, "\u4f1a\u5458\u6298\u6263 : "

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 639
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    const v9, -0xcdcdce

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 640
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    .line 641
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 642
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    const/16 v9, 0x14

    const/4 v10, 0x0

    const/16 v11, 0x14

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 643
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    const-string v9, "\u4f1a\u5458\u6298\u6263\u5230\u671f\u65f6\u95f4 : "

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 644
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    .line 645
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    const v9, -0xcdcdce

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 646
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    .line 647
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 648
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    const/16 v9, 0x14

    const/4 v10, 0x0

    const/16 v11, 0x14

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 649
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    const-string v9, "\u4f1a\u5458\u6298\u6263\u4fe1\u606f : "

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 650
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    const v9, -0xcdcdce

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 651
    new-instance v8, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    .line 652
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    const-string v9, "\u786e\u8ba4"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 653
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v8, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 654
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 655
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 656
    const/16 v8, 0x12c

    const/4 v9, -0x2

    .line 655
    invoke-direct {v0, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 657
    .local v0, "localLayoutParams3":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, 0x1

    iput v8, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 658
    new-instance v2, Landroid/widget/LinearLayout;

    .line 659
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 658
    invoke-direct {v2, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 660
    .local v2, "localLinearLayout2":Landroid/widget/LinearLayout;
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v2, v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 661
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 662
    new-instance v3, Landroid/widget/LinearLayout;

    .line 663
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 662
    invoke-direct {v3, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 664
    .local v3, "localLinearLayout3":Landroid/widget/LinearLayout;
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 665
    const/4 v8, -0x1

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 666
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 667
    const/4 v8, -0x1

    const/4 v9, -0x2

    .line 666
    invoke-direct {v1, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 668
    .local v1, "localLayoutParams4":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 669
    const-string v9, "\u9700\u8981\u652f\u4ed8\u7684\u5185\u5bb9"

    const/4 v10, 0x1

    .line 668
    invoke-static {v8, p0, v9, v10}, Lcom/uc/paymentsdk/util/Utils;->initSubTitle(Landroid/content/Context;Landroid/view/View$OnClickListener;Ljava/lang/String;Z)Landroid/widget/RelativeLayout;

    move-result-object v8

    invoke-virtual {v3, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 670
    invoke-virtual {v3, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 671
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvProduct:Landroid/widget/TextView;

    invoke-virtual {v3, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 672
    invoke-virtual {v3, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 673
    invoke-virtual {v3, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 675
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 676
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 678
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 680
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    invoke-virtual {v3, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 681
    invoke-virtual {v3, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 682
    new-instance v4, Landroid/widget/ScrollView;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v4, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 683
    .local v4, "localScrollView":Landroid/widget/ScrollView;
    const/4 v8, -0x1

    invoke-virtual {v4, v8}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 684
    invoke-virtual {v4, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 685
    invoke-virtual {p0, v4}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setContentView(Landroid/view/View;)V

    .line 686
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getUPointInfo()Lcom/uc/paymentsdk/payment/upoint/UPointInfo;

    move-result-object v8

    if-nez v8, :cond_0

    .line 687
    const/16 v8, 0xe

    invoke-virtual {p0, v8}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 688
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 689
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getPaymentInfo()Lcom/uc/paymentsdk/payment/PaymentInfo;

    move-result-object v9

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getCpID()Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getPaymentInfo()Lcom/uc/paymentsdk/payment/PaymentInfo;

    move-result-object v10

    .line 690
    invoke-virtual {v10}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmGameID()Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getPaymentInfo()Lcom/uc/paymentsdk/payment/PaymentInfo;

    move-result-object v11

    invoke-virtual {v11}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getMoney()I

    move-result v11

    .line 688
    invoke-static {v8, p0, v9, v10, v11}, Lcom/uc/paymentsdk/network/Api;->queryUPointDiscount(Landroid/content/Context;Lcom/uc/paymentsdk/network/ApiTask$TaskHandler;Ljava/lang/String;Ljava/lang/String;I)V

    .line 694
    :goto_0
    return-void

    .line 692
    :cond_0
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getUPointInfo()Lcom/uc/paymentsdk/payment/upoint/UPointInfo;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->initUPointPayView(Lcom/uc/paymentsdk/payment/upoint/UPointInfo;)V

    goto :goto_0
.end method

.method private fillData()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1216
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaytype()Ljava/lang/String;

    move-result-object v5

    .line 1215
    invoke-static {v4, v5}, Lcom/uc/paymentsdk/util/PrefUtil;->getAvailablePayType(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 1218
    .local v1, "arrayListofPayType":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/uc/paymentsdk/model/IType;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v2, v4, [Lcom/uc/paymentsdk/model/IType;

    .line 1221
    .local v2, "arrayOfPayType":[Lcom/uc/paymentsdk/model/IType;
    const-string v4, "overage"

    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaytype()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1222
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1223
    .local v3, "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/uc/paymentsdk/model/IType;>;"
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1250
    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mListView:Landroid/widget/ListView;

    new-instance v5, Lcom/uc/paymentsdk/commons/ui/CustomAdapter;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    .line 1251
    invoke-direct {v5, v6, v2}, Lcom/uc/paymentsdk/commons/ui/CustomAdapter;-><init>(Landroid/content/Context;[Lcom/uc/paymentsdk/model/IType;)V

    .line 1250
    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1252
    return-void

    .line 1224
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uc/paymentsdk/model/IType;

    .line 1225
    .local v0, "aPayType":Lcom/uc/paymentsdk/model/IType;
    const-string v4, "upoint"

    invoke-interface {v0}, Lcom/uc/paymentsdk/model/IType;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1226
    aput-object v0, v2, v6

    goto :goto_0

    .line 1230
    .end local v0    # "aPayType":Lcom/uc/paymentsdk/model/IType;
    .end local v3    # "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/uc/paymentsdk/model/IType;>;"
    :cond_3
    const-string v4, "sms"

    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 1231
    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaytype()Ljava/lang/String;

    move-result-object v5

    .line 1230
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1232
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1233
    .restart local v3    # "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/uc/paymentsdk/model/IType;>;"
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1234
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uc/paymentsdk/model/IType;

    .line 1235
    .restart local v0    # "aPayType":Lcom/uc/paymentsdk/model/IType;
    const-string v4, "sms"

    invoke-interface {v0}, Lcom/uc/paymentsdk/model/IType;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1236
    aput-object v0, v2, v6

    goto :goto_0

    .line 1241
    .end local v0    # "aPayType":Lcom/uc/paymentsdk/model/IType;
    .end local v3    # "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/uc/paymentsdk/model/IType;>;"
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1242
    .restart local v3    # "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/uc/paymentsdk/model/IType;>;"
    :cond_6
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1243
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uc/paymentsdk/model/IType;

    .line 1244
    .restart local v0    # "aPayType":Lcom/uc/paymentsdk/model/IType;
    const-string v4, "upoint"

    invoke-interface {v0}, Lcom/uc/paymentsdk/model/IType;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1245
    aput-object v0, v2, v6

    goto :goto_1

    .line 1246
    :cond_7
    const-string v4, "sms"

    invoke-interface {v0}, Lcom/uc/paymentsdk/model/IType;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1247
    array-length v4, v2

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    aput-object v0, v2, v4

    goto :goto_1
.end method

.method private getPayedAmount()I
    .locals 4

    .prologue
    .line 543
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsPayment()I

    move-result v2

    .line 544
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/uc/paymentsdk/util/PrefUtil;->getPayedAmount(Landroid/content/Context;)I

    move-result v3

    .line 543
    sub-int v0, v2, v3

    .line 545
    .local v0, "i":I
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v2, v2, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    div-int v1, v0, v2

    .line 546
    .local v1, "j":I
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v2, v2, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    iget v3, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    sub-int v3, v1, v3

    mul-int/2addr v2, v3

    return v2
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0
    .param p0, "paramContext"    # Landroid/content/Context;

    .prologue
    .line 1538
    invoke-static {}, Lcom/uc/paymentsdk/network/chain/SyncChargeChannelHandler;->init()V

    .line 1539
    invoke-static {}, Lcom/uc/paymentsdk/network/chain/SyncPayChannelHandler;->init()V

    .line 1540
    invoke-static {}, Lcom/uc/paymentsdk/network/chain/SyncSmsInfoHandler;->init()V

    .line 1541
    return-void
.end method

.method private initPayment()Z
    .locals 11

    .prologue
    const/16 v10, 0x64

    const/16 v9, 0x32

    const/4 v8, 0x2

    const/16 v7, 0x16

    const/4 v6, 0x0

    .line 332
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 333
    const-string v5, "com.mappn.sdk.paymentinfo"

    .line 332
    invoke-virtual {v4, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    check-cast v4, Lcom/uc/paymentsdk/payment/PaymentInfo;

    iput-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 334
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    if-nez v4, :cond_0

    .line 335
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "PaymentInfo\u5fc5\u987b\u8bbe\u7f6e"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 336
    :cond_0
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v5, "sms"

    invoke-virtual {v4, v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->setPaytype(Ljava/lang/String;)V

    .line 337
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getMoney()I

    move-result v0

    .line 338
    .local v0, "i":I
    if-lez v0, :cond_1

    const/16 v4, 0x2710

    if-gt v0, v4, :cond_1

    rem-int/lit8 v4, v0, 0x5

    if-eqz v4, :cond_2

    .line 339
    :cond_1
    invoke-virtual {p0, v6}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    move v4, v6

    .line 390
    :goto_0
    return v4

    .line 342
    :cond_2
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    .line 343
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u5fc5\u987b\u6307\u5b9a\u652f\u4ed8\u5185\u5bb9\u540d\u79f0"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 344
    :cond_3
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaydesc()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4

    .line 345
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u5fc5\u987b\u6307\u5b9a\u652f\u4ed8\u5185\u5bb9\u63cf\u8ff0"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 346
    :cond_4
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmGameID()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5

    .line 347
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u5fc5\u987b\u6307\u5b9a\u6e38\u620fID"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 348
    :cond_5
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmGameID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v4, v8, :cond_6

    .line 349
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u6e38\u620fID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 350
    :cond_6
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmGameID()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/uc/paymentsdk/util/Utils;->isNumeric(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 351
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u6e38\u620fID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 352
    :cond_7
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmActionID()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_8

    .line 353
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u5fc5\u987b\u6307\u5b9a\u652f\u4ed8\u70b9ID"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 354
    :cond_8
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmActionID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v4, v8, :cond_9

    .line 355
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u652f\u4ed8\u70b9ID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 356
    :cond_9
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmActionID()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/uc/paymentsdk/util/Utils;->isNumeric(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 357
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\u652f\u4ed8\u70b9ID\u5fc5\u987b\u4e3a\u4e24\u4f4d\u6570\u5b57"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 358
    :cond_a
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v9, :cond_b

    .line 359
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v5

    .line 360
    invoke-virtual {v5, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 359
    invoke-virtual {v4, v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->setPayname(Ljava/lang/String;)V

    .line 361
    :cond_b
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaydesc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v10, :cond_c

    .line 362
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPaydesc()Ljava/lang/String;

    move-result-object v5

    .line 363
    invoke-virtual {v5, v6, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 362
    invoke-virtual {v4, v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->setPaydesc(Ljava/lang/String;)V

    .line 375
    :cond_c
    :try_start_0
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/uc/paymentsdk/util/Utils;->getCpID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 376
    .local v3, "str":Ljava/lang/String;
    const-string v4, "^[0-9a-zA-Z]{1,10}$"

    invoke-static {v4, v3}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_d

    .line 377
    const/16 v4, 0x16

    invoke-virtual {p0, v4}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    move v4, v6

    .line 378
    goto/16 :goto_0

    .line 380
    :cond_d
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4, v3}, Lcom/uc/paymentsdk/payment/PaymentInfo;->setCpID(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 386
    .end local v3    # "str":Ljava/lang/String;
    :goto_1
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getUsername()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_e

    .line 387
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    .line 388
    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getUsername()Ljava/lang/String;

    move-result-object v5

    .line 387
    invoke-static {v4, v5}, Lcom/uc/paymentsdk/util/PrefUtil;->setUCUserName(Landroid/content/Context;Ljava/lang/String;)V

    .line 389
    :cond_e
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-static {v4}, Lcom/uc/paymentsdk/util/Utils;->setPaymentInfo(Lcom/uc/paymentsdk/payment/PaymentInfo;)V

    .line 390
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 381
    :catch_0
    move-exception v4

    move-object v1, v4

    .line 382
    .local v1, "localNameNotFoundException2":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_1

    .line 383
    .end local v1    # "localNameNotFoundException2":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v4

    move-object v2, v4

    .line 384
    .local v2, "localNullPointerException2":Ljava/lang/NullPointerException;
    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_1
.end method

.method private initSmsPayView(Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/Button;Landroid/widget/Button;Landroid/widget/RelativeLayout;)V
    .locals 14
    .param p1, "tvSmsMessage"    # Landroid/widget/TextView;
    .param p2, "tvSmsText"    # Landroid/widget/TextView;
    .param p3, "payMoney"    # I
    .param p4, "cancelBtn"    # Landroid/widget/Button;
    .param p5, "okBtn"    # Landroid/widget/Button;
    .param p6, "tableLayout"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 1020
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1021
    const/16 v9, 0x96

    const/4 v10, -0x2

    .line 1020
    invoke-direct {v5, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1023
    .local v5, "okBtnParams":Landroid/widget/RelativeLayout$LayoutParams;
    :try_start_0
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/uc/paymentsdk/util/PrefUtil;->getPayedAmount(Landroid/content/Context;)I

    move-result v6

    .line 1024
    .local v6, "payedCount":I
    const/4 v7, 0x0

    .line 1026
    .local v7, "showtext":Landroid/text/Spanned;
    if-nez v6, :cond_4

    .line 1027
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    if-nez v9, :cond_0

    .line 1029
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsInfos()Lcom/uc/paymentsdk/payment/sms/SmsInfos;

    move-result-object v9

    .line 1030
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    .line 1029
    move-object v0, v9

    move-object v1, v10

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/uc/paymentsdk/payment/sms/SmsInfos;->filterSmsInfo(Landroid/content/Context;I)Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    move-result-object v9

    iput-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    .line 1032
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget-object v10, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v9, v10}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->setExtInfo(Lcom/uc/paymentsdk/payment/PaymentInfo;)V

    .line 1034
    :cond_0
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v9, v9, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    div-int v8, p3, v9

    .line 1035
    .local v8, "smsTotalToSendCount":I
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v9, v9, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    rem-int v9, p3, v9

    if-eqz v9, :cond_1

    .line 1036
    add-int/lit8 v8, v8, 0x1

    .line 1038
    :cond_1
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->isNeedconfirm()Z

    move-result v9

    if-nez v9, :cond_3

    .line 1041
    iget v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    const/4 v10, -0x1

    if-ne v9, v10, :cond_2

    .line 1042
    iput v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToReceiveCount:I

    .line 1043
    iput v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    .line 1046
    const-string v9, "\u5c0a\u656c\u7684\u7528\u6237\uff0c\u611f\u8c22\u60a8\u4e3a\u6e38\u620f\u652f\u4ed8\uff0c\u60a8\u9700\u8981\u53d1\u9001<font color=\'#FF4500\'>[ %d ]</font>\u6761 %d \u5143\u7684\u77ed\u4fe1\uff0c\u8d2d\u4e70<font color=\'#FF4500\'>[%s]</font>\uff0c\u5171\u8ba1<font color=\'#FF4500\'>[ %d ]</font>\u5143\uff0c\u70b9\u51fb<font color=\'#FF4500\'>[\u70b9\u64ad]</font>\u5f00\u59cb\u53d1\u9001\u3002\u8bf7\u6ce8\u610f\u53d1\u9001\u5f00\u59cb\u540e\uff0c\u60a8\u4e0d\u80fd\u4e2d\u65ad\u53d1\u9001\uff0c\u5426\u5219\u8d2d\u4e70\u5c06\u4e0d\u6210\u529f\u3002"

    .line 1047
    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    .line 1048
    iget v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    .line 1049
    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v12, v12, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    .line 1050
    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 1051
    invoke-virtual {v12}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x3

    .line 1052
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 1046
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1045
    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    .line 1053
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    .line 1067
    :goto_0
    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1069
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->getInfobeforesend()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p2

    move-object v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1129
    .end local v8    # "smsTotalToSendCount":I
    :goto_1
    const/4 v9, 0x4

    invoke-static {p1, v9}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    .line 1130
    const/4 v9, 0x4

    move-object/from16 v0, p2

    move v1, v9

    invoke-static {v0, v1}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z
    :try_end_0
    .catch Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1135
    .end local v6    # "payedCount":I
    .end local v7    # "showtext":Landroid/text/Spanned;
    :goto_2
    const/16 v9, 0xc

    const/4 v10, -0x1

    invoke-virtual {v5, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1136
    const/16 v9, 0xa

    const/16 v10, 0x14

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-virtual {v5, v9, v10, v11, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 1137
    move-object/from16 v0, p5

    move-object v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1138
    move-object/from16 v0, p6

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1139
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1140
    const/16 v9, 0x96

    const/4 v10, -0x2

    .line 1139
    invoke-direct {v3, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1141
    .local v3, "cancelBtnParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v9, 0xb

    const/4 v10, -0x1

    invoke-virtual {v3, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1142
    const/16 v9, 0xc

    const/4 v10, -0x1

    invoke-virtual {v3, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1143
    const/16 v9, 0xa

    const/16 v10, 0x14

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-virtual {v3, v9, v10, v11, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 1144
    move-object/from16 v0, p4

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1145
    move-object/from16 v0, p6

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1146
    move-object v0, p0

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setContentView(Landroid/view/View;)V

    .line 1147
    return-void

    .line 1057
    .end local v3    # "cancelBtnParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v6    # "payedCount":I
    .restart local v7    # "showtext":Landroid/text/Spanned;
    .restart local v8    # "smsTotalToSendCount":I
    :cond_2
    :try_start_1
    const-string v9, "\u5c0a\u656c\u7684\u7528\u6237\uff0c\u70b9\u51fb<font color=\'#FF4500\'>[\u786e\u5b9a]</font>\u6309\u94ae\uff0c\u53d1\u9001\u7b2c<font color=\'#FF4500\'>[ %d ]</font>\u6761\u77ed\u4fe1\u3002"

    .line 1058
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    .line 1060
    iget v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    .line 1059
    sub-int v12, v8, v12

    add-int/lit8 v12, v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 1057
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1056
    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    .line 1062
    const/16 v9, 0x8

    move-object/from16 v0, p4

    move v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1063
    const-string v9, "\u786e\u5b9a"

    move-object/from16 v0, p5

    move-object v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1064
    const/16 v9, 0xe

    const/4 v10, -0x1

    invoke-virtual {v5, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V
    :try_end_1
    .catch Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 1131
    .end local v6    # "payedCount":I
    .end local v7    # "showtext":Landroid/text/Spanned;
    .end local v8    # "smsTotalToSendCount":I
    :catch_0
    move-exception v9

    move-object v4, v9

    .line 1132
    .local v4, "localSimCardNotSupportException":Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;
    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;->getMessage()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 1133
    const/16 v9, 0x10

    invoke-virtual {p0, v9}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_2

    .line 1072
    .end local v4    # "localSimCardNotSupportException":Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException;
    .restart local v6    # "payedCount":I
    .restart local v7    # "showtext":Landroid/text/Spanned;
    .restart local v8    # "smsTotalToSendCount":I
    :cond_3
    :try_start_2
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->getInfobeforesend()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1073
    const/16 v9, 0x8

    move-object/from16 v0, p4

    move v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1074
    const-string v9, "\u786e\u5b9a"

    move-object/from16 v0, p5

    move-object v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1075
    const/16 v9, 0xe

    const/4 v10, -0x1

    invoke-virtual {v5, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto/16 :goto_1

    .line 1078
    .end local v8    # "smsTotalToSendCount":I
    :cond_4
    sub-int p3, p3, v6

    .line 1079
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    if-nez v9, :cond_5

    .line 1080
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsInfos()Lcom/uc/paymentsdk/payment/sms/SmsInfos;

    move-result-object v9

    .line 1081
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    .line 1080
    move-object v0, v9

    move-object v1, v10

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/uc/paymentsdk/payment/sms/SmsInfos;->filterSmsInfo(Landroid/content/Context;I)Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    move-result-object v9

    iput-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    .line 1082
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget-object v10, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v9, v10}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->setExtInfo(Lcom/uc/paymentsdk/payment/PaymentInfo;)V

    .line 1084
    :cond_5
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->isNeedconfirm()Z

    move-result v9

    if-nez v9, :cond_8

    .line 1085
    iget v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    const/4 v10, -0x1

    if-ne v9, v10, :cond_7

    .line 1086
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v9, v9, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    div-int v8, p3, v9

    .line 1087
    .restart local v8    # "smsTotalToSendCount":I
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v9, v9, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    rem-int v9, p3, v9

    if-eqz v9, :cond_6

    .line 1088
    add-int/lit8 v8, v8, 0x1

    .line 1090
    :cond_6
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    .line 1091
    iput v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    .line 1092
    iput v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToReceiveCount:I

    .line 1095
    const-string v9, "\u60a8\u4ee5\u524d\u6210\u529f\u53d1\u9001\u8fc7\u603b\u8ba1 %d \u5143\u7684\u77ed\u4fe1\u8d2d\u4e70<font color=\'#FF4500\'>[%s]</font>\uff0c\u76ee\u524d\u8fd8\u9700\u53d1\u9001<font color=\'#FF4500\'>[ %d ]</font>\u6761  %d \u5143\u77ed\u4fe1\u7ee7\u7eed\u8d2d\u4e70\uff0c\u70b9\u51fb<font color=\'#FF4500\'>[\u70b9\u64ad]</font>\u6309\u94ae\u5f00\u59cb\u53d1\u9001\u3002"

    .line 1096
    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    .line 1097
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    .line 1098
    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 1099
    invoke-virtual {v12}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    .line 1100
    iget v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x3

    .line 1101
    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v12, v12, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 1095
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1094
    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    .line 1117
    .end local v8    # "smsTotalToSendCount":I
    :goto_3
    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1119
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->getInfobeforesend()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p2

    move-object v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 1105
    :cond_7
    const-string v9, "\u5c0a\u656c\u7684\u7528\u6237\uff0c\u70b9\u51fb<font color=\'#FF4500\'>[\u786e\u5b9a]</font>\u6309\u94ae\uff0c\u5f00\u59cb\u53d1\u9001\u7b2c<font color=\'#FF4500\'>[ %d ]</font>\u6761\u77ed\u4fe1\u3002"

    .line 1106
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    .line 1108
    iget-object v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v12, v12, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    .line 1107
    div-int v12, p3, v12

    .line 1109
    iget v13, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    .line 1107
    sub-int/2addr v12, v13

    add-int/lit8 v12, v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    .line 1111
    iget v12, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 1105
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1104
    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    .line 1112
    const/16 v9, 0x8

    move-object/from16 v0, p4

    move v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1113
    const-string v9, "\u786e\u5b9a"

    move-object/from16 v0, p5

    move-object v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1114
    const/16 v9, 0xe

    const/4 v10, -0x1

    invoke-virtual {v5, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_3

    .line 1122
    :cond_8
    iget-object v9, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v9}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->getInfobeforesend()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1123
    const/16 v9, 0x8

    move-object/from16 v0, p4

    move v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1124
    const-string v9, "\u786e\u5b9a"

    move-object/from16 v0, p5

    move-object v1, v9

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1125
    const/16 v9, 0xe

    const/4 v10, -0x1

    invoke-virtual {v5, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V
    :try_end_2
    .catch Lcom/uc/paymentsdk/payment/sms/SimCardNotSupportException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1
.end method

.method private initUPointPayView(Lcom/uc/paymentsdk/payment/upoint/UPointInfo;)V
    .locals 8
    .param p1, "info"    # Lcom/uc/paymentsdk/payment/upoint/UPointInfo;

    .prologue
    const/4 v7, 0x2

    const/16 v6, 0x8

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 697
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    const-string v1, "U\u70b9\u6298\u6263 : %s\u6298(%sU\u70b9)"

    .line 698
    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getDiscount()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getDiscounttext()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 697
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 699
    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getVipdiscount()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getVipdiscount()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 700
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvDiscountTextView:Landroid/widget/TextView;

    .line 701
    const-string v1, "\u4f1a\u5458\u6298\u6263 : %s\u6298(%sU\u70b9)"

    .line 702
    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getVipdiscount()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    .line 703
    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getVipdiscounttext()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 700
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 704
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    .line 705
    const-string v1, "\u4f1a\u5458\u6298\u6263\u5230\u671f\u65f6\u95f4 : "

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getVipdiscounttime()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    .line 704
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 706
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u4f1a\u5458\u6298\u6263\u5230\u671f\u65f6\u95f4 : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 707
    invoke-virtual {p1}, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;->getDiscountinfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 706
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 713
    :goto_0
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 714
    return-void

    .line 709
    :cond_0
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 710
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountTimeTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 711
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTvVipDiscountInfo:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private pay()V
    .locals 3

    .prologue
    .line 1513
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1514
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 1515
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    .line 1514
    invoke-static {v0, p0, v1, v2}, Lcom/uc/paymentsdk/network/Api;->pay(Landroid/content/Context;Lcom/uc/paymentsdk/network/ApiTask$TaskHandler;Lcom/uc/paymentsdk/payment/PaymentInfo;Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;)V

    .line 1516
    return-void
.end method

.method private sendConfirmSms(Ljava/lang/String;)V
    .locals 6
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x11

    .line 1395
    invoke-virtual {p0, v5}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1397
    :try_start_0
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 1398
    const-string v2, ",,,,"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    const-string v3, ",,,,"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v3, v3, v4

    .line 1397
    invoke-static {v1, v2, v3}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->sendSms(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1414
    :goto_0
    return-void

    .line 1399
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1401
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 1402
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1403
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1404
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1406
    :try_start_1
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1410
    :cond_0
    :goto_1
    invoke-virtual {p0, v5}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1411
    const/16 v1, 0x26

    invoke-virtual {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1407
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method private sendFirstSms(Lcom/uc/paymentsdk/payment/sms/SmsInfo;)V
    .locals 4
    .param p1, "paramSmsInfo"    # Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    .prologue
    const/16 v3, 0x11

    .line 1376
    invoke-virtual {p0, v3}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1378
    :try_start_0
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->sendFirstSms(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1392
    :goto_0
    return-void

    .line 1379
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1380
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 1381
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1382
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1383
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1385
    :try_start_1
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1389
    :cond_0
    :goto_1
    invoke-virtual {p0, v3}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1390
    const/16 v1, 0x26

    invoke-virtual {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1386
    :catch_1
    move-exception v1

    goto :goto_1
.end method


# virtual methods
.method public confirmEnterPaymentPoint()V
    .locals 1

    .prologue
    .line 328
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/uc/paymentsdk/util/PrefUtil;->increaseArriveCount(Landroid/content/Context;)V

    .line 329
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "paramInt1"    # I
    .param p2, "paramInt2"    # I
    .param p3, "paramIntent"    # Landroid/content/Intent;

    .prologue
    .line 1520
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 1521
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 13
    .param p1, "paramView"    # Landroid/view/View;

    .prologue
    const/16 v7, 0x1c

    const/16 v6, 0x1b

    const/4 v5, -0x1

    const/16 v4, 0x17

    const/4 v3, 0x0

    .line 1255
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 1256
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1257
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPayLoginView()V

    .line 1373
    .end local p1    # "paramView":Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 1260
    .restart local p1    # "paramView":Landroid/view/View;
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1289
    .end local p1    # "paramView":Landroid/view/View;
    :goto_1
    :pswitch_0
    iget-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    if-eqz v0, :cond_6

    .line 1290
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildSmsPaymentView()V

    .line 1291
    iput-boolean v3, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    goto :goto_0

    .line 1262
    .restart local p1    # "paramView":Landroid/view/View;
    :pswitch_1
    check-cast p1, Landroid/widget/Button;

    .end local p1    # "paramView":Landroid/view/View;
    invoke-virtual {p1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1263
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1264
    .local v1, "usernamestr":Ljava/lang/String;
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1265
    .local v2, "pwdstr":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1266
    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1267
    :cond_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1268
    const/16 v0, 0x1d

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1269
    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1270
    const/16 v0, 0x1e

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1272
    :cond_4
    new-instance v0, Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    const-string v3, ""

    .line 1273
    iget-object v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v4}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getCpID()Ljava/lang/String;

    move-result-object v4

    .line 1274
    iget-object v5, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v5}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getmGameID()Ljava/lang/String;

    move-result-object v5

    .line 1275
    iget-object v6, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v6}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getMoney()I

    move-result v6

    const-string v7, ""

    invoke-direct/range {v0 .. v7}, Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 1272
    iput-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    .line 1276
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->pay()V

    goto :goto_0

    .line 1280
    .end local v1    # "usernamestr":Ljava/lang/String;
    .end local v2    # "pwdstr":Ljava/lang/String;
    .restart local p1    # "paramView":Landroid/view/View;
    :pswitch_2
    check-cast p1, Landroid/widget/Button;

    .end local p1    # "paramView":Landroid/view/View;
    invoke-virtual {p1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1281
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPayPass:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1282
    .local v10, "paypassstr":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1283
    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_1

    .line 1285
    :cond_5
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    invoke-virtual {v0, v10}, Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;->setPaypwd(Ljava/lang/String;)V

    .line 1286
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->pay()V

    goto/16 :goto_1

    .line 1293
    .end local v10    # "paypassstr":Ljava/lang/String;
    :cond_6
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    if-eqz v0, :cond_0

    .line 1304
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    .line 1305
    const-string v4, "com.uc.androidsdk.SMS_SENT_ACTION"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1304
    invoke-virtual {p0, v0, v3}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1306
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-direct {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->sendFirstSms(Lcom/uc/paymentsdk/payment/sms/SmsInfo;)V

    goto/16 :goto_0

    .line 1310
    .restart local p1    # "paramView":Landroid/view/View;
    :pswitch_3
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mConfirmSmsInfoString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1311
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mConfirmSmsInfoString:Ljava/lang/String;

    const-string v3, ",,,,"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1314
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mConfirmSmsInfoString:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->sendConfirmSms(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1317
    :pswitch_4
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto/16 :goto_0

    .line 1320
    :pswitch_5
    invoke-virtual {p0, v4}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_0

    .line 1323
    :pswitch_6
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    packed-switch v0, :pswitch_data_1

    goto/16 :goto_0

    .line 1325
    :pswitch_7
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->finish()V

    goto/16 :goto_0

    .line 1328
    :pswitch_8
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto/16 :goto_0

    .line 1331
    :pswitch_9
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPaymentView()V

    goto/16 :goto_0

    .line 1334
    :pswitch_a
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPayLoginView()V

    goto/16 :goto_0

    .line 1337
    :pswitch_b
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v0}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->isNeedconfirm()Z

    move-result v0

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    if-nez v0, :cond_8

    .line 1338
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsPayment()I

    move-result v12

    .line 1339
    .local v12, "totalToPay":I
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v0, v0, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    div-int v11, v12, v0

    .line 1340
    .local v11, "totalSMS":I
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    if-eq v0, v5, :cond_7

    .line 1341
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    if-eq v0, v11, :cond_7

    .line 1342
    invoke-virtual {p0, v6}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_0

    .line 1344
    :cond_7
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildSmsPaymentView()V

    goto/16 :goto_0

    .line 1346
    .end local v11    # "totalSMS":I
    .end local v12    # "totalToPay":I
    :cond_8
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto/16 :goto_0

    .line 1350
    :pswitch_c
    invoke-virtual {p0, v4}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_0

    .line 1354
    :pswitch_d
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    packed-switch v0, :pswitch_data_2

    .line 1370
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->finish()V

    goto/16 :goto_0

    .line 1356
    :pswitch_e
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v0}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->isNeedconfirm()Z

    move-result v0

    if-nez v0, :cond_9

    iget-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    if-eqz v0, :cond_0

    .line 1357
    :cond_9
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsPayment()I

    move-result v8

    .line 1358
    .local v8, "i":I
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v0, v0, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    div-int v9, v8, v0

    .line 1359
    .local v9, "j":I
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    if-eq v0, v5, :cond_a

    .line 1360
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    if-eq v0, v9, :cond_a

    .line 1361
    invoke-virtual {p0, v6}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_0

    .line 1363
    :cond_a
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto/16 :goto_0

    .line 1367
    .end local v8    # "i":I
    .end local v9    # "j":I
    :pswitch_f
    invoke-virtual {p0, v4}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_0

    .line 1260
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_1
        :pswitch_2
        :pswitch_6
        :pswitch_d
    .end packed-switch

    .line 1323
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch

    .line 1354
    :pswitch_data_2
    .packed-switch 0x4
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "paramBundle"    # Landroid/os/Bundle;

    .prologue
    .line 312
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 314
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->initPayment()Z

    move-result v0

    iput-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsValid:Z

    .line 315
    iget-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsValid:Z

    if-eqz v0, :cond_0

    .line 317
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/uc/paymentsdk/util/Utils;->init(Landroid/content/Context;)V

    .line 319
    invoke-static {p0}, Lcom/uc/paymentsdk/util/Utils;->initTitleBar(Landroid/app/Activity;)V

    .line 320
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    .line 321
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->confirmEnterPaymentPoint()V

    .line 322
    new-instance v0, Lcom/uc/paymentsdk/network/chain/HandlerProxy;

    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/uc/paymentsdk/network/chain/HandlerProxy;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/uc/paymentsdk/network/chain/HandlerProxy;->handleRequest()V

    .line 324
    :cond_0
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 8
    .param p1, "paramInt"    # I

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 400
    packed-switch p1, :pswitch_data_0

    .line 534
    :pswitch_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 403
    :pswitch_1
    const-string v0, "\u8be5\u5e94\u7528\u8981\u6c42\u652f\u4ed8\u7684\u91d1\u989d\u4e0d\u7b26\u5408\u8981\u6c42\uff0c\u4e0d\u80fd\u6210\u529f\u652f\u4ed8\u3002"

    .line 402
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 406
    :pswitch_2
    const-string v0, "CPID\u4e3a\u5b57\u7b26\u4e32\u548c\u6570\u5b57\u4efb\u610f\u7ec4\u5408\uff0c\u4e0d\u80fd\u7531\u4e2d\u6587\u5b57\u7b26\u3001\u6807\u70b9\u7b26\u53f7\u6216\u7a7a\u683c\uff0c\u957f\u5ea6\u4e0d\u8d85\u8fc710\u4e2a\u82f1\u6587\u5b57\u7b26\u3002"

    .line 405
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 412
    :pswitch_3
    const-string v0, "\u4ec0\u4e48\u662fU\u70b9?"

    .line 413
    const-string v1, "U\u70b9\u662f<a href=\'http://wap.uc.cn\'>UC-\u4f18\u89c6</a>\u63d0\u4f9b\u7684\u4e00\u79cd\u865a\u62df\u8d27\u5e01\uff0c\u4e3b\u8981\u7528\u4e8e\u8d2d\u4e70\u8f6f\u4ef6\u548c\u6e38\u620f\u91cc\u7684\u5185\u5bb9\uff08\u5982\uff1a\u9053\u5177\u3001\u5173\u5361\u3001\u8f6f\u4ef6\u3001\u4f7f\u7528\u65f6\u957f\u7b49\uff09\u3002<br /><br />U\u70b9\u5151\u6362\u6807\u51c6\uff1a<br />1\u5143\u53ef\u5151\u636210U\u70b9\u3002<br />\u901a\u8fc7\u4ee5\u4e0b\u94fe\u63a5\u5145\u503cU\u70b9\uff1a<br /><a href=\'http://pay.uc.cn\'>UC-\u4f18\u89c6</a>"

    .line 409
    invoke-static {p0, p1, v0, v1, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialogSupportLink(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 417
    :pswitch_4
    const-string v0, "\u8fde\u63a5\u670d\u52a1\u5668\uff0c\u8bf7\u7a0d\u7b49..."

    .line 416
    invoke-static {p0, p1, v0, v4, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createIndeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 420
    :pswitch_5
    const-string v0, "\u6b63\u5728\u652f\u4ed8\uff0c\u8bf7\u52ff\u5173\u95ed\u7a0b\u5e8f\uff0c\u8bf7\u7a0d\u540e......"

    .line 419
    invoke-static {p0, p1, v0, v4, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createIndeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 423
    :pswitch_6
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002"

    .line 422
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 426
    :pswitch_7
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002"

    .line 425
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 429
    :pswitch_8
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002"

    .line 428
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 432
    :pswitch_9
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u60a8\u7684\u652f\u4ed8\u5bc6\u7801\u6709\u8bef\uff0c\u4e0d\u80fd\u652f\u4ed8\u6210\u529f\uff01"

    .line 431
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 435
    :pswitch_a
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8fde\u63a5\u670d\u52a1\u5668\u8d85\u65f6\uff0c\u662f\u5426\u91cd\u8bd5?"

    .line 434
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createYesNoDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 438
    :pswitch_b
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u60a8\u5df2\u7ecf\u7981\u6b62\u4e86\u53d1\u9001\u652f\u4ed8\u77ed\u4fe1\uff0c\u8bf7\u91cd\u65b0\u5c1d\u8bd5\u652f\u4ed8\u3002"

    .line 437
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 441
    :pswitch_c
    const-string v0, "\u60a8\u624b\u673a\u65f6\u95f4\u4e0d\u6b63\u786e\uff0c\u4e3a\u4e86\u786e\u4fdd\u5b89\u5168\u652f\u4ed8\uff0c\u662f\u5426\u9700\u8981\u7cfb\u7edf\u81ea\u52a8\u4fee\u6b63\u5e76\u5b8c\u6210\u652f\u4ed8?"

    .line 440
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createYesNoDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 444
    :pswitch_d
    const-string v0, "\u652f\u4ed8\u4e0d\u6210\u529f\uff0c\u8bf7\u786e\u5b9a\u60a8\u7684\u8d26\u6237\u5f53\u4e2d\u7684\u4f59\u989d\u5145\u8db3\u5e76\u7f51\u7edc\u8fde\u63a5\u6b63\u5e38\u3002\n\u8bf7\u8054\u7cfb\u5ba2\u670d4006-400-401\u3002"

    .line 443
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 449
    :pswitch_e
    const-string v0, "U\u70b9\u652f\u4ed8\u6210\u529f\uff0c\u795d\u60a8\u73a9\u7684\u5f00\u5fc3"

    .line 450
    const-string v1, "\u60a8\u7684\u4f59\u989d\u4e3a%dU\u70b9"

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mNumber:Ljava/lang/String;

    aput-object v3, v2, v4

    .line 451
    iget v3, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBalance:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    .line 450
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 446
    invoke-static {p0, p1, v0, v1, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 454
    :pswitch_f
    const-string v0, "U\u70b9\u4e0d\u8db3,\u4e0d\u80fd\u7ee7\u7eed\u652f\u4ed8\uff01"

    .line 453
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 457
    :pswitch_10
    const-string v0, "\u7f51\u7edc\u8fde\u63a5\u9519\u8bef\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u518d\u8bd5\u3002"

    .line 456
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 460
    :pswitch_11
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 459
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 463
    :pswitch_12
    const-string v0, "\u77ed\u4fe1\u53d1\u9001\u8fc7\u7a0b\u53ef\u80fd\u6301\u7eed\u4e00\u5206\u949f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85..."

    .line 462
    invoke-static {p0, p1, v0, v4, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createIndeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 466
    :pswitch_13
    const-string v0, "\u6b63\u5728\u83b7\u53d6\u4fe1\u606f\uff0c\u8bf7\u7a0d\u5019......"

    .line 465
    invoke-static {p0, p1, v0, v4, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createIndeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 468
    :pswitch_14
    const-string v0, "\u8d2d\u4e70\u6210\u529f"

    .line 469
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 468
    invoke-static {p0, p1, v0, v1, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 472
    :pswitch_15
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsResultInfo:Ljava/lang/String;

    .line 471
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 475
    :pswitch_16
    const-string v2, "\u60a8\u5df2\u7ecf\u53d6\u6d88\u4e86\u8d2d\u4e70\uff0c\u5c06\u4e0d\u4f1a\u83b7\u5f97\u76f8\u5e94\u5185\u5bb9\u3002\u8bf7\u786e\u8ba4\u662f\u5426\u53d6\u6d88\uff1f"

    .line 476
    const-string v3, "\u53d6\u6d88"

    const-string v4, "\u4e0d\u53d6\u6d88"

    move-object v0, p0

    move v1, p1

    move-object v5, p0

    .line 474
    invoke-static/range {v0 .. v5}, Lcom/uc/paymentsdk/util/DialogUtil;->createTwoButtonsDialog(Landroid/content/Context;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 482
    :pswitch_17
    const-string v0, "\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\u672a\u5220\u9664\uff0c\u5982\u9700\u8d2d\u4e70\u8bf7\u518d\u6b21\u53d1\u9001\u77ed\u4fe1\u6216\u91c7\u7528\u5176\u4ed6\u652f\u4ed8\u65b9\u5f0f\uff0c<font color=\'red\'>\u8bf7\u52ff\u5230\u77ed\u4fe1\u6536\u4ef6\u7bb1\u8fdb\u884c\u56de\u590d</font>\uff0c\u8c22\u8c22\uff01"

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    .line 483
    const-string v3, "\u8fd4\u56de\u8d2d\u4e70\u9875"

    const-string v4, "\u8fd4\u56de\u5e94\u7528"

    move-object v0, p0

    move v1, p1

    move-object v5, p0

    .line 479
    invoke-static/range {v0 .. v5}, Lcom/uc/paymentsdk/util/DialogUtil;->createTwoButtonsDialog(Landroid/content/Context;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 487
    :pswitch_18
    const-string v2, "\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\u5df2\u5220\u9664\uff0c\u5982\u9700\u8d2d\u4e70\u8bf7\u518d\u6b21\u53d1\u9001\u77ed\u4fe1\u6216\u91c7\u7528\u5176\u4ed6\u652f\u4ed8\u65b9\u5f0f\uff0c\u8c22\u8c22\uff01"

    const-string v3, "\u8fd4\u56de\u8d2d\u4e70\u9875"

    .line 488
    const-string v4, "\u8fd4\u56de\u5e94\u7528"

    move-object v0, p0

    move v1, p1

    move-object v5, p0

    .line 486
    invoke-static/range {v0 .. v5}, Lcom/uc/paymentsdk/util/DialogUtil;->createTwoButtonsDialog(Landroid/content/Context;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 491
    :pswitch_19
    const-string v0, "\u652f\u4ed8\u8d85\u65f6\uff0c\u70b9\u51fb\u786e\u5b9a\u91cd\u65b0\u9a8c\u8bc1\u652f\u4ed8\u7ed3\u679c\u3002\u6700\u591a \u9700\u89811\u5206\u949f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85..."

    .line 490
    invoke-static {p0, p1, v0, p0}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 493
    :pswitch_1a
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getPayedAmount()I

    move-result v6

    .line 494
    .local v6, "i":I
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/uc/paymentsdk/util/PrefUtil;->getPayedAmount(Landroid/content/Context;)I

    move-result v7

    .line 500
    .local v7, "j":I
    const-string v0, "\u60a8\u5df2\u7ecf\u652f\u4ed8\u8fc7\u3010%d\u3011\u5143\u77ed\u4fe1\uff0c\u73b0\u5728\u53d6\u6d88\u53d1\u9001\u5c06\u4e0d\u80fd\u6210\u529f\u8d2d\u4e70\u3010%s\u3011\u3002\u5982\u53d6\u6d88\u53d1\u9001\u5df2\u4ed8\u91d1\u989d\u4e0d\u4f1a\u8fd4\u8fd8\uff0c\u53ea\u80fd\u8ba1\u7b97\u5230\u60a8\u4e0b\u6b21\u8d2d\u4e70\u3010%s\u3011\u4e2d\u3002\u8bf7\u518d\u6b21\u786e\u8ba4\u662f\u5426\u53d6\u6d88\u8fd9\u6b21\u652f\u4ed8\uff1f"

    .line 501
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    add-int v2, v7, v6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    .line 502
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v2}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 503
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    invoke-virtual {v2}, Lcom/uc/paymentsdk/payment/PaymentInfo;->getPayname()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    .line 499
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 504
    const-string v3, "\u8fd4\u56de\u7ee7\u7eed\u652f\u4ed8"

    const-string v4, "\u786e\u8ba4\u53d6\u6d88"

    move-object v0, p0

    move v1, p1

    move-object v5, p0

    .line 496
    invoke-static/range {v0 .. v5}, Lcom/uc/paymentsdk/util/DialogUtil;->createTwoButtonsDialog(Landroid/content/Context;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 506
    .end local v6    # "i":I
    .end local v7    # "j":I
    :pswitch_1b
    const-string v0, "\u77ed\u4fe1\u53d1\u9001\u5931\u8d25"

    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 510
    :pswitch_1c
    const-string v0, "U\u70b9\u652f\u4ed8\u4e2d\uff0c\u8bf7\u7a0d\u5019..."

    .line 509
    invoke-static {p0, p1, v0, v4, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createIndeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 513
    :pswitch_1d
    const-string v0, "\u8bf7\u8f93\u5165\u8d26\u53f7\u548c\u5bc6\u7801\u3002"

    .line 512
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 516
    :pswitch_1e
    const-string v0, "\u5bc6\u7801\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u5bc6\u7801\u3002"

    .line 515
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 519
    :pswitch_1f
    const-string v0, "\u7528\u6237\u540d\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u7528\u6237\u540d\u3002"

    .line 518
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 522
    :pswitch_20
    const-string v0, "\u7528\u6237\u540d\u5fc5\u987b\u5927\u4e8e3\u4e2a\u5b57\u3002"

    .line 521
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 525
    :pswitch_21
    const-string v0, "\u7528\u6237\u540d\u5fc5\u987b\u5c0f\u4e8e17\u4e2a\u5b57\u3002"

    .line 524
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 527
    :pswitch_22
    const-string v0, "\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a\u3002"

    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 531
    :pswitch_23
    const-string v0, "\u767b\u5f55\u5931\u8d25\uff0c\u60a8\u7684\u5e10\u53f7\u548c\u5bc6\u7801\u4e0d\u5339\u914d\u3002"

    .line 530
    invoke-static {p0, p1, v0, v2}, Lcom/uc/paymentsdk/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/CharSequence;Lcom/uc/paymentsdk/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    .line 400
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_f
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_a
        :pswitch_d
        :pswitch_0
        :pswitch_e
        :pswitch_4
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_1b
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_2
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_1c
        :pswitch_c
        :pswitch_9
        :pswitch_b
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 1524
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1525
    iget-boolean v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsValid:Z

    if-eqz v0, :cond_0

    .line 1526
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/uc/paymentsdk/util/PrefUtil;->logout(Landroid/content/Context;)V

    .line 1527
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->clearSmsInfos()V

    .line 1528
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->clearUPointInfo()V

    .line 1529
    invoke-static {}, Lcom/uc/paymentsdk/model/TypeFactory;->clear()V

    .line 1530
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->clearUPointPayInfo()V

    .line 1531
    invoke-static {}, Lcom/uc/paymentsdk/network/chain/SyncChargeChannelHandler;->init()V

    .line 1532
    invoke-static {}, Lcom/uc/paymentsdk/network/chain/SyncPayChannelHandler;->init()V

    .line 1533
    invoke-static {}, Lcom/uc/paymentsdk/network/chain/SyncSmsInfoHandler;->init()V

    .line 1535
    :cond_0
    return-void
.end method

.method public onError(II)V
    .locals 5
    .param p1, "paramInt1"    # I
    .param p2, "paramInt2"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x6

    .line 1650
    sparse-switch p1, :sswitch_data_0

    .line 1693
    :goto_0
    return-void

    .line 1652
    :sswitch_0
    sparse-switch p2, :sswitch_data_1

    .line 1682
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1683
    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1684
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1654
    :sswitch_1
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1655
    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1656
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1659
    :sswitch_2
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1660
    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1661
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1662
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto :goto_0

    .line 1665
    :sswitch_3
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1666
    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1667
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1670
    :sswitch_4
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTimeoutCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTimeoutCounter:I

    .line 1671
    iget v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTimeoutCounter:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 1672
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mPaymentInfo:Lcom/uc/paymentsdk/payment/PaymentInfo;

    .line 1673
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    .line 1672
    invoke-static {v0, p0, v1, v2}, Lcom/uc/paymentsdk/network/Api;->pay(Landroid/content/Context;Lcom/uc/paymentsdk/network/ApiTask$TaskHandler;Lcom/uc/paymentsdk/payment/PaymentInfo;Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;)V

    goto :goto_0

    .line 1675
    :cond_0
    iput v4, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mTimeoutCounter:I

    .line 1676
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mBtnPay:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1677
    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1678
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1688
    :sswitch_5
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->dismissDialog(I)V

    .line 1689
    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1690
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto :goto_0

    .line 1650
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x12 -> :sswitch_5
    .end sparse-switch

    .line 1652
    :sswitch_data_1
    .sparse-switch
        -0x1 -> :sswitch_4
        0xdb -> :sswitch_2
        0x1a9 -> :sswitch_1
        0x1f4 -> :sswitch_3
    .end sparse-switch
.end method

.method public onFinish()V
    .locals 0

    .prologue
    .line 1744
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->fillData()V

    .line 1745
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .param p2, "paramView"    # Landroid/view/View;
    .param p3, "paramInt"    # I
    .param p4, "paramLong"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1698
    .local p1, "paramAdapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    if-nez p3, :cond_1

    .line 1707
    :cond_0
    :goto_0
    return-void

    .line 1701
    :cond_1
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v2

    check-cast v2, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v2}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    .line 1700
    check-cast v2, Lcom/uc/paymentsdk/commons/ui/CustomAdapter;

    .line 1701
    const/4 v3, 0x1

    sub-int v3, p3, v3

    invoke-virtual {v2, v3}, Lcom/uc/paymentsdk/commons/ui/CustomAdapter;->getItem(I)Lcom/uc/paymentsdk/model/IType;

    move-result-object v0

    .line 1702
    .local v0, "localIType":Lcom/uc/paymentsdk/model/IType;
    invoke-interface {v0}, Lcom/uc/paymentsdk/model/IType;->getId()Ljava/lang/String;

    move-result-object v1

    .line 1703
    .local v1, "str":Ljava/lang/String;
    const-string v2, "upoint"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1704
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPaymentView()V

    goto :goto_0

    .line 1705
    :cond_2
    const-string v2, "sms"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1706
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildSmsPaymentView()V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "paramInt"    # I
    .param p2, "paramKeyEvent"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v4, 0x1

    .line 1710
    packed-switch p1, :pswitch_data_0

    .line 1740
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    :goto_1
    return v2

    .line 1712
    :pswitch_0
    iget v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    packed-switch v2, :pswitch_data_1

    goto :goto_0

    .line 1714
    :pswitch_1
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    move v2, v4

    .line 1715
    goto :goto_1

    .line 1717
    :pswitch_2
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPaymentView()V

    move v2, v4

    .line 1718
    goto :goto_1

    .line 1720
    :pswitch_3
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPayLoginView()V

    move v2, v4

    .line 1721
    goto :goto_1

    .line 1723
    :pswitch_4
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-virtual {v2}, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->isNeedconfirm()Z

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mIsShowInfo:Z

    if-eqz v2, :cond_2

    .line 1724
    :cond_0
    invoke-static {}, Lcom/uc/paymentsdk/util/Utils;->getSmsPayment()I

    move-result v0

    .line 1725
    .local v0, "i":I
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    iget v2, v2, Lcom/uc/paymentsdk/payment/sms/SmsInfo;->money:I

    div-int v1, v0, v2

    .line 1726
    .local v1, "j":I
    iget v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 1727
    iget v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mLeftSmsToSendCount:I

    if-eq v2, v1, :cond_1

    .line 1728
    const/16 v2, 0x1b

    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .end local v0    # "i":I
    .end local v1    # "j":I
    :goto_2
    move v2, v4

    .line 1734
    goto :goto_1

    .line 1730
    .restart local v0    # "i":I
    .restart local v1    # "j":I
    :cond_1
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto :goto_2

    .line 1732
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_2
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto :goto_2

    .line 1736
    :pswitch_5
    const/16 v2, 0x17

    invoke-virtual {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    move v2, v4

    .line 1737
    goto :goto_1

    .line 1710
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch

    .line 1712
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public onPreHandle(ILorg/apache/http/HttpResponse;)Ljava/lang/Object;
    .locals 4
    .param p1, "paramInt"    # I
    .param p2, "paramHttpResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v3, 0x0

    .line 1626
    const/4 v2, 0x5

    if-eq v2, p1, :cond_0

    .line 1627
    const/16 v2, 0x8

    if-ne v2, p1, :cond_1

    .line 1628
    :cond_0
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 1646
    :goto_0
    return-object v2

    .line 1629
    :cond_1
    invoke-static {p1, p2}, Lcom/uc/paymentsdk/util/Utils;->getBodyString(ILorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v1

    .line 1630
    .local v1, "str":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v2, v3

    .line 1631
    goto :goto_0

    .line 1632
    :cond_2
    sparse-switch p1, :sswitch_data_0

    :goto_1
    move-object v2, v3

    .line 1646
    goto :goto_0

    .line 1635
    :sswitch_0
    :try_start_0
    invoke-static {v1}, Lcom/uc/paymentsdk/network/XMLParser;->parsePayOrder(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 1636
    :catch_0
    move-exception v0

    .line 1637
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1641
    .end local v0    # "e":Ljava/lang/Exception;
    :sswitch_1
    :try_start_1
    invoke-static {v1}, Lcom/uc/paymentsdk/network/XMLParser;->parseUPointInfo(Ljava/lang/String;)Lcom/uc/paymentsdk/payment/upoint/UPointInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_0

    .line 1642
    :catch_1
    move-exception v0

    .line 1643
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 1632
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x12 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1
    .param p1, "paramInt"    # I
    .param p2, "paramDialog"    # Landroid/app/Dialog;

    .prologue
    .line 394
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 395
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 396
    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    .line 397
    :cond_0
    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 10
    .param p1, "paramInt"    # I
    .param p2, "paramObject"    # Ljava/lang/Object;

    .prologue
    const/16 v8, -0x66

    const/4 v9, 0x7

    .line 1544
    sparse-switch p1, :sswitch_data_0

    .line 1623
    :cond_0
    :goto_0
    return-void

    .line 1546
    :sswitch_0
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 1547
    .local v4, "resultstr":Ljava/lang/String;
    const-string v7, "#"

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 1548
    .local v3, "resultarr":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 1549
    .local v5, "returncodeint":I
    const/4 v7, 0x1

    aget-object v1, v3, v7

    .line 1550
    .local v1, "errormsg":Ljava/lang/String;
    const/4 v7, 0x6

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->removeDialog(I)V

    .line 1551
    const/16 v7, -0x6e

    if-ne v5, v7, :cond_1

    .line 1552
    invoke-virtual {p0, v9}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1553
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    invoke-virtual {v7}, Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;->updateConsumeId()V

    goto :goto_0

    .line 1556
    :cond_1
    if-ne v5, v8, :cond_2

    const-string v7, "uc_tm_modify"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1557
    const/4 v7, 0x2

    aget-object v6, v3, v7

    .line 1558
    .local v6, "timestr":Ljava/lang/String;
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    invoke-virtual {v7, v6}, Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;->setTm(Ljava/lang/String;)V

    .line 1559
    const/16 v7, 0x24

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1562
    .end local v6    # "timestr":Ljava/lang/String;
    :cond_2
    if-gez v5, :cond_9

    .line 1563
    if-ne v5, v8, :cond_0

    .line 1564
    const-string v7, "uc_password_error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1565
    const/16 v7, 0x22

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1568
    :cond_3
    const-string v7, "um_account_error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1569
    const/4 v7, 0x5

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1572
    :cond_4
    const-string v7, "um_paypwd_error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 1573
    const/16 v7, 0x25

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1576
    :cond_5
    const-string v7, "um_paypwd_error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 1577
    iget v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_6

    .line 1578
    invoke-virtual {p0, v9}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1580
    :cond_6
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    invoke-virtual {v7}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 1582
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1583
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    .line 1584
    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1581
    invoke-static {v7, v8}, Lcom/uc/paymentsdk/util/PrefUtil;->setUCUserName(Landroid/content/Context;Ljava/lang/String;)V

    .line 1586
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1587
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    .line 1588
    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1585
    invoke-static {v7, v8}, Lcom/uc/paymentsdk/util/PrefUtil;->setUCUserPass(Landroid/content/Context;Ljava/lang/String;)V

    .line 1593
    :goto_1
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildUPointPayPassView()V

    goto/16 :goto_0

    .line 1590
    :cond_7
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/uc/paymentsdk/util/PrefUtil;->clearUCUserName(Landroid/content/Context;)V

    .line 1591
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/uc/paymentsdk/util/PrefUtil;->clearUCUserPass(Landroid/content/Context;)V

    goto :goto_1

    .line 1597
    :cond_8
    const-string v7, "um_system_error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1598
    invoke-virtual {p0, v9}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    .line 1599
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mUPayInfo:Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;

    invoke-virtual {v7}, Lcom/uc/paymentsdk/payment/upoint/UPointPayInfo;->updateConsumeId()V

    goto/16 :goto_0

    .line 1604
    :cond_9
    iget-object v7, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtSavePass:Landroid/widget/CheckBox;

    invoke-virtual {v7}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 1605
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1606
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtUsername:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1605
    invoke-static {v7, v8}, Lcom/uc/paymentsdk/util/PrefUtil;->setUCUserName(Landroid/content/Context;Ljava/lang/String;)V

    .line 1607
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1608
    iget-object v8, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mEtPassword:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1607
    invoke-static {v7, v8}, Lcom/uc/paymentsdk/util/PrefUtil;->setUCUserPass(Landroid/content/Context;Ljava/lang/String;)V

    .line 1613
    :goto_2
    const/16 v7, 0xd

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto/16 :goto_0

    .line 1610
    :cond_a
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/uc/paymentsdk/util/PrefUtil;->clearUCUserName(Landroid/content/Context;)V

    .line 1611
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/uc/paymentsdk/util/PrefUtil;->clearUCUserPass(Landroid/content/Context;)V

    goto :goto_2

    .line 1618
    .end local v1    # "errormsg":Ljava/lang/String;
    .end local v3    # "resultarr":[Ljava/lang/String;
    .end local v4    # "resultstr":Ljava/lang/String;
    .end local v5    # "returncodeint":I
    :sswitch_1
    move-object v0, p2

    check-cast v0, Lcom/uc/paymentsdk/payment/upoint/UPointInfo;

    move-object v2, v0

    .line 1619
    .local v2, "info":Lcom/uc/paymentsdk/payment/upoint/UPointInfo;
    invoke-direct {p0, v2}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->initUPointPayView(Lcom/uc/paymentsdk/payment/upoint/UPointInfo;)V

    .line 1620
    invoke-static {v2}, Lcom/uc/paymentsdk/util/Utils;->setUPointInfo(Lcom/uc/paymentsdk/payment/upoint/UPointInfo;)V

    .line 1621
    const/16 v7, 0xe

    invoke-virtual {p0, v7}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->dismissDialog(I)V

    goto/16 :goto_0

    .line 1544
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x12 -> :sswitch_1
    .end sparse-switch
.end method

.method public onWarningDialogCancel(I)V
    .locals 2
    .param p1, "paramInt"    # I

    .prologue
    .line 1482
    packed-switch p1, :pswitch_data_0

    .line 1510
    :goto_0
    :pswitch_0
    return-void

    .line 1487
    :pswitch_1
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 1488
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1489
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1490
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1492
    :try_start_0
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1496
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->finish()V

    goto :goto_0

    .line 1499
    :pswitch_2
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 1500
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1501
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1502
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1504
    :try_start_1
    iget-object v0, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1508
    :cond_1
    :goto_2
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto :goto_0

    .line 1505
    :catch_0
    move-exception v0

    goto :goto_2

    .line 1493
    :catch_1
    move-exception v0

    goto :goto_1

    .line 1482
    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onWarningDialogOK(I)V
    .locals 3
    .param p1, "paramInt"    # I

    .prologue
    .line 1417
    sparse-switch p1, :sswitch_data_0

    .line 1479
    :goto_0
    return-void

    .line 1419
    :sswitch_0
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->pay()V

    goto :goto_0

    .line 1422
    :sswitch_1
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->pay()V

    goto :goto_0

    .line 1425
    :sswitch_2
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/uc/paymentsdk/util/PrefUtil;->clearPayedAmount(Landroid/content/Context;)V

    .line 1427
    :sswitch_3
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1428
    .local v0, "localIntent":Landroid/content/Intent;
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->setResult(ILandroid/content/Intent;)V

    .line 1429
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->finish()V

    goto :goto_0

    .line 1434
    .end local v0    # "localIntent":Landroid/content/Intent;
    :sswitch_4
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->finish()V

    goto :goto_0

    .line 1438
    :sswitch_5
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 1439
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsHander:Landroid/os/Handler;

    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1440
    :cond_0
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    if-eqz v1, :cond_1

    .line 1441
    invoke-virtual {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1442
    iget-object v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsContent:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1444
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1450
    :goto_1
    :sswitch_6
    invoke-direct {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->buildPaymentView()V

    goto :goto_0

    .line 1453
    :sswitch_7
    const/16 v1, 0x18

    invoke-virtual {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->showDialog(I)V

    goto :goto_0

    .line 1456
    :sswitch_8
    const/4 v1, 0x4

    iget v2, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mType:I

    if-ne v1, v2, :cond_2

    .line 1457
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mSmsInfo:Lcom/uc/paymentsdk/payment/sms/SmsInfo;

    invoke-direct {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->sendFirstSms(Lcom/uc/paymentsdk/payment/sms/SmsInfo;)V

    goto :goto_0

    .line 1459
    :cond_2
    iget-object v1, p0, Lcom/uc/paymentsdk/payment/PaymentsActivity;->mConfirmSmsInfoString:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->sendConfirmSms(Ljava/lang/String;)V

    goto :goto_0

    .line 1445
    :catch_0
    move-exception v1

    goto :goto_1

    .line 1417
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_4
        0x1 -> :sswitch_4
        0xa -> :sswitch_0
        0xd -> :sswitch_3
        0xf -> :sswitch_6
        0x10 -> :sswitch_6
        0x14 -> :sswitch_2
        0x15 -> :sswitch_5
        0x16 -> :sswitch_4
        0x17 -> :sswitch_7
        0x18 -> :sswitch_6
        0x19 -> :sswitch_5
        0x1a -> :sswitch_8
        0x24 -> :sswitch_1
    .end sparse-switch
.end method
