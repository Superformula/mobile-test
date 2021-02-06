//
//  QRView.swift
//  flutter_qr_lib
//
//  Created by Scott Cornell on 2/6/21.
//

import Foundation

import Flutter
import UIKit

class QRView: NSObject, FlutterPlatformView{
    private var _view: UIImageView
    private var _channel: FlutterMethodChannel

    init(
        viewIdentifier viewId: Int64,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIImageView()

        _channel = FlutterMethodChannel(name: "qr_native_\(viewId)", binaryMessenger: messenger!)
        
        
        super.init()
        
        _channel.setMethodCallHandler(handle)
    }
    

    
    func view() -> UIView {
        return _view
    }
    
    
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        guard call.method == "loadSeed" else{
            result(FlutterMethodNotImplemented)
            return
        }
        
        if let args = call.arguments as? Dictionary<String, Any>,
           let seed = args["seed"] as? String{
           
            _view.image = generateQRCode(from: seed)
        }
        
        
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
}
