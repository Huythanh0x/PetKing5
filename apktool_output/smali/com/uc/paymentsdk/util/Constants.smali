.class public Lcom/uc/paymentsdk/util/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field public static final ACTION_ARRIVE_PAY_POINT:I = 0x9

.field public static final ACTION_CHARGE_PHONECARD:I = 0xa

.field public static final ACTION_CHECK_USERNAME:I = 0x2

.field public static final ACTION_CONFIRM_PAY_RESULT:I = 0x5

.field public static final ACTION_LOGIN:I = 0x0

.field public static final ACTION_PAY:I = 0x3

.field public static final ACTION_PAY_PAYPASS:I = 0x4

.field public static final ACTION_POST_SMS_PAYMENT:I = 0x8

.field public static final ACTION_QUERY_CHARGE_CHANNEL:I = 0x11

.field public static final ACTION_QUERY_CHARGE_PHONECARD_RESULT:I = 0xc

.field public static final ACTION_QUERY_PAY_CHANNEL:I = 0x6

.field public static final ACTION_QUERY_UPOINT_DISCOUNT:I = 0x12

.field public static final ACTION_REGISTER:I = 0x1

.field public static final ACTION_SYNC_CARD_INFO:I = 0xb

.field public static final ACTION_SYNC_SMS_INFO:I = 0x7

