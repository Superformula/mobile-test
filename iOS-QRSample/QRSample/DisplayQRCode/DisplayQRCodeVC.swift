//
//  DisplayQRCodeVC.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import UIKit

class DisplayQRCodeVC: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var seedLabel: UILabel!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    private var viewModel: DisplayQRCodeViewModel!
    private var qrcodeImage: CIImage!

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupObjs()
        self.fetchData()
    }
    
    //MARK: - Setup
    private func setupObjs() {
        self.viewModel = DisplayQRCodeViewModel()
    }
    
    private func setupView() {
        
    }
    
    //MARK: - Fetch
    private func fetchData() {
        //Fetch QR Code Endpoint
        self.viewModel.fetchSeed { [weak self] seed in
            guard let strongSelf = self, let seed = seed, let value = seed.value else {
                self?.displayAlertController(withAlertStyle: .alert, withTitle: "Error", withMesssage: "With Fetching Seed from Server", withActions: [])
                self?.seedLabel.text = "Error occured"
                self?.generateButton.isHidden = false
                return
            }
            strongSelf.displayQRCode(withSeed: value)
        }
    }
    
    //MARK: - Utilities
    private func displayQRCode(withSeed seedValue: String) {
        let data = seedValue.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        self.qrcodeImage = filter?.outputImage
        let scaleX = self.imageView.frame.size.width / qrcodeImage.extent.size.width
        let scaleY = self.imageView.frame.size.height / qrcodeImage.extent.size.height
        let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
        self.imageView.image = UIImage(ciImage: transformedImage)
        self.seedLabel.text = "Seed: \(seedValue)"
        self.generateButton.isHidden = false
    }
    
    //MARK: - Actions
    @IBAction func onTouchGenerateNew(_ sender: UIButton) {
        self.seedLabel.text = "Loading..."
        self.generateButton.isHidden = true
        self.imageView.image = nil
        self.fetchData()
    }
    
}
