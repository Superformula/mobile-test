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
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        
        NetworkController().loadQRCodeSeed { (seed) in
            guard let seedData = seed else { return }
            DispatchQueue.main.async {
                self.qrCodeImageView.image = QRGenerator().generateQRCode(from: seedData)
                self.spinner.stopAnimating()
            }
        }
    }
}
