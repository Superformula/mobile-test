package com.sdc.flutter_qr_lib

import android.content.Context
import android.view.View
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class QRViewFactory(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val binding: FlutterPlugin.FlutterPluginBinding = flutterPluginBinding
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return QRView(context, viewId, binding)
    }
}