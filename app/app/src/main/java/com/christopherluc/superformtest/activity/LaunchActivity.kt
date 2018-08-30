package com.christopherluc.superformtest.activity

import android.databinding.DataBindingUtil
import android.databinding.ObservableField
import android.graphics.Bitmap
import android.os.Bundle
import android.support.design.widget.Snackbar
import android.support.v7.app.AppCompatActivity
import android.util.Log
import com.christopherluc.superformtest.R
import com.christopherluc.superformtest.api.QRCodeService
import com.christopherluc.superformtest.databinding.ActivityLaunchBinding
import com.christopherluc.superformtest.qrcode.encodeAsBitmap
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable

/**
 * Activity launched when app is opened
 *
 */
class LaunchActivity : AppCompatActivity() {

    lateinit var binding: ActivityLaunchBinding
    val disposable = CompositeDisposable()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_launch)

        binding = DataBindingUtil.setContentView(this, R.layout.activity_launch)
        binding.viewModel = ViewModel()

        disposable.add(QRCodeService.getSeed().observeOn(AndroidSchedulers.mainThread()).subscribe({
            binding.viewModel?.bitmap?.set(
                encodeAsBitmap(
                    it.seed,
                    resources.getDimensionPixelSize(R.dimen.qr_code_dimen)
                )
            )
            binding.viewModel?.expiration?.set(it.expires_at)
        }, {
            Snackbar.make(binding.root, "Failure getting QR Code data", Snackbar.LENGTH_LONG).show()
            Log.e(LaunchActivity::class.java.simpleName, "Exception: ", it)
        }))
    }

    override fun onDestroy() {
        super.onDestroy()
        disposable.takeUnless { it.isDisposed }?.dispose()
    }
}

class ViewModel {
    val bitmap = ObservableField<Bitmap>()
    val expiration = ObservableField<String>()
}