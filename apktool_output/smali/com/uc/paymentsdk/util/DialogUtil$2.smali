.class Lcom/uc/paymentsdk/util/DialogUtil$2;
.super Ljava/lang/Object;
.source "DialogUtil.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/uc/paymentsdk/util/DialogUtil;->createDeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)Landroid/app/ProgressDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$id:I

.field private final synthetic val$listener:Lcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$context:Landroid/content/Context;

    iput p2, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$id:I

    iput-object p3, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$listener:Lcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "paramDialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v1, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$id:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$listener:Lcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;

    if-eqz v0, :cond_1

    .line 49
    iget-object v0, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$listener:Lcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;

    iget v1, p0, Lcom/uc/paymentsdk/util/DialogUtil$2;->val$id:I

    invoke-interface {v0, v1}, Lcom/uc/paymentsdk/util/DialogUtil$ProgressDialogListener;->onProgressDialogCancel(I)V

    .line 50
    :cond_1
    return-void
.end method
