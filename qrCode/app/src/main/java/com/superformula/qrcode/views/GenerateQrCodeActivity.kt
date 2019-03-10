package com.superformula.qrcode.views

import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import com.superformula.qrcode.R
import com.superformula.qrcode.models.Seed
import com.superformula.qrcode.viewModels.QrViewModel
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import kotlinx.android.synthetic.main.activity_generate.*
import org.joda.time.DateTime
import org.joda.time.DateTimeZone

class GenerateQrCodeActivity : AppCompatActivity() {

    private lateinit var viewModel: QrViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_generate)

        viewModel = ViewModelProviders.of(this).get(QrViewModel::class.java)

        viewModel.loadSeed().subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe{ seed -> showQrCode(seed) }

    }

    private fun showQrCode(seed: Seed) {
        qrImage.setImageBitmap(viewModel.generateQrCode(seed))
        progressSpinner.visibility = View.GONE
        qrImage.visibility = View.VISIBLE
        val expireDate = DateTime(seed.expiresAt, DateTimeZone.getDefault())

        expireText.text = String.format("Expires: %s", expireDate.toString("MM/dd/yyyy HH:mm:ss"))
    }

}
