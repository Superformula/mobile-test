package com.superformula.qrcode.views

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.superformula.qrcode.R
import com.superformula.qrcode.viewModels.QrViewModel

class ScanQrCodeActivity : AppCompatActivity() {

    private lateinit var viewModel: QrViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_scan)

    }

}