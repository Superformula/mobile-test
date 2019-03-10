package com.superformula.qrcode.views

import android.arch.lifecycle.ViewModelProviders
import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.widget.Toast
import com.google.zxing.integration.android.IntentIntegrator
import com.superformula.qrcode.R
import com.superformula.qrcode.viewModels.QrViewModel
import kotlinx.android.synthetic.main.activity_scan.*

class ScanQrCodeActivity : AppCompatActivity() {

    private var qrScan: IntentIntegrator? = null
    private lateinit var viewModel: QrViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_scan)

        viewModel = ViewModelProviders.of(this).get(QrViewModel::class.java)

        qrScan = IntentIntegrator(this)
        qrScan?.initiateScan()
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        val result = IntentIntegrator.parseActivityResult(requestCode, resultCode, data)
        if (result != null) {
            // If QRCode has no data.
            if (result.contents == null) {
                Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show()
            } else {
                // If QRCode contains data.
                try {
                    Log.e("ScanQr", result.contents)
                    if (viewModel.isQrCodeValid(result.contents)) {
                        Log.e("ScanQr", "QR Code is valid")
                        statusText.text = "QR Code has not expired."
                        statusImage.setImageResource(R.drawable.ic_valid)
                    } else {
                        Log.e("ScanQr","QR code is IN VALID")
                        statusText.text = "QR Code has Expired (INVALID)"
                        statusImage.setImageResource(R.drawable.ic_invalid)
                    }

                } catch (e: Exception) {
                    e.printStackTrace()
                    Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show()
                }
            }
        } else {
            super.onActivityResult(requestCode, resultCode, data)
        }
    }

}