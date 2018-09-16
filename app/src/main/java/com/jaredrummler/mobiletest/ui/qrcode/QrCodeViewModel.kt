package com.jaredrummler.mobiletest.ui.qrcode

import android.arch.lifecycle.MutableLiveData
import android.arch.lifecycle.ViewModel
import com.google.zxing.BarcodeFormat
import com.jaredrummler.mobiletest.injector
import com.jaredrummler.mobiletest.networking.FailedResult
import com.jaredrummler.mobiletest.networking.Result
import com.jaredrummler.mobiletest.networking.SeedApi
import com.jaredrummler.mobiletest.networking.SeedResult
import com.journeyapps.barcodescanner.BarcodeEncoder
import io.reactivex.Single
import timber.log.Timber
import javax.inject.Inject

class QrCodeViewModel : ViewModel() {

  @Inject lateinit var api: SeedApi
  @Inject lateinit var encoder: BarcodeEncoder

  val seed = MutableLiveData<Result>()

  init {
    injector().inject(this)
  }

  fun loadSeed() {
    api.getSeed()
        .flatMap mapToResult@{
          val qrcode = encoder.encodeBitmap(it.seed, BarcodeFormat.QR_CODE, QR_CODE_SIZE, QR_CODE_SIZE)
          return@mapToResult Single.just(SeedResult(it, qrcode))
        }
        .subscribe({ result ->
          seed.value = result
        }, { e ->
          Timber.e(e, "Error fetching seed")
          seed.value = FailedResult()
        })
  }

  companion object {
    private const val QR_CODE_SIZE = 400
  }

}


