package com.uc.paymentsdk.util;

import android.R;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.text.Html;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

public class DialogUtil {

    public interface CheckBoxWarningDialogListener {
        void onWarningDialogCancel(int i);

        void onWarningDialogOK(int i, boolean z);
    }

    public interface EditTextDialogListener {
        void onEditTextDialogCancel(int i);

        void onEditTextDialogOK(int i, String str);
    }

    public interface InfoDialogListener {
        void onInfoDialogOK(int i);
    }

    public interface InputDialogListener {
        void onInputDialogCancel(int i);

        void onInputDialogOK(int i, String str);
    }

    public interface ListCheckboxDialogListener {
        void onListDialogCancel(int i, CharSequence[] charSequenceArr);

        void onListDialogOK(int i, CharSequence[] charSequenceArr, int i2, int i3);
    }

    public interface ListDIalogListener {
        void onListDialogOK(int i, int i2);
    }

    public interface ListDialogListener2 {
        void onListDialogCancel2(int i, Object[] objArr);

        void onListDialogOK2(int i, Object[] objArr, int i2);
    }

    public interface ProgressDialogListener {
        void onProgressDialogCancel(int i);
    }

    public interface RatingDialogListener {
        void onRatingDialogCancel();

        void onRatingDialogOK(int i, float f);
    }

    public interface RegisterDialogListener {
        void onRegisterDialogCancel(int i);

        void onRegisterDialogOK(int i, String str, String str2, String str3);
    }

    public interface UserPwdDialogListener {
        void onUserPwdDialogCancel(int i);

        void onUserPwdDialogOK(int i, String str, String str2, boolean z);

        void onUserPwdDialogRegister(int i);
    }

    public interface WarningDialogListener {
        void onWarningDialogCancel(int i);

        void onWarningDialogOK(int i);
    }

