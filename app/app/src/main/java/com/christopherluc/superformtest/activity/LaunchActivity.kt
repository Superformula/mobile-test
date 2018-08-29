package com.christopherluc.superformtest.activity

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.christopherluc.superformtest.R
import com.christopherluc.superformtest.qrcode.encodeAsBitmap

import kotlinx.android.synthetic.main.activity_launch.*

/**
 * Activity launched when app is opened
 *
 */
class LaunchActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_launch)
        imageView.setImageBitmap(
            encodeAsBitmap(
                "test value",
                resources.getDimensionPixelSize(R.dimen.qr_code_dimen)
            )
        )
    }

}
