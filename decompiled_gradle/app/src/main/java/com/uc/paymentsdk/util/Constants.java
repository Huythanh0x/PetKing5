package com.uc.paymentsdk.util;

import android.graphics.Color;

public class Constants {
    public static final int ACTION_ARRIVE_PAY_POINT = 9;
    public static final int ACTION_CHARGE_PHONECARD = 10;
    public static final int ACTION_CHECK_USERNAME = 2;
    public static final int ACTION_CONFIRM_PAY_RESULT = 5;
    public static final int ACTION_LOGIN = 0;
    public static final int ACTION_PAY = 3;
    public static final int ACTION_PAY_PAYPASS = 4;
    public static final int ACTION_POST_SMS_PAYMENT = 8;
    public static final int ACTION_QUERY_CHARGE_CHANNEL = 17;
    public static final int ACTION_QUERY_CHARGE_PHONECARD_RESULT = 12;
    public static final int ACTION_QUERY_PAY_CHANNEL = 6;
    public static final int ACTION_QUERY_UPOINT_DISCOUNT = 18;
    public static final int ACTION_REGISTER = 1;
    public static final int ACTION_SYNC_CARD_INFO = 11;
    public static final int ACTION_SYNC_SMS_INFO = 7;
    public static final String APPKEY = "ucgame_appkey";
    public static final int CHARGEMENT_DEFAULT = 10;
    public static final long CHARGE_QUERY_RESULT_TIME = 3000;
    public static final String CODE_KEY_PAY_AND_ACCOUNT = "sdk_mappn_201008";
    public static final int COLOR_CHARGE_CHANGE_TYPE = -9716991;
    public static final int COLOR_ERROR_BACKGROUND = -7026460;
    public static final int COLOR_LINK_TEXT = -24576;
    public static final int COLOR_LISTVIEW_ITEM_BACKGROUND = -984326;
    public static final int COLOR_PRESSED = -19456;
    public static final String CPID = "ucgame_cpid";
    public static final String CPID_PATTERN = "^[0-9a-zA-Z]{1,10}$";
    public static final int CUSTOM_TEXTVIEW_HEIGHT = 53;
    public static final int CUSTOM_TEXTVIEW_HEIGHT_HDPI = 80;
    public static final boolean DEBUG = false;
    public static final String EMAIL_ADDRESS_PATTERN = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    public static final String ERROR_ACCOUNT_APPKEY_WRONG = "appkey\u4e0d\u5b58\u5728\u6216\u65e0\u6548";
    public static final String ERROR_ACCOUNT_ARG_OUT_OF_SCROPE = "\u66f4\u6539\u6570\u503c\u8d85\u51fa\u8303\u56f4";
    public static final String ERROR_ACCOUNT_CHANEL_NOT_EXIST = "\u6e20\u9053\u4e0d\u5b58\u5728\u6216\u6e20\u9053\u65e0\u6548";
    public static final String ERROR_ACCOUNT_EMAIL_HAVE_EXIST = "email\u5df2\u5b58\u5728";
    public static final String ERROR_ACCOUNT_EMAIL_WRONG_FORMAT = "email\u683c\u5f0f\u6709\u8bef";
    public static final String ERROR_ACCOUNT_NETWORK = "\u62b1\u6b49\uff0c\u7f51\u7edc\u8fde\u63a5\u9519\u8bef";
    public static final String ERROR_ACCOUNT_PARSER = "\u62b1\u6b49\uff0c\u670d\u52a1\u7aef\u5f02\u5e38";
    public static final String ERROR_ACCOUNT_PASSWORD = "\u5bc6\u7801\u9519\u8bef";
    public static final String ERROR_ACCOUNT_PASSWORD_INVALIDATE = "\u6ce8\u518c\u5bc6\u7801\u4e0d\u5408\u6cd5";
    public static final String ERROR_ACCOUNT_REQUEST_DECODE_FAILED = "\u8bf7\u6c42\u89e3\u7801\u5931\u8d25";
    public static final String ERROR_ACCOUNT_UNKNOWN = "\u62b1\u6b49\uff0c\u672a\u77e5\u670d\u52a1\u5668\u7aef\u9519\u8bef";
    public static final String ERROR_ACCOUNT_USERAGENT_PARAM_EMPTY = "userAgent\u53c2\u6570\u4e3a\u7a7a\u6216\u53c2\u6570\u4e0d\u5b8c\u6574";
    public static final String ERROR_ACCOUNT_USERNAME_HAVE_EXIST = "\u7528\u6237\u540d\u5df2\u5b58\u5728";
    public static final String ERROR_ACCOUNT_USERNAME_INVALIDATE = "\u7528\u6237\u540d\u4e0d\u80fd\u4e3a\u7eaf\u6570\u5b57\u6216\u90ae\u7bb1\u8d26\u53f7";
    public static final String ERROR_ACCOUNT_USERNAME_NOT_EXIST = "\u7528\u6237\u540d\u4e0d\u5b58\u5728";
    public static final String ERROR_ACCOUNT_XML_PARSE_FAILED = "xml\u89e3\u6790\u9519\u8bef\u6216\u8005\u5bc6\u94a5\u4e0d\u6b63\u786e";
    public static final String ERROR_ACCOUNT_XML_PARSE_FAILED2 = "xml\u4e2d\u53c2\u6570\u7f3a\u5931\u6216\u53c2\u6570\u7c7b\u578b\u9519\u8bef";
    public static final int ERROR_CODE_APPKEY_WRONG = 426;
    public static final int ERROR_CODE_ARG_OUT_OF_SCROPE = 425;
    public static final int ERROR_CODE_CHANEL_NOT_EXIST = 424;
    public static final int ERROR_CODE_EMAIL_HAVE_EXIST = 216;
    public static final int ERROR_CODE_EMAIL_WRONG_FORMAT = 215;
    public static final int ERROR_CODE_INSUFFICIENT_BALANCE = 219;
    public static final int ERROR_CODE_NETWORK = -1;
    public static final int ERROR_CODE_PARSER = -2;
    public static final int ERROR_CODE_PASSWORD_INVALIDATE = 217;
    public static final int ERROR_CODE_PASSWORD_WRONG = 212;
    public static final int ERROR_CODE_PAY_FAILED = 218;
    public static final int ERROR_CODE_REQUEST_DECODE_FAILED = 427;
    public static final int ERROR_CODE_UNKNOWN = 500;
    public static final int ERROR_CODE_USERAGENT_PARAM_EMPTY = 421;
    public static final int ERROR_CODE_USERNAME_HAVE_EXIST = 214;
    public static final int ERROR_CODE_USERNAME_INVALIDATE = 213;
    public static final int ERROR_CODE_USERNAME_NOT_EXIST = 211;
    public static final int ERROR_CODE_XML_PARSE_FAILED = 422;
    public static final int ERROR_CODE_XML_PARSE_FAILED2 = 423;
    public static final String ERROR_INVALID_ACCOUNT = "\u7528\u6237\u540d\u6216\u5bc6\u7801\u9519\u8bef\u3002";
    public static final String ERROR_NETWORK_FAILED = "\u8bf7\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u540e\u91cd\u65b0\u518d\u8bd5\u3002";
    public static final String ERROR_PASSWORD_IS_EMPTY = "\u5bc6\u7801\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u5bc6\u7801\u3002";
    public static final String ERROR_PASSWORD_OR_USERNAME_IS_EMPTY = "\u8bf7\u8f93\u5165\u8d26\u53f7\u548c\u5bc6\u7801\u3002";
    public static final String ERROR_REGISTER_EMAIL_IS_EMPTY = "\u90ae\u7bb1\u4e0d\u80fd\u4e3a\u7a7a\u3002";
    public static final String ERROR_REGISTER_EMAIL_IS_WRONG = "\u975e\u6cd5\u7684\u90ae\u4ef6\u683c\u5f0f\u3002";
    public static final String ERROR_REGISTER_PASSWORD2_WRONG = "\u786e\u8ba4\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a\u3002";
    public static final String ERROR_REGISTER_PASSWORD_AND_PASSWORD_WRONG = "\u60a8\u8f93\u5165\u7684\u4e24\u6b21\u5bc6\u7801\u4e0d\u4e00\u81f4\uff0c\u8bf7\u68c0\u67e5\u3002";
    public static final String ERROR_REGISTER_PASSWORD_WRONG = "\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a\u3002";
    public static final String ERROR_REGISTER_UNSERNAME_WRONG2 = "\u7528\u6237\u540d\u5fc5\u987b\u5c0f\u4e8e17\u4e2a\u5b57\u3002";
    public static final String ERROR_REGISTER_USERNAME_NOT_ALL_NUMBER = "\u7528\u6237\u540d\u4e0d\u80fd\u4f7f\u7528\u7eaf\u6570\u5b57";
    public static final String ERROR_REGISTER_USERNAME_NOT_EMAIL = "\u7528\u6237\u540d\u4e0d\u80fd\u4f7f\u7528\u90ae\u7bb1";
    public static final String ERROR_REGISTER_USERNAME_WRONG = "\u7528\u6237\u540d\u5fc5\u987b\u5927\u4e8e3\u4e2a\u5b57\u3002";
    public static final String ERROR_START_APPKEY_INVALID = "\u8be5\u5e94\u7528\u7684\u652f\u4ed8KEY\u65e0\u6548\uff0c\u4e0d\u80fd\u6210\u529f\u652f\u4ed8\u3002";
    public static final String ERROR_START_CPID_INVALID = "CPID\u4e3a\u5b57\u7b26\u4e32\u548c\u6570\u5b57\u4efb\u610f\u7ec4\u5408\uff0c\u4e0d\u80fd\u7531\u4e2d\u6587\u5b57\u7b26\u3001\u6807\u70b9\u7b26\u53f7\u6216\u7a7a\u683c\uff0c\u957f\u5ea6\u4e0d\u8d85\u8fc710\u4e2a\u82f1\u6587\u5b57\u7b26\u3002";
    public static final int ERROR_TIMEOUT = 1;
    public static final String ERROR_TITLE = "\u53d1\u751f\u9519\u8bef";
    public static final String ERROR_TYPE_NOT_SUPPORTED = "type not supported.";
    public static final int ERROR_UNKNOWN = -3;
    public static final String ERROR_USERNAME_IS_EMPTY = "\u7528\u6237\u540d\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u7528\u6237\u540d\u3002";
    public static final String EXTRA_ERROR = "error";
    public static final String EXTRA_FROM_CHARGE = "fromCharge";
    public static final String EXTRA_G_BALANCE = "g_balance";
    public static final String EXTRA_JIFENGQUAN_BALANCE = "jifengquan_balance";
    public static final String GET = "get";
    public static final String HOST = "http://g2.uc.cn";
    public static final String HOST_PAY = "http://g2.uc.cn/ucgame/charge/";
    public static final int JIFENGQUAN_G_RATIO = 60;
    public static final int PAYMENT_DESC_LENGTH_MAX = 100;
    public static final int PAYMENT_JIFENGQUAN_MAX = 10000;
    public static final int PAYMENT_JIFENGQUAN_MIN = 0;
    public static final int PAYMENT_MAX = 1000;
    public static final int PAYMENT_MIN = 0;
    public static final int PAYMENT_NAME_LENGTH_MAX = 50;
    public static final int PAYMENT_SMS_PAYNAME_BYTE_LENGTH_MAX = 24;
    public static final String POST = "post";
    public static final int REGIST_NAME_MAX_LENGTH = 16;
    public static final int REGIST_NAME_MIN_LENGTH = 3;
    public static final int RENMINBI_JIFENGQUAN_RATIO = 10;
    public static final int RENMINBI_SMS_RATIO = 2;
    public static final String RES_ALIPAY = "alipay.png";
    public static final String RES_ALIPAY_HDPI = "alipay_hdpi.png";
    public static final String RES_ALIPAY_PLUGIN_APK = "alipay_plugin.apk";
    public static final String RES_LIST_ITEM_MORE_ICON = "more.png";
    public static final String RES_LOCK = "lock.png";
    public static final String RES_LOCK_HDPI = "lock_hdpi.png";
    public static final String RES_TYPE_ALIPAY_ICON = "alipay_logo.png";
    public static final String RES_TYPE_ALIPAY_ICON_HDPI = "alipay_logo_hdpi.png";
    public static final String RES_TYPE_GFAN_ICON = "gfan_logo.png";
    public static final String RES_TYPE_GFAN_ICON_HDPI = "gfan_logo_hdpi.png";
    public static final String RES_TYPE_G_ICON = "g_logo.png";
    public static final String RES_TYPE_G_ICON_HDPI = "g_logo_hdpi.png";
    public static final String RES_TYPE_PHONECARD_ICON = "phonecard_logo.png";
    public static final String RES_TYPE_PHONECARD_ICON_HDPI = "phonecard_logo_hdpi.png";
    public static final String RES_TYPE_SMS_ICON = "sms_logo.png";
    public static final String RES_TYPE_SMS_ICON_HDPI = "sms_logo_hdpi.png";
    public static final String SMS_INFO_BEFORE_SEND_BEIWEI = "\u63d0\u793a\uff1a\u60a8\u5c06\u9009\u62e9\u4f7f\u7528\u7531\u5317\u4eac\u5317\u7eac\u901a\u4fe1\u79d1\u6280\u80a1\u4efd\u6709\u9650\u516c\u53f8\u63d0\u4f9b\u7684\u77ed\u4fe1\u4e92\u52a8\u4e1a\u52a1\uff0c\u4fe1\u606f\u8d391\u5143/\u6761\uff0c\u7ee7\u7eed\u70b9\u64ad\u5f00\u59cb\u4eab\u53d7\u670d\u52a1\uff0c\u8fd4\u56de\u5219\u4e0d\u6263\u8d39\u3002\u5ba2\u670d\u7535\u8bdd\uff1a4007361098";
    public static final String SMS_SUCCESS = "success";
    public static final String TERM = ",";
    public static final String TEXT_BACK_TO_PAY = "\u8fd4\u56de\u7ee7\u7eed\u652f\u4ed8";
    public static final String TEXT_BACK_TO_PAYPOINT = "\u8fd4\u56de\u8d2d\u4e70\u9875";
    public static final int TEXT_CHARGE_TITLE_LENGTH_MAX = 7;
    public static final String TEXT_CONFIRM_TO_CANCEL = "\u786e\u8ba4\u53d6\u6d88";
    public static final String TEXT_DELETE = "\u5220\u9664";
    public static final String TEXT_EXIT = "\u8fd4\u56de\u5e94\u7528";
    public static final String TEXT_INSUFFENT_BALANCE = "\u4f59\u989d\u4e0d\u8db3";
    public static final String TEXT_INSUFFENT_BALANCE2 = "\u6b20\u8d39";
    public static final String TEXT_NOT_DELETE = "\u4e0d\u5220";
    public static final String TEXT_PAY_SMS_BACK_CONFIRM = "\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\u672a\u5220\u9664\uff0c\u5982\u9700\u8d2d\u4e70\u8bf7\u518d\u6b21\u53d1\u9001\u77ed\u4fe1\u6216\u91c7\u7528\u5176\u4ed6\u652f\u4ed8\u65b9\u5f0f\uff0c<font color='red'>\u8bf7\u52ff\u5230\u77ed\u4fe1\u6536\u4ef6\u7bb1\u8fdb\u884c\u56de\u590d</font>\uff0c\u8c22\u8c22\uff01";
    public static final String TEXT_PAY_SMS_CHANCEL_CONFIRM = "\u60a8\u5df2\u7ecf\u652f\u4ed8\u8fc7\u3010%d\u3011\u5143\u77ed\u4fe1\uff0c\u73b0\u5728\u53d6\u6d88\u53d1\u9001\u5c06\u4e0d\u80fd\u6210\u529f\u8d2d\u4e70\u3010%s\u3011\u3002\u5982\u53d6\u6d88\u53d1\u9001\u5df2\u4ed8\u91d1\u989d\u4e0d\u4f1a\u8fd4\u8fd8\uff0c\u53ea\u80fd\u8ba1\u7b97\u5230\u60a8\u4e0b\u6b21\u8d2d\u4e70\u3010%s\u3011\u4e2d\u3002\u8bf7\u518d\u6b21\u786e\u8ba4\u662f\u5426\u53d6\u6d88\u8fd9\u6b21\u652f\u4ed8\uff1f";
    public static final String TEXT_PAY_SMS_CONFIRM_INDEXOF = "\uff0c";
    public static final String TEXT_PAY_SMS_CONFRIM_RESULT_CONTAIN = "\u901a\u4fe1\u8d26\u6237\u652f\u4ed8";
    public static final String TEXT_PAY_SMS_CONFRIM_START_WITH = "\u786e\u8ba4\u652f\u4ed8\u8bf7\u56de\u590d\u6570\u5b57";
    public static final String TEXT_PAY_SMS_CONFRIM_SUPPORTTEL_START_WITH = "\u5143\u3002\u5ba2\u670d";
    public static final String TEXT_PAY_SMS_DELETE_BACK_CONFIRM = "\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\u5df2\u5220\u9664\uff0c\u5982\u9700\u8d2d\u4e70\u8bf7\u518d\u6b21\u53d1\u9001\u77ed\u4fe1\u6216\u91c7\u7528\u5176\u4ed6\u652f\u4ed8\u65b9\u5f0f\uff0c\u8c22\u8c22\uff01";
    public static final String TEXT_PAY_SMS_DELETE_CONFIRM = "\u60a8\u5df2\u7ecf\u53d6\u6d88\u4e86\u8d2d\u4e70\uff0c\u5c06\u4e0d\u4f1a\u83b7\u5f97\u76f8\u5e94\u5185\u5bb9\u3002\u662f\u5426\u5220\u9664\u521a\u6536\u5230\u7684\u8d2d\u4e70\u786e\u8ba4\u77ed\u4fe1\uff1f\u5982\u679c\u4e0d\u5220\u9664\u8bf7\u52ff\u5230\u77ed\u4fe1\u6536\u4ef6\u7bb1\u8fdb\u884c\u56de\u590d\u3002";
    public static final String TEXT_PAY_SMS_FAILED = "\u77ed\u4fe1\u652f\u4ed8\u5931\u8d25";
    public static final String TEXT_PAY_SMS_FAILED_INSUFFENT_BALANCE = "\u4f59\u989d\u4e0d\u8db3\uff0c\u652f\u4ed8\u5931\u8d25";
    public static final int TEXT_SIZE = 16;
    public static final String VERSION = "2.3.2";
    public static final String[] API_URLS = {"http://g2.uc.cn/ucgame/charge/login", "http://g2.uc.cn/ucgame/charge/register", "http://g2.uc.cn/ucgame/charge/check_username", "http://g2.uc.cn/ucgame/charge/charge_umoney", "http://g2.uc.cn/ucgame/charge/charge_umoney", "http://g2.uc.cn/ucgame/charge/sdkConfirm", "http://g2.uc.cn/ucgame/charge/getPayType", "http://g2.uc.cn/ucgame/charge/update_sms", "http://g2.uc.cn/ucgame/charge/getClientMessagePay", "http://g2.uc.cn/ucgame/charge/sdkPayPointArrive", "http://g2.uc.cn/ucgame/charge/rechargeRequest", "http://g2.uc.cn/ucgame/charge/getCardConfigServlet", "http://g2.uc.cn/ucgame/charge/queryServlet", "http://g2.uc.cn/ucgame/charge/businessProcess.do", "http://g2.uc.cn/ucgame/charge/businessProcess.do", "http://g2.uc.cn/ucgame/charge/businessProcess.do", "http://g2.uc.cn/ucgame/charge/businessProcess.do", "http://g2.uc.cn/ucgame/charge/businessProcess", "http://g2.uc.cn/ucgame/charge/gain_discount"};
    public static final int COLOR_TITLE_BACKGROUND = Color.parseColor("#FF8B4B3C");
    public static final int COLOR_SUBTITLE_BACKGROUND1 = Color.parseColor("#FFFFB546");
    public static final int COLOR_SUBTITLE_BACKGROUND2 = Color.parseColor("#FFFF6633");
    public static final int CHARGE_ALIPAY_INPUT_LENGTH_MAX = (int) Math.log10(10000.0d);
    public static final int CHARGE_G_INPUT_LENGTH_MAX = CHARGE_ALIPAY_INPUT_LENGTH_MAX + 1;
}
