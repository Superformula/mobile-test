//
//  GenerateQRViewController.swift
//  qr-scan-ios
//
//  Created by Caleb Stultz on 8/30/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class GenerateQRViewController: UIViewController {

    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        
        NetworkController().loadQRCodeSeed { (seed) in
            guard let seedData = seed else { return }
            DispatchQueue.main.async {
                self.qrCodeImageView.image = self.generateQRCode(from: seedData)
                self.spinner.stopAnimating()
            }
        }
    }
    
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
