package com.christopherluc.superformtest.qrcode

import android.graphics.Bitmap
import android.graphics.Color
import com.google.zxing.BarcodeFormat
import com.google.zxing.MultiFormatWriter

/**
 * Takes an input string and width
 * and returns a square QR code in bitmap format
 */
fun encodeAsBitmap(str: String, width: Int): Bitmap? {
    val bitMatrix = try {
        MultiFormatWriter().encode(str, BarcodeFormat.QR_CODE, width, width, null)
    } catch (e: IllegalArgumentException) {
        return null
    }

    val bitMatrixWidth = bitMatrix.width
    val bitMatrixHeight = bitMatrix.height

    val pixels = IntArray(bitMatrixWidth * bitMatrixHeight)

    for (y in 0 until bitMatrixHeight) {
        val offset = y * bitMatrixWidth
        for (x in 0 until bitMatrixWidth) {
            pixels[offset + x] = if (bitMatrix.get(x, y)) Color.BLACK else Color.WHITE
        }
    }
    return Bitmap.createBitmap(bitMatrixWidth, bitMatrixHeight, Bitmap.Config.RGB_565).apply {
        setPixels(pixels, 0, width, 0, 0, bitMatrixWidth, bitMatrixHeight)
    }

}