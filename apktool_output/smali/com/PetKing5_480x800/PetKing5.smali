.class public Lcom/PetKing5_480x800/PetKing5;
.super Ljavax/microedition/lcdui/CwaActivity;
.source "PetKing5.java"


# static fields
.field public static gr:Lmain/GameRun;

.field public static intent:Landroid/content/Intent;


# instance fields
.field ad:Landroid/app/AlertDialog;

.field instance:Lmain/XConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 36
    sput-object v0, Lcom/PetKing5_480x800/PetKing5;->intent:Landroid/content/Intent;

    .line 44
    sput-object v0, Lcom/PetKing5_480x800/PetKing5;->gr:Lmain/GameRun;

    .line 32
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljavax/microedition/lcdui/CwaActivity;-><init>()V

    .line 39
    sput-object p0, Lmain/SMSSender;->pk:Lcom/PetKing5_480x800/PetKing5;

    .line 40
    invoke-static {p0}, Lcom/uc/paymentsdk/payment/PaymentsActivity;->init(Landroid/content/Context;)V

    .line 42
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 8
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x1

    .line 169
    invoke-super {p0, p1, p2, p3}, Ljavax/microedition/lcdui/CwaActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 171
    if-nez p1, :cond_0

    .line 172
    if-ne v4, p2, :cond_2

    .line 173
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "================resultCode"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    const-string v3, "Success"

    const-string v4, "Success"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lmain/SMSSender;->setSendSms(I)V

    .line 178
    :try_start_0
    sget-byte v3, Lmain/SMSSender;->smsType:B

    if-ne v3, v7, :cond_1

    .line 179
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    invoke-virtual {v3}, Lmain/SMSSender;->sendSuccess()V

    .line 180
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Lmain/SMSSender;->setSendSms(I)V

    .line 181
    const/16 v3, -0xa

    sput v3, Lmain/GameRun;->run_state:I

    .line 182
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    sget v4, Lmain/GameRun;->run_state:I

    iput v4, v3, Lmain/MainCanvas;->temp_state:I

    .line 183
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lmain/MainCanvas;->setSmsIsSetRun_state(Z)V

    .line 184
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    iget-object v3, v3, Lmain/GameRun;->map:Lmain/Map;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lmain/Map;->setRegState(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    :goto_0
    const-string v3, "number"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 199
    .local v1, "number":Ljava/lang/String;
    const-string v3, "orderId"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 243
    .end local v1    # "number":Ljava/lang/String;
    :cond_0
    :goto_1
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    sput-boolean v6, Lmain/SMSSender;->isWorking:Z

    .line 244
    return-void

    .line 187
    :cond_1
    :try_start_1
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    invoke-virtual {v3}, Lmain/SMSSender;->sendSuccess()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 189
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 202
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    invoke-virtual {v3, v4}, Lmain/SMSSender;->setSendSms(I)V

    .line 208
    :try_start_2
    sget-byte v3, Lmain/SMSSender;->smsType:B

    const/4 v4, 0x7

    if-ne v3, v4, :cond_3

    .line 209
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    const/4 v4, 0x1

    iput-boolean v4, v3, Lmain/SMSSender;->sms_a:Z

    .line 210
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-virtual {v3}, Lmain/GameRun;->goGameOver()V

    .line 211
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "ccccccccc"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 213
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lmain/MainCanvas;->setSmsIsSetRun_state(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 236
    :catch_1
    move-exception v3

    move-object v0, v3

    .line 238
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 215
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_3
    sget-byte v3, Lmain/SMSSender;->smsType:B

    const/4 v4, 0x5

    if-ne v3, v4, :cond_4

    .line 216
    const/16 v3, -0xa

    sput v3, Lmain/GameRun;->run_state:I

    .line 217
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    sget v4, Lmain/GameRun;->run_state:I

    iput v4, v3, Lmain/MainCanvas;->temp_state:I

    .line 218
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    iget-object v3, v3, Lmain/GameRun;->map:Lmain/Map;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lmain/Map;->setRegState(Z)V

    .line 221
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lmain/MainCanvas;->setSmsIsSetRun_state(Z)V

    goto :goto_1

    .line 222
    :cond_4
    sget-byte v3, Lmain/SMSSender;->smsType:B

    if-ne v3, v7, :cond_5

    .line 223
    const/16 v3, -0xa

    sput v3, Lmain/GameRun;->run_state:I

    .line 225
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lmain/MainCanvas;->setSmsIsSetRun_state(Z)V

    .line 226
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    iget-object v3, v3, Lmain/GameRun;->map:Lmain/Map;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lmain/Map;->setRegState(Z)V

    goto :goto_1

    .line 227
    :cond_5
    sget-byte v3, Lmain/SMSSender;->smsType:B

    if-ne v3, v5, :cond_0

    .line 229
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    invoke-virtual {v3}, Lmain/SMSSender;->getSmsSenderMenuState()B

    move-result v3

    if-eqz v3, :cond_0

    .line 230
    sget-object v3, Lmain/GameRun;->mc:Lmain/MainCanvas;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lmain/MainCanvas;->setSmsIsSetRun_state(Z)V

    .line 231
    sget-object v3, Lmain/SMSSender;->gr:Lmain/GameRun;

    invoke-static {v3}, Lmain/SMSSender;->i(Lmain/GameRun;)Lmain/SMSSender;

    move-result-object v3

    invoke-virtual {v3}, Lmain/SMSSender;->getTstate()I

    move-result v3

    sput v3, Lmain/GameRun;->run_state:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 54
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/PetKing5_480x800/PetKing5;->setFullWindow(Z)V

    .line 55
    invoke-super {p0, p1}, Ljavax/microedition/lcdui/CwaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    new-instance v0, Lmain/XConnection;

    invoke-direct {v0}, Lmain/XConnection;-><init>()V

    iput-object v0, p0, Lcom/PetKing5_480x800/PetKing5;->instance:Lmain/XConnection;

    .line 57
    iget-object v0, p0, Lcom/PetKing5_480x800/PetKing5;->instance:Lmain/XConnection;

    invoke-virtual {p0, v0}, Lcom/PetKing5_480x800/PetKing5;->setMIDlet(Ljavax/microedition/midlet/MIDlet;)V

    .line 58
    invoke-virtual {p0}, Lcom/PetKing5_480x800/PetKing5;->setContentView()V

    .line 62
    invoke-virtual {p0}, Lcom/PetKing5_480x800/PetKing5;->getIntent()Landroid/content/Intent;

    move-result-object v0

    sput-object v0, Lcom/PetKing5_480x800/PetKing5;->intent:Landroid/content/Intent;

    .line 63
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 48
    invoke-super {p0}, Ljavax/microedition/lcdui/CwaActivity;->onDestroy()V

    .line 50
    return-void
.end method

.method public setSmshah()V
    .locals 21

    .prologue
    .line 67
    const-string v14, "10086"

    .line 68
    .local v14, "DebugAdress":Ljava/lang/String;
    sget-byte v9, Lmain/SMSSender;->smsType:B

    packed-switch v9, :pswitch_data_0

    .line 167
    :goto_0
    :pswitch_0
    return-void

    .line 77
    :pswitch_1
    new-instance v15, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/PetKing5_480x800/PetKing5;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 78
    const-class v10, Lcom/uc/paymentsdk/payment/PaymentsActivity;

    .line 77
    invoke-direct {v15, v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .local v15, "intent":Landroid/content/Intent;
    new-instance v3, Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v4, "Buy 5000 Gold"

    const-string v5, "22"

    const-string v6, "01"

    const-string v7, "As the young master of the leading family among the four great clans, you can't be without money! Get 5000 Gold now."

    const/16 v8, 0x14

    invoke-direct/range {v3 .. v8}, Lcom/uc/paymentsdk/payment/PaymentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 80
    .local v3, "info":Lcom/uc/paymentsdk/payment/PaymentInfo;
    const-string v9, "com.mappn.sdk.paymentinfo"

    invoke-virtual {v15, v9, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 81
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object v1, v15

    move v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/PetKing5_480x800/PetKing5;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 100
    .end local v3    # "info":Lcom/uc/paymentsdk/payment/PaymentInfo;
    .end local v15    # "intent":Landroid/content/Intent;
    :pswitch_2
    new-instance v16, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/PetKing5_480x800/PetKing5;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 101
    const-class v10, Lcom/uc/paymentsdk/payment/PaymentsActivity;

    .line 100
    move-object/from16 v0, v16

    move-object v1, v9

    move-object v2, v10

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v16, "intent1":Landroid/content/Intent;
    new-instance v4, Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v5, "Buy 10 Badges"

    const-string v6, "22"

    const-string v7, "02"

    const-string v8, "Buy this special item and immediately get 10 Badges, which can be used to purchase double experience, Pokémon skills, powerful Pokémon capture balls, and other amazing items."

    const/16 v9, 0x14

    invoke-direct/range {v4 .. v9}, Lcom/uc/paymentsdk/payment/PaymentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 103
    .local v4, "info1":Lcom/uc/paymentsdk/payment/PaymentInfo;
    const-string v9, "com.mappn.sdk.paymentinfo"

    move-object/from16 v0, v16

    move-object v1, v9

    move-object v2, v4

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 104
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/PetKing5_480x800/PetKing5;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 111
    .end local v4    # "info1":Lcom/uc/paymentsdk/payment/PaymentInfo;
    .end local v16    # "intent1":Landroid/content/Intent;
    :pswitch_3
    new-instance v17, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/PetKing5_480x800/PetKing5;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 112
    const-class v10, Lcom/uc/paymentsdk/payment/PaymentsActivity;

    .line 111
    move-object/from16 v0, v17

    move-object v1, v9

    move-object v2, v10

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 113
    .local v17, "intent2":Landroid/content/Intent;
    new-instance v5, Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v6, "Pokémon Level Up x5"

    const-string v7, "22"

    const-string v8, "03"

    const-string v9, "Immediately level up all the Pokémon you carry by 5 levels (Pokémon above level 70 cannot be leveled up further)"

    const/16 v10, 0x14

    invoke-direct/range {v5 .. v10}, Lcom/uc/paymentsdk/payment/PaymentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 114
    .local v5, "info2":Lcom/uc/paymentsdk/payment/PaymentInfo;
    const-string v9, "com.mappn.sdk.paymentinfo"

    move-object/from16 v0, v17

    move-object v1, v9

    move-object v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 115
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/PetKing5_480x800/PetKing5;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 125
    .end local v5    # "info2":Lcom/uc/paymentsdk/payment/PaymentInfo;
    .end local v17    # "intent2":Landroid/content/Intent;
    :pswitch_4
    new-instance v18, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/PetKing5_480x800/PetKing5;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 126
    const-class v10, Lcom/uc/paymentsdk/payment/PaymentsActivity;

    .line 125
    move-object/from16 v0, v18

    move-object v1, v9

    move-object v2, v10

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 127
    .local v18, "intent3":Landroid/content/Intent;
    new-instance v6, Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v7, "Buy Mystic Beast"

    const-string v8, "22"

    const-string v9, "04"

    const-string v10, "Buy this special item to get the adorable Mystic Beast, which doubles your movement speed and prevents encounters with any enemies! Unlimited use, don't hesitate, buy it now!"

    const/16 v11, 0x14

    invoke-direct/range {v6 .. v11}, Lcom/uc/paymentsdk/payment/PaymentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 128
    .local v6, "info3":Lcom/uc/paymentsdk/payment/PaymentInfo;
    const-string v9, "com.mappn.sdk.paymentinfo"

    move-object/from16 v0, v18

    move-object v1, v9

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 129
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/PetKing5_480x800/PetKing5;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 139
    .end local v6    # "info3":Lcom/uc/paymentsdk/payment/PaymentInfo;
    .end local v18    # "intent3":Landroid/content/Intent;
    :pswitch_5
    new-instance v19, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/PetKing5_480x800/PetKing5;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 140
    const-class v10, Lcom/uc/paymentsdk/payment/PaymentsActivity;

    .line 139
    move-object/from16 v0, v19

    move-object v1, v9

    move-object v2, v10

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 141
    .local v19, "intent4":Landroid/content/Intent;
    new-instance v7, Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v8, "Genuine Verification"

    const-string v9, "22"

    const-string v10, "05"

    const-string v11, "The game demo is over. Purchasing this will unlock all subsequent game content and maps. You'll also receive 5 Badges for free (which can be used to purchase powerful items)."

    const/16 v12, 0x28

    invoke-direct/range {v7 .. v12}, Lcom/uc/paymentsdk/payment/PaymentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 142
    .local v7, "info4":Lcom/uc/paymentsdk/payment/PaymentInfo;
    const-string v9, "com.mappn.sdk.paymentinfo"

    move-object/from16 v0, v19

    move-object v1, v9

    move-object v2, v7

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 143
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/PetKing5_480x800/PetKing5;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 153
    .end local v7    # "info4":Lcom/uc/paymentsdk/payment/PaymentInfo;
    .end local v19    # "intent4":Landroid/content/Intent;
    :pswitch_6
    new-instance v20, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/PetKing5_480x800/PetKing5;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 154
    const-class v10, Lcom/uc/paymentsdk/payment/PaymentsActivity;

    .line 153
    move-object/from16 v0, v20

    move-object v1, v9

    move-object v2, v10

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 155
    .local v20, "intent5":Landroid/content/Intent;
    new-instance v8, Lcom/uc/paymentsdk/payment/PaymentInfo;

    const-string v9, "Level Up & Revive"

    const-string v10, "22"

    const-string v11, "06"

    const-string v12, "Fully heal all the Pokémon you carry, and immediately level them up by 5 levels (Pokémon above level 70 cannot be leveled up further), making the upcoming battles easier."

    const/16 v13, 0x14

    invoke-direct/range {v8 .. v13}, Lcom/uc/paymentsdk/payment/PaymentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 156
    .local v8, "info5":Lcom/uc/paymentsdk/payment/PaymentInfo;
    const-string v9, "com.mappn.sdk.paymentinfo"

    move-object/from16 v0, v20

    move-object v1, v9

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 157
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/PetKing5_480x800/PetKing5;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 68
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
