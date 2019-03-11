package com.superformula.qrcode.views

import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.os.CountDownTimer
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
import org.joda.time.Duration
import java.util.*
import java.util.concurrent.TimeUnit

class GenerateQrCodeActivity : AppCompatActivity() {

    private lateinit var viewModel: QrViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_generate)

        viewModel = ViewModelProviders.of(this).get(QrViewModel::class.java)

        viewModel.loadSeed().subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe{ seed -> showQrCodeAndTimer(seed) }

    }

    private fun showQrCodeAndTimer(seed: Seed) {
        qrImage.setImageBitmap(viewModel.generateQrCode(seed))
        progressSpinner.visibility = View.GONE
        qrImage.visibility = View.VISIBLE

        //show when QR code expires
        val expireDate = DateTime(seed.expiresAt, DateTimeZone.getDefault())
        expireText.text = String.format("Expires: %s", expireDate.toString("MM/dd/yyyy HH:mm:ss"))

        //setup timer to show count down expiration
        val duration = Duration(DateTime(DateTimeZone.getDefault()), expireDate)
        timer(duration.standardSeconds * 1000, 1000).start()
    }

    private fun timer(millisInFuture:Long,countDownInterval:Long): CountDownTimer {
        return object: CountDownTimer(millisInFuture,countDownInterval){
            override fun onTick(millisUntilFinished: Long){
                countdown.text = String.format(Locale.getDefault(), "Time Remaining %02d min: %02d sec",
                        TimeUnit.MILLISECONDS.toMinutes(millisUntilFinished) % 60,
                        TimeUnit.MILLISECONDS.toSeconds(millisUntilFinished) % 60)
            }

            override fun onFinish() {
                countdown.text = "Expired!"
            }
        }
    }

}
