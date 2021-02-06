//
//  QRViewFactory.swift
//  flutter_qr_lib
//
//  Created by Scott Cornell on 2/6/21.
//

import Foundation
import Flutter


class QRViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        
       
        return QRView(
           viewIdentifier: viewId,
            binaryMessenger: messenger)
    }
}
