package com.uc.paymentsdk.commons.ui;

import android.R;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.database.DataSetObserver;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.SpinnerAdapter;

public class TitleSpinner extends Button implements DialogInterface.OnClickListener {
    private SpinnerAdapter mAdapter;
    private int mNextSelectedPosition;
    private DialogInterface.OnClickListener mOnClickListener;
    private CharSequence mPrompt;

    public TitleSpinner(Context paramContext) {
        super(paramContext);
        init();
    }

    public TitleSpinner(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
        init();
    }

    private void init() {
        this.mNextSelectedPosition = -1;
        setGravity(19);
        setBackgroundResource(R.drawable.btn_dropdown);
    }

    public int getSelectedItemPosition() {
        return this.mNextSelectedPosition;
    }

    public void setSelection(int paramInt) {
        this.mNextSelectedPosition = paramInt;
        setText(this.mAdapter.getItem(paramInt).toString());
    }

    public void setAdapter(SpinnerAdapter paramSpinnerAdapter) {
        this.mAdapter = paramSpinnerAdapter;
    }

    @Override
    public void onClick(DialogInterface paramDialogInterface, int paramInt) {
        setSelection(paramInt);
        paramDialogInterface.dismiss();
        if (this.mOnClickListener != null) {
            this.mOnClickListener.onClick(paramDialogInterface, paramInt);
        }
    }

    @Override
    public boolean performClick() {
        boolean bool = super.performClick();
        if (!bool) {
            bool = true;
            AlertDialog.Builder localBuilder = new AlertDialog.Builder(getContext());
            if (this.mPrompt != null) {
                localBuilder.setTitle(this.mPrompt);
            }
            localBuilder.setSingleChoiceItems(new DropDownAdapter(this.mAdapter), getSelectedItemPosition(), this).show();
        }
        return bool;
    }

    public void setOnClickListener(DialogInterface.OnClickListener paramOnClickListener) {
        this.mOnClickListener = paramOnClickListener;
    }

    public void setPrompt(CharSequence paramCharSequence) {
        this.mPrompt = paramCharSequence;
    }

    private static class DropDownAdapter implements ListAdapter, SpinnerAdapter {
        private SpinnerAdapter mAdapter;
        private ListAdapter mListAdapter;

        public DropDownAdapter(SpinnerAdapter paramSpinnerAdapter) {
            this.mAdapter = paramSpinnerAdapter;
            if (paramSpinnerAdapter instanceof SpinnerAdapter) {
                this.mListAdapter = (ListAdapter) paramSpinnerAdapter;
            }
        }

        @Override
        public int getCount() {
            if (this.mAdapter == null) {
                return 0;
            }
            return this.mAdapter.getCount();
        }

        @Override
        public Object getItem(int paramInt) {
            if (this.mAdapter == null) {
                return null;
            }
            return this.mAdapter.getItem(paramInt);
        }

        @Override
        public long getItemId(int paramInt) {
            if (this.mAdapter == null) {
                return -1L;
            }
            return this.mAdapter.getItemId(paramInt);
        }

        @Override
        public View getView(int paramInt, View paramView, ViewGroup paramViewGroup) {
            return getDropDownView(paramInt, paramView, paramViewGroup);
        }

        @Override
        public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup) {
            if (this.mAdapter == null) {
                return null;
            }
            return this.mAdapter.getDropDownView(paramInt, paramView, paramViewGroup);
        }

        @Override
        public boolean hasStableIds() {
            return this.mAdapter != null && this.mAdapter.hasStableIds();
        }

        @Override
        public void registerDataSetObserver(DataSetObserver paramDataSetObserver) {
            if (this.mAdapter != null) {
                this.mAdapter.registerDataSetObserver(paramDataSetObserver);
            }
        }

        @Override
        public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver) {
            if (this.mAdapter != null) {
                this.mAdapter.unregisterDataSetObserver(paramDataSetObserver);
            }
        }

        @Override
        public boolean areAllItemsEnabled() {
            ListAdapter localListAdapter = this.mListAdapter;
            if (localListAdapter != null) {
                return localListAdapter.areAllItemsEnabled();
            }
            return true;
        }

        @Override
        public boolean isEnabled(int paramInt) {
            ListAdapter localListAdapter = this.mListAdapter;
            if (localListAdapter != null) {
                return localListAdapter.isEnabled(paramInt);
            }
            return true;
        }

        @Override
        public int getItemViewType(int paramInt) {
            return 0;
        }

        @Override
        public int getViewTypeCount() {
            return 1;
        }

        @Override
        public boolean isEmpty() {
            return getCount() == 0;
        }
    }
}
