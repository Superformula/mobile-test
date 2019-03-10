package com.superformula.qrcode.viewModels

import android.graphics.Bitmap
import com.google.zxing.BarcodeFormat
import com.google.zxing.MultiFormatWriter
import com.journeyapps.barcodescanner.BarcodeEncoder
import com.superformula.qrcode.data.QrRepository
import com.superformula.qrcode.models.Seed
import io.reactivex.Observable
import org.joda.time.DateTime
import org.joda.time.DateTimeZone
import javax.inject.Inject

class QrViewModel:BaseViewModel() {

    @Inject
    lateinit var repository: QrRepository

    fun loadSeed() : Observable<Seed> {
        return repository.getSeed()
    }

    fun isQrCodeValid(qrCodeData: String) : Boolean {
        val dataParts = qrCodeData.split("|")
        val currentDate = DateTime(DateTimeZone.UTC)
        val expireDate = DateTime.parse(dataParts[1])

        return currentDate.isBefore(expireDate)
    }

    fun generateQrCode(seed: Seed) : Bitmap {
        var contents = seed.seed + "|" + seed.expiresAt
        var multiFormateWriter = MultiFormatWriter()
        var bitMatrix = multiFormateWriter.encode(contents,BarcodeFormat.QR_CODE, 1000, 1000)
        var barcodeEncoder = BarcodeEncoder()
        return barcodeEncoder.createBitmap(bitMatrix)
    }
}
