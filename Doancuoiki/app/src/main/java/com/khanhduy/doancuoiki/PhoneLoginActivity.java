package com.khanhduy.doancuoiki;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.util.HashMap;
import java.util.Map;

public class PhoneLoginActivity extends AppCompatActivity {
    public static final String TAG = PhoneLoginActivity.class.getSimpleName();
    EditText edtUser, edtPassword;
    Button btnLogin, btnSignin;
    CheckBox cbNhoTaiKhoan;
    TextView txtQMK;
    String urlUser = "http://192.168.1.11/ServicesHotel/getUser.php";
    SharedPreferences sharedPreferences;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_phone_login);
        AnhXa();

        sharedPreferences = getSharedPreferences("dataLogin",MODE_PRIVATE);

        edtUser.setText(sharedPreferences.getString("taikhoan",""));
        edtPassword.setText(sharedPreferences.getString("matkhau",""));

        cbNhoTaiKhoan.setChecked(sharedPreferences.getBoolean("checked",false));

        txtQMK.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PhoneLoginActivity.this,ForgotPasswordActivity.class);
                startActivity(intent);
            }
        });

        btnSignin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PhoneLoginActivity.this,SignUpActivity.class);
                startActivity(intent);

            }
        });

      btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GetUser(urlUser);
            }
        });
    }

    private void GetUser(String url) {
        if(checkEditText(edtUser) && checkEditText(edtPassword)){
            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String message = "";
                    try {
                        JSONObject jsonObject = new JSONObject(response);

                        if(jsonObject.getInt("success") == 1){

                            String name = jsonObject.getString("name");

                            message = jsonObject.getString("message");

                            Toast.makeText(PhoneLoginActivity.this,message + name,Toast.LENGTH_SHORT).show();

                            if(cbNhoTaiKhoan.isChecked()){
                                SharedPreferences.Editor editor = sharedPreferences.edit();
                                editor.putString("taikhoan",edtUser.getText().toString().trim());
                                editor.putString("matkhau",edtPassword.getText().toString().trim());
                                editor.putBoolean("checked",true);
                                editor.commit();
                            }else{
                                SharedPreferences.Editor editor = sharedPreferences.edit();
                                editor.remove("taikhoan");
                                editor.remove("matkhau");
                                editor.remove("checked");
                                editor.commit();
                            }
                            Intent intent = new Intent(PhoneLoginActivity.this,HomeActivity.class);
                            startActivity(intent);
                            finish();

                        }else{
                            message = jsonObject.getString("message");
                            Toast.makeText(PhoneLoginActivity.this,message ,Toast.LENGTH_SHORT).show();
                        }

                    } catch (JSONException e) {
                        e.printStackTrace();
                        VolleyLog.d(TAG, "Error: " + e.getMessage());
                    }

                }
            },
                    new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            VolleyLog.d(TAG, "Error: " + error.getMessage());
                        }
                    }){
                @Nullable
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String,String> params = new HashMap<>();
                    params.put("user",edtUser.getText().toString().trim());
                    params.put("pass",edtPassword.getText().toString().trim());
                    return params;
                }
            };
            RequestQueue requestQueue = Volley.newRequestQueue(this);
            requestQueue.add(stringRequest);
        }
    }

    private boolean checkEditText(EditText editText) {
        if (editText.getText().toString().trim().length() > 0) {
            return true;
        } else {
            editText.setError("Vui lòng nhập dữ liệu");
        }
        return false;
    }


    private void AnhXa(){
        edtUser = (EditText) findViewById(R.id.inputuser);
        edtPassword = (EditText) findViewById(R.id.inputpassword);
        btnLogin = (Button) findViewById(R.id.login_btn);
        btnSignin = (Button) findViewById(R.id.sign_btn);
        cbNhoTaiKhoan = (CheckBox) findViewById(R.id.checkBoxTaiKhoan);
        txtQMK = (TextView) findViewById(R.id.textViewQMK);
    }
}