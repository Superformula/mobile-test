import Flutter
import UIKit

public class SwiftFlutterQrLibPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_qr_lib", binaryMessenger: registrar.messenger())
    
    let instance = SwiftFlutterQrLibPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let factory = QRViewFactory(messenger: registrar.messenger())
                registrar.register(factory, withId: "QR-View")
  }


}
