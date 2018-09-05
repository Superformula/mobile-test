//
//  QRGenerator.swift
//  qr-scan-ios
//
//  Created by Caleb Stultz on 8/31/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import Foundation
import UIKit

class QRGenerator {
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
