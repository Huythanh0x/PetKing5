package soars;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import com.PetKing5_480x800.PetKing5;
import com.PetKing5_480x800.R;
import main.GameRun;
import main.SMSSender;

public class Choose extends Activity {
    private Button btn = null;
    private Button btn2 = null;

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 4:
                GameRun gameRun = PetKing5.gr;
                SMSSender.i(PetKing5.gr);
                gameRun.falselly(SMSSender.smsType);
                System.out.println("\u6211\u7684");
                finishFromChild(getParent());
                return true;
            default:
                return super.onKeyDown(keyCode, event);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        this.btn = (Button) findViewById(R.id.button1);
        this.btn2 = (Button) findViewById(R.id.button2);
        this.btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SMSSender.smsSender.setSmsValue(0);
                Choose.this.finishFromChild(Choose.this.getParent());
            }
        });
        this.btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SMSSender.smsSender.setSmsValue(1);
                Choose.this.finishFromChild(Choose.this.getParent());
            }
        });
    }
}
