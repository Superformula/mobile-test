package com.sdc.flutter_qr_lib

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Color
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import com.google.zxing.MultiFormatWriter
import com.google.zxing.BarcodeFormat
import com.google.zxing.WriterException

internal class QRView(context: Context, id: Int, flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) : PlatformView {
    private val imageView: ImageView = ImageView(context)
    private val channel: MethodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "qr_native_$id")

    override fun getView(): View {
        return imageView

    }

    override fun dispose() {}

    init {

        channel.setMethodCallHandler{
            call, result ->
            if (call.method == "loadSeed") {
                @Suppress("UNCHECKED_CAST")
                var args = call.arguments as Map<String, String>
                args.get("seed")?.let { generateQRCode(it, result) }

            } else {
                result.notImplemented()
            }
        }
    }

    private fun generateQRCode(text: String, result: MethodChannel.Result){
        val width = 500
        val height = 500
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val codeWriter = MultiFormatWriter()
        try {
            val bitMatrix = codeWriter.encode(text, BarcodeFormat.QR_CODE, width, height)
            for (x in 0 until width) {
                for (y in 0 until height) {
                    bitmap.setPixel(x, y, if (bitMatrix[x, y]) Color.BLACK else Color.WHITE)
                }
            }
            imageView.setImageBitmap(bitmap)
            result.success(true)

        } catch (e: WriterException) {
            result.error("Error generating QR code", e.toString(), null)
        }

    }
}