.field public static final API_URLS:[Ljava/lang/String;

.field public static final APPKEY:Ljava/lang/String; = "ucgame_appkey"

.field public static final CHARGEMENT_DEFAULT:I = 0xa

.field public static final CHARGE_ALIPAY_INPUT_LENGTH_MAX:I

.field public static final CHARGE_G_INPUT_LENGTH_MAX:I

.field public static final CHARGE_QUERY_RESULT_TIME:J = 0xbb8L

.field public static final CODE_KEY_PAY_AND_ACCOUNT:Ljava/lang/String; = "sdk_mappn_201008"

.field public static final COLOR_CHARGE_CHANGE_TYPE:I = -0x9444ff

.field public static final COLOR_ERROR_BACKGROUND:I = -0x6b371c

.field public static final COLOR_LINK_TEXT:I = -0x6000

.field public static final COLOR_LISTVIEW_ITEM_BACKGROUND:I = -0xf0506

.field public static final COLOR_PRESSED:I = -0x4c00

.field public static final COLOR_SUBTITLE_BACKGROUND1:I

.field public static final COLOR_SUBTITLE_BACKGROUND2:I

.field public static final COLOR_TITLE_BACKGROUND:I

.field public static final CPID:Ljava/lang/String; = "ucgame_cpid"

.field public static final CPID_PATTERN:Ljava/lang/String; = "^[0-9a-zA-Z]{1,10}$"

.field public static final CUSTOM_TEXTVIEW_HEIGHT:I = 0x35

.field public static final CUSTOM_TEXTVIEW_HEIGHT_HDPI:I = 0x50

.field public static final DEBUG:Z = false

.field public static final EMAIL_ADDRESS_PATTERN:Ljava/lang/String; = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$"

.field public static final ERROR_ACCOUNT_APPKEY_WRONG:Ljava/lang/String; = "appkey\u4e0d\u5b58\u5728\u6216\u65e0\u6548"

.field public static final ERROR_ACCOUNT_ARG_OUT_OF_SCROPE:Ljava/lang/String; = "\u66f4\u6539\u6570\u503c\u8d85\u51fa\u8303\u56f4"

.field public static final ERROR_ACCOUNT_CHANEL_NOT_EXIST:Ljava/lang/String; = "\u6e20\u9053\u4e0d\u5b58\u5728\u6216\u6e20\u9053\u65e0\u6548"

.field public static final ERROR_ACCOUNT_EMAIL_HAVE_EXIST:Ljava/lang/String; = "email\u5df2\u5b58\u5728"

.field public static final ERROR_ACCOUNT_EMAIL_WRONG_FORMAT:Ljava/lang/String; = "email\u683c\u5f0f\u6709\u8bef"

.field public static final ERROR_ACCOUNT_NETWORK:Ljava/lang/String; = "\u62b1\u6b49\uff0c\u7f51\u7edc\u8fde\u63a5\u9519\u8bef"

.field public static final ERROR_ACCOUNT_PARSER:Ljava/lang/String; = "\u62b1\u6b49\uff0c\u670d\u52a1\u7aef\u5f02\u5e38"

.field public static final ERROR_ACCOUNT_PASSWORD:Ljava/lang/String; = "\u5bc6\u7801\u9519\u8bef"

.field public static final ERROR_ACCOUNT_PASSWORD_INVALIDATE:Ljava/lang/String; = "\u6ce8\u518c\u5bc6\u7801\u4e0d\u5408\u6cd5"

.field public static final ERROR_ACCOUNT_REQUEST_DECODE_FAILED:Ljava/lang/String; = "\u8bf7\u6c42\u89e3\u7801\u5931\u8d25"

.field public static final ERROR_ACCOUNT_UNKNOWN:Ljava/lang/String; = "\u62b1\u6b49\uff0c\u672a\u77e5\u670d\u52a1\u5668\u7aef\u9519\u8bef"

.field public static final ERROR_ACCOUNT_USERAGENT_PARAM_EMPTY:Ljava/lang/String; = "userAgent\u53c2\u6570\u4e3a\u7a7a\u6216\u53c2\u6570\u4e0d\u5b8c\u6574"

.field public static final ERROR_ACCOUNT_USERNAME_HAVE_EXIST:Ljava/lang/String; = "\u7528\u6237\u540d\u5df2\u5b58\u5728"

.field public static final ERROR_ACCOUNT_USERNAME_INVALIDATE:Ljava/lang/String; = "\u7528\u6237\u540d\u4e0d\u80fd\u4e3a\u7eaf\u6570\u5b57\u6216\u90ae\u7bb1\u8d26\u53f7"

.field public static final ERROR_ACCOUNT_USERNAME_NOT_EXIST:Ljava/lang/String; = "\u7528\u6237\u540d\u4e0d\u5b58\u5728"

.field public static final ERROR_ACCOUNT_XML_PARSE_FAILED:Ljava/lang/String; = "xml\u89e3\u6790\u9519\u8bef\u6216\u8005\u5bc6\u94a5\u4e0d\u6b63\u786e"

.field public static final ERROR_ACCOUNT_XML_PARSE_FAILED2:Ljava/lang/String; = "xml\u4e2d\u53c2\u6570\u7f3a\u5931\u6216\u53c2\u6570\u7c7b\u578b\u9519\u8bef"

.field public static final ERROR_CODE_APPKEY_WRONG:I = 0x1aa

.field public static final ERROR_CODE_ARG_OUT_OF_SCROPE:I = 0x1a9

.field public static final ERROR_CODE_CHANEL_NOT_EXIST:I = 0x1a8

.field public static final ERROR_CODE_EMAIL_HAVE_EXIST:I = 0xd8

.field public static final ERROR_CODE_EMAIL_WRONG_FORMAT:I = 0xd7

.field public static final ERROR_CODE_INSUFFICIENT_BALANCE:I = 0xdb

.field public static final ERROR_CODE_NETWORK:I = -0x1

.field public static final ERROR_CODE_PARSER:I = -0x2

.field public static final ERROR_CODE_PASSWORD_INVALIDATE:I = 0xd9

.field public static final ERROR_CODE_PASSWORD_WRONG:I = 0xd4

.field public static final ERROR_CODE_PAY_FAILED:I = 0xda

.field public static final ERROR_CODE_REQUEST_DECODE_FAILED:I = 0x1ab

.field public static final ERROR_CODE_UNKNOWN:I = 0x1f4

.field public static final ERROR_CODE_USERAGENT_PARAM_EMPTY:I = 0x1a5

.field public static final ERROR_CODE_USERNAME_HAVE_EXIST:I = 0xd6

.field public static final ERROR_CODE_USERNAME_INVALIDATE:I = 0xd5

.field public static final ERROR_CODE_USERNAME_NOT_EXIST:I = 0xd3

.field public static final ERROR_CODE_XML_PARSE_FAILED:I = 0x1a6

.field public static final ERROR_CODE_XML_PARSE_FAILED2:I = 0x1a7

.field public static final ERROR_INVALID_ACCOUNT:Ljava/lang/String; = "\u7528\u6237\u540d\u6216\u5bc6\u7801\u9519\u8bef\u3002"

.field public static final ERROR_NETWORK_FAILED:Ljava/lang/String; = "\u8bf7\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u540e\u91cd\u65b0\u518d\u8bd5\u3002"

.field public static final ERROR_PASSWORD_IS_EMPTY:Ljava/lang/String; = "\u5bc6\u7801\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u5bc6\u7801\u3002"

.field public static final ERROR_PASSWORD_OR_USERNAME_IS_EMPTY:Ljava/lang/String; = "\u8bf7\u8f93\u5165\u8d26\u53f7\u548c\u5bc6\u7801\u3002"

.field public static final ERROR_REGISTER_EMAIL_IS_EMPTY:Ljava/lang/String; = "\u90ae\u7bb1\u4e0d\u80fd\u4e3a\u7a7a\u3002"

.field public static final ERROR_REGISTER_EMAIL_IS_WRONG:Ljava/lang/String; = "\u975e\u6cd5\u7684\u90ae\u4ef6\u683c\u5f0f\u3002"

.field public static final ERROR_REGISTER_PASSWORD2_WRONG:Ljava/lang/String; = "\u786e\u8ba4\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a\u3002"

.field public static final ERROR_REGISTER_PASSWORD_AND_PASSWORD_WRONG:Ljava/lang/String; = "\u60a8\u8f93\u5165\u7684\u4e24\u6b21\u5bc6\u7801\u4e0d\u4e00\u81f4\uff0c\u8bf7\u68c0\u67e5\u3002"

.field public static final ERROR_REGISTER_PASSWORD_WRONG:Ljava/lang/String; = "\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a\u3002"

.field public static final ERROR_REGISTER_UNSERNAME_WRONG2:Ljava/lang/String; = "\u7528\u6237\u540d\u5fc5\u987b\u5c0f\u4e8e17\u4e2a\u5b57\u3002"

.field public static final ERROR_REGISTER_USERNAME_NOT_ALL_NUMBER:Ljava/lang/String; = "\u7528\u6237\u540d\u4e0d\u80fd\u4f7f\u7528\u7eaf\u6570\u5b57"

.field public static final ERROR_REGISTER_USERNAME_NOT_EMAIL:Ljava/lang/String; = "\u7528\u6237\u540d\u4e0d\u80fd\u4f7f\u7528\u90ae\u7bb1"

.field public static final ERROR_REGISTER_USERNAME_WRONG:Ljava/lang/String; = "\u7528\u6237\u540d\u5fc5\u987b\u5927\u4e8e3\u4e2a\u5b57\u3002"

.field public static final ERROR_START_APPKEY_INVALID:Ljava/lang/String; = "\u8be5\u5e94\u7528\u7684\u652f\u4ed8KEY\u65e0\u6548\uff0c\u4e0d\u80fd\u6210\u529f\u652f\u4ed8\u3002"

.field public static final ERROR_START_CPID_INVALID:Ljava/lang/String; = "CPID\u4e3a\u5b57\u7b26\u4e32\u548c\u6570\u5b57\u4efb\u610f\u7ec4\u5408\uff0c\u4e0d\u80fd\u7531\u4e2d\u6587\u5b57\u7b26\u3001\u6807\u70b9\u7b26\u53f7\u6216\u7a7a\u683c\uff0c\u957f\u5ea6\u4e0d\u8d85\u8fc710\u4e2a\u82f1\u6587\u5b57\u7b26\u3002"

.field public static final ERROR_TIMEOUT:I = 0x1

.field public static final ERROR_TITLE:Ljava/lang/String; = "\u53d1\u751f\u9519\u8bef"

.field public static final ERROR_TYPE_NOT_SUPPORTED:Ljava/lang/String; = "type not supported."

.field public static final ERROR_UNKNOWN:I = -0x3

.field public static final ERROR_USERNAME_IS_EMPTY:Ljava/lang/String; = "\u7528\u6237\u540d\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u7528\u6237\u540d\u3002"

.field public static final EXTRA_ERROR:Ljava/lang/String; = "error"

.field public static final EXTRA_FROM_CHARGE:Ljava/lang/String; = "fromCharge"

.field public static final EXTRA_G_BALANCE:Ljava/lang/String; = "g_balance"

.field public static final EXTRA_JIFENGQUAN_BALANCE:Ljava/lang/String; = "jifengquan_balance"

.field public static final GET:Ljava/lang/String; = "get"

.field public static final HOST:Ljava/lang/String; = "http://g2.uc.cn"

.field public static final HOST_PAY:Ljava/lang/String; = "http://g2.uc.cn/ucgame/charge/"

.field public static final JIFENGQUAN_G_RATIO:I = 0x3c

.field public static final PAYMENT_DESC_LENGTH_MAX:I = 0x64

.field public static final PAYMENT_JIFENGQUAN_MAX:I = 0x2710

.field public static final PAYMENT_JIFENGQUAN_MIN:I = 0x0

.field public static final PAYMENT_MAX:I = 0x3e8

.field public static final PAYMENT_MIN:I = 0x0

.field public static final PAYMENT_NAME_LENGTH_MAX:I = 0x32

.field public static final PAYMENT_SMS_PAYNAME_BYTE_LENGTH_MAX:I = 0x18

.field public static final POST:Ljava/lang/String; = "post"

.field public static final REGIST_NAME_MAX_LENGTH:I = 0x10

.field public static final REGIST_NAME_MIN_LENGTH:I = 0x3

.field public static final RENMINBI_JIFENGQUAN_RATIO:I = 0xa

.field public static final RENMINBI_SMS_RATIO:I = 0x2

.field public static final RES_ALIPAY:Ljava/lang/String; = "alipay.png"

.field public static final RES_ALIPAY_HDPI:Ljava/lang/String; = "alipay_hdpi.png"

.field public static final RES_ALIPAY_PLUGIN_APK:Ljava/lang/String; = "alipay_plugin.apk"

.field public static final RES_LIST_ITEM_MORE_ICON:Ljava/lang/String; = "more.png"

.field public static final RES_LOCK:Ljava/lang/String; = "lock.png"

.field public static final RES_LOCK_HDPI:Ljava/lang/String; = "lock_hdpi.png"

.field public static final RES_TYPE_ALIPAY_ICON:Ljava/lang/String; = "alipay_logo.png"

.field public static final RES_TYPE_ALIPAY_ICON_HDPI:Ljava/lang/String; = "alipay_logo_hdpi.png"

.field public static final RES_TYPE_GFAN_ICON:Ljava/lang/String; = "gfan_logo.png"

.field public static final RES_TYPE_GFAN_ICON_HDPI:Ljava/lang/String; = "gfan_logo_hdpi.png"

.field public static final RES_TYPE_G_ICON:Ljava/lang/String; = "g_logo.png"

.field public static final RES_TYPE_G_ICON_HDPI:Ljava/lang/String; = "g_logo_hdpi.png"

.field public static final RES_TYPE_PHONECARD_ICON:Ljava/lang/String; = "phonecard_logo.png"

.field public static final RES_TYPE_PHONECARD_ICON_HDPI:Ljava/lang/String; = "phonecard_logo_hdpi.png"

.field public static final RES_TYPE_SMS_ICON:Ljava/lang/String; = "sms_logo.png"

.field public static final RES_TYPE_SMS_ICON_HDPI:Ljava/lang/String; = "sms_logo_hdpi.png"

.field public static final SMS_INFO_BEFORE_SEND_BEIWEI:Ljava/lang/String; = "\u63d0\u793a\uff1a\u60a8\u5c06\u9009\u62e9\u4f7f\u7528\u7531\u5317\u4eac\u5317\u7eac\u901a\u4fe1\u79d1\u6280\u80a1\u4efd\u6709\u9650\u516c\u53f8\u63d0\u4f9b\u7684\u77ed\u4fe1\u4e92\u52a8\u4e1a\u52a1\uff0c\u4fe1\u606f\u8d391\u5143/\u6761\uff0c\u7ee7\u7eed\u70b9\u64ad\u5f00\u59cb\u4eab\u53d7\u670d\u52a1\uff0c\u8fd4\u56de\u5219\u4e0d\u6263\u8d39\u3002\u5ba2\u670d\u7535\u8bdd\uff1a4007361098"

.field public static final SMS_SUCCESS:Ljava/lang/String; = "success"

.field public static final TERM:Ljava/lang/String; = ","

.field public static final TEXT_BACK_TO_PAY:Ljava/lang/String; = "\u8fd4\u56de\u7ee7\u7eed\u652f\u4ed8"

.field public static final TEXT_BACK_TO_PAYPOINT:Ljava/lang/String; = "\u8fd4\u56de\u8d2d\u4e70\u9875"

.field public static final TEXT_CHARGE_TITLE_LENGTH_MAX:I = 0x7

.field public static final TEXT_CONFIRM_TO_CANCEL:Ljava/lang/String; = "\u786e\u8ba4\u53d6\u6d88"

.field public static final TEXT_DELETE:Ljava/lang/String; = "\u5220\u9664"

.field public static final TEXT_EXIT:Ljava/lang/String; = "\u8fd4\u56de\u5e94\u7528"

.field public static final TEXT_INSUFFENT_BALANCE:Ljava/lang/String; = "\u4f59\u989d\u4e0d\u8db3"

.field public static final TEXT_INSUFFENT_BALANCE2:Ljava/lang/String; = "\u6b20\u8d39"

.field public static final TEXT_NOT_DELETE:Ljava/lang/String; = "\u4e0d\u5220"

.field public static final TEXT_PAY_SMS_BACK_CONFIRM:Ljava/lang/String; = "\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\u672a\u5220\u9664\uff0c\u5982\u9700\u8d2d\u4e70\u8bf7\u518d\u6b21\u53d1\u9001\u77ed\u4fe1\u6216\u91c7\u7528\u5176\u4ed6\u652f\u4ed8\u65b9\u5f0f\uff0c<font color=\'red\'>\u8bf7\u52ff\u5230\u77ed\u4fe1\u6536\u4ef6\u7bb1\u8fdb\u884c\u56de\u590d</font>\uff0c\u8c22\u8c22\uff01"

.field public static final TEXT_PAY_SMS_CHANCEL_CONFIRM:Ljava/lang/String; = "\u60a8\u5df2\u7ecf\u652f\u4ed8\u8fc7\u3010%d\u3011\u5143\u77ed\u4fe1\uff0c\u73b0\u5728\u53d6\u6d88\u53d1\u9001\u5c06\u4e0d\u80fd\u6210\u529f\u8d2d\u4e70\u3010%s\u3011\u3002\u5982\u53d6\u6d88\u53d1\u9001\u5df2\u4ed8\u91d1\u989d\u4e0d\u4f1a\u8fd4\u8fd8\uff0c\u53ea\u80fd\u8ba1\u7b97\u5230\u60a8\u4e0b\u6b21\u8d2d\u4e70\u3010%s\u3011\u4e2d\u3002\u8bf7\u518d\u6b21\u786e\u8ba4\u662f\u5426\u53d6\u6d88\u8fd9\u6b21\u652f\u4ed8\uff1f"

.field public static final TEXT_PAY_SMS_CONFIRM_INDEXOF:Ljava/lang/String; = "\uff0c"

.field public static final TEXT_PAY_SMS_CONFRIM_RESULT_CONTAIN:Ljava/lang/String; = "\u901a\u4fe1\u8d26\u6237\u652f\u4ed8"

.field public static final TEXT_PAY_SMS_CONFRIM_START_WITH:Ljava/lang/String; = "\u786e\u8ba4\u652f\u4ed8\u8bf7\u56de\u590d\u6570\u5b57"

.field public static final TEXT_PAY_SMS_CONFRIM_SUPPORTTEL_START_WITH:Ljava/lang/String; = "\u5143\u3002\u5ba2\u670d"

.field public static final TEXT_PAY_SMS_DELETE_BACK_CONFIRM:Ljava/lang/String; = "\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\u5df2\u5220\u9664\uff0c\u5982\u9700\u8d2d\u4e70\u8bf7\u518d\u6b21\u53d1\u9001\u77ed\u4fe1\u6216\u91c7\u7528\u5176\u4ed6\u652f\u4ed8\u65b9\u5f0f\uff0c\u8c22\u8c22\uff01"

.field public static final TEXT_PAY_SMS_DELETE_CONFIRM:Ljava/lang/String; = "\u60a8\u5df2\u7ecf\u53d6\u6d88\u4e86\u8d2d\u4e70\uff0c\u5c06\u4e0d\u4f1a\u83b7\u5f97\u76f8\u5e94\u5185\u5bb9\u3002\u662f\u5426\u5220\u9664\u521a\u6536\u5230\u7684\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\uff1f\u5982\u679c\u4e0d\u5220\u9664\u8bf7\u52ff\u5230\u77ed\u4fe1\u6536\u4ef6\u7bb1\u8fdb\u884c\u56de\u590d\u3002"

.field public static final TEXT_PAY_SMS_FAILED:Ljava/lang/String; = "\u77ed\u4fe1\u652f\u4ed8\u5931\u8d25"

.field public static final TEXT_PAY_SMS_FAILED_INSUFFENT_BALANCE:Ljava/lang/String; = "\u4f59\u989d\u4e0d\u8db3\uff0c\u652f\u4ed8\u5931\u8d25"

.field public static final TEXT_SIZE:I = 0x10

.field public static final VERSION:Ljava/lang/String; = "2.3.2"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 27
    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http://g2.uc.cn/ucgame/charge/login"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 28
    const-string v2, "http://g2.uc.cn/ucgame/charge/register"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 29
    const-string v2, "http://g2.uc.cn/ucgame/charge/check_username"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 30
    const-string v2, "http://g2.uc.cn/ucgame/charge/charge_umoney"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 31
    const-string v2, "http://g2.uc.cn/ucgame/charge/charge_umoney"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 32
    const-string v2, "http://g2.uc.cn/ucgame/charge/sdkConfirm"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 33
    const-string v2, "http://g2.uc.cn/ucgame/charge/getPayType"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 34
    const-string v2, "http://g2.uc.cn/ucgame/charge/update_sms"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 35
    const-string v2, "http://g2.uc.cn/ucgame/charge/getClientMessagePay"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 36
    const-string v2, "http://g2.uc.cn/ucgame/charge/sdkPayPointArrive"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 37
    const-string v2, "http://g2.uc.cn/ucgame/charge/rechargeRequest"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 38
    const-string v2, "http://g2.uc.cn/ucgame/charge/getCardConfigServlet"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 39
    const-string v2, "http://g2.uc.cn/ucgame/charge/queryServlet"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 40
    const-string v2, "http://g2.uc.cn/ucgame/charge/businessProcess.do"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 41
    const-string v2, "http://g2.uc.cn/ucgame/charge/businessProcess.do"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 42
    const-string v2, "http://g2.uc.cn/ucgame/charge/businessProcess.do"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 43
    const-string v2, "http://g2.uc.cn/ucgame/charge/businessProcess.do"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 44
    const-string v2, "http://g2.uc.cn/ucgame/charge/businessProcess"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 45
    const-string v2, "http://g2.uc.cn/ucgame/charge/gain_discount"

    aput-object v2, v0, v1

    .line 27
    sput-object v0, Lcom/uc/paymentsdk/util/Constants;->API_URLS:[Ljava/lang/String;

    .line 47
    const-string v0, "#FF8B4B3C"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/uc/paymentsdk/util/Constants;->COLOR_TITLE_BACKGROUND:I

    .line 48
    const-string v0, "#FFFFB546"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/uc/paymentsdk/util/Constants;->COLOR_SUBTITLE_BACKGROUND1:I

    .line 49
    const-string v0, "#FFFF6633"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/uc/paymentsdk/util/Constants;->COLOR_SUBTITLE_BACKGROUND2:I

    .line 70
    const-wide v0, 0x40c3880000000000L    # 10000.0

    invoke-static {v0, v1}, Ljava/lang/Math;->log10(D)D

    move-result-wide v0

    double-to-int v0, v0

    sput v0, Lcom/uc/paymentsdk/util/Constants;->CHARGE_ALIPAY_INPUT_LENGTH_MAX:I

    .line 71
    sget v0, Lcom/uc/paymentsdk/util/Constants;->CHARGE_ALIPAY_INPUT_LENGTH_MAX:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/uc/paymentsdk/util/Constants;->CHARGE_G_INPUT_LENGTH_MAX:I

    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