    public static ProgressDialog createDeterminateProgressDialog(final Context paramContext, final int paramInt, String paramString, boolean paramBoolean, final ProgressDialogListener paramProgressDialogListener) {
        ProgressDialog localProgressDialog = new ProgressDialog(paramContext);
        localProgressDialog.setIcon(R.drawable.ic_dialog_info);
        localProgressDialog.setTitle(paramString);
        localProgressDialog.setProgressStyle(1);
        if (paramBoolean) {
            localProgressDialog.setButton(paramContext.getString(R.string.cancel), new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface paramDialogInterface, int paramInt2) {
                    if (paramContext instanceof Activity) {
                        ((Activity) paramContext).removeDialog(paramInt);
                    }
                    if (paramProgressDialogListener != null) {
                        paramProgressDialogListener.onProgressDialogCancel(paramInt);
                    }
                }
            });
            localProgressDialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
                @Override
                public void onCancel(DialogInterface paramDialogInterface) {
                    if (paramContext instanceof Activity) {
                        ((Activity) paramContext).removeDialog(paramInt);
                    }
                    if (paramProgressDialogListener != null) {
                        paramProgressDialogListener.onProgressDialogCancel(paramInt);
                    }
                }
            });
        }
        if (!paramBoolean) {
            localProgressDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                @Override
                public void onDismiss(DialogInterface paramDialogInterface) {
                    if (paramContext instanceof Activity) {
                        ((Activity) paramContext).removeDialog(paramInt);
                    }
                }
            });
        }
        return localProgressDialog;
    }

    public static Dialog createOKWarningDialog(Context paramContext, int paramInt, CharSequence paramCharSequence, WarningDialogListener paramWarningDialogListener) {
        return createOKWarningDialog(paramContext, paramInt, null, paramCharSequence, paramWarningDialogListener);
    }

    public static Dialog createOKWarningDialog(final Context paramContext, final int paramInt, CharSequence paramCharSequence1, CharSequence paramCharSequence2, final WarningDialogListener paramWarningDialogListener) {
        return new AlertDialog.Builder(paramContext).setCancelable(true).setTitle(TextUtils.isEmpty(paramCharSequence1) ? Constants.ERROR_TITLE : paramCharSequence1).setMessage(paramCharSequence2).setPositiveButton("\u786e\u5b9a", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface paramDialogInterface, int paramInt2) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
                if (paramWarningDialogListener != null) {
                    paramWarningDialogListener.onWarningDialogOK(paramInt);
                }
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() {
            @Override
            public void onCancel(DialogInterface paramDialogInterface) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
                if (paramWarningDialogListener != null) {
                    paramWarningDialogListener.onWarningDialogOK(paramInt);
                }
            }
        }).create();
    }

    public static Dialog createIndeterminateProgressDialog(final Context paramContext, final int paramInt, String paramString, boolean paramBoolean, ProgressDialogListener paramProgressDialogListener) {
        ProgressDialog localProgressDialog = new ProgressDialog(paramContext);
        if (paramString == null) {
            throw new RuntimeException("Must provide a hint string for input dialog");
        }
        localProgressDialog.setCancelable(paramBoolean);
        localProgressDialog.setMessage(paramString);
        localProgressDialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
            @Override
            public void onCancel(DialogInterface paramDialogInterface) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
            }
        });
        return localProgressDialog;
    }

    public static Dialog createTwoButtonsDialog(final Context paramContext, final int paramInt, CharSequence paramCharSequence1, CharSequence paramCharSequence2, CharSequence paramCharSequence3, final WarningDialogListener paramWarningDialogListener) {
        return new AlertDialog.Builder(paramContext).setTitle("\u6ce8\u610f").setMessage(paramCharSequence1).setPositiveButton(paramCharSequence2, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface paramDialogInterface, int paramInt2) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
                if (paramWarningDialogListener != null) {
                    paramWarningDialogListener.onWarningDialogOK(paramInt);
                }
            }
        }).setNegativeButton(paramCharSequence3, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface paramDialogInterface, int paramInt2) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                    if (paramWarningDialogListener != null) {
                        paramWarningDialogListener.onWarningDialogCancel(paramInt);
                    }
                }
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() {
            @Override
            public void onCancel(DialogInterface paramDialogInterface) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
            }
        }).create();
    }

    public static Dialog createYesNoDialog(Context paramContext, int paramInt, CharSequence paramCharSequence, WarningDialogListener paramWarningDialogListener) {
        return createTwoButtonsDialog(paramContext, paramInt, paramCharSequence, "\u786e\u5b9a", "\u53d6\u6d88", paramWarningDialogListener);
    }

    public static Dialog createOKWarningDialogSupportLink(final Context paramContext, final int paramInt, String paramString1, String paramString2, final WarningDialogListener paramWarningDialogListener) {
        TextView localTextView = new TextView(paramContext);
        localTextView.setPadding(10, 10, 10, 10);
        localTextView.setTextAppearance(paramContext, R.style.TextAppearance.Medium.Inverse);
        localTextView.setBackgroundColor(-1);
        localTextView.setLinkTextColor(Constants.COLOR_LINK_TEXT);
        localTextView.setMovementMethod(LinkMovementMethod.getInstance());
        localTextView.setText(Html.fromHtml(paramString2));
        LinearLayout localLinearLayout = new LinearLayout(paramContext);
        localLinearLayout.setOrientation(1);
        localLinearLayout.addView(localTextView);
        ScrollView localScrollView = new ScrollView(paramContext);
        localScrollView.setVerticalFadingEdgeEnabled(false);
        localScrollView.addView(localLinearLayout);
        return new AlertDialog.Builder(paramContext).setTitle(paramString1).setView(localScrollView).setPositiveButton("\u786e\u5b9a", (DialogInterface.OnClickListener) null).setPositiveButton("\u786e\u5b9a", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface paramDialogInterface, int paramInt2) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
                if (paramWarningDialogListener != null) {
                    paramWarningDialogListener.onWarningDialogOK(paramInt);
                }
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() {
            @Override
            public void onCancel(DialogInterface paramDialogInterface) {
                if (paramContext instanceof Activity) {
                    ((Activity) paramContext).removeDialog(paramInt);
                }
                if (paramWarningDialogListener != null) {
                    paramWarningDialogListener.onWarningDialogOK(paramInt);
                }
            }
        }).create();
    }
}
