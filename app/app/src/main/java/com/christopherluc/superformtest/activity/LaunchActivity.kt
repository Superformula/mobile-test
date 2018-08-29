package com.christopherluc.superformtest.activity

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.design.widget.Snackbar
import android.util.Log
import com.christopherluc.superformtest.R
import com.christopherluc.superformtest.api.QRCodeService
import com.christopherluc.superformtest.qrcode.encodeAsBitmap
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable

import kotlinx.android.synthetic.main.activity_launch.*

/**
 * Activity launched when app is opened
 *
 */
class LaunchActivity : AppCompatActivity() {

    val disposable = CompositeDisposable()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_launch)


        disposable.add(QRCodeService.getSeed().observeOn(AndroidSchedulers.mainThread()).subscribe({
           imageView.setImageBitmap(encodeAsBitmap(it.seed, resources.getDimensionPixelSize(R.dimen.qr_code_dimen)))
        }, {
            Snackbar.make(root, "Failure getting QR Code data", Snackbar.LENGTH_LONG).show()
            Log.e(LaunchActivity::class.java.simpleName, "Exception: ", it)
        }))
    }

    override fun onDestroy() {
        super.onDestroy()
        disposable.takeUnless { it.isDisposed }?.dispose()
    }
}
