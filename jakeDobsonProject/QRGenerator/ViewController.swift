//  ViewController.swift
//  QRGenerator
//  Created by Jacob Ross Dobson on 8/15/18.
//  Copyright © 2018 Jacob Ross Dobson. All rights reserved.
import UIKit
import CoreImage
import Alamofire

class ViewController: UIViewController {
//MARK: globals
	var QRCodeImg: CIImage!
	let headers: HTTPHeaders = [
		"x-api-key" : "VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6",
		"Accept"	: "application/json"
	]
//MARK: outlets
	@IBOutlet weak var generateQRCodeButton: UIButton!
	@IBOutlet weak var QRCodeImageView: UIImageView!
//MARK: life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		QRCodeImageView.layer.borderWidth = 1
		QRCodeImageView.layer.borderColor = UIColor.gray.cgColor
	}
//MARK: helpers
	//transform qr code image so is no longer blurry
	func displayQRCodeImg() {
		//scale factor for each axis of QRCode image
		let scaleX = QRCodeImageView.frame.size.width  / QRCodeImg.extent.size.width
		let scaleY = QRCodeImageView.frame.size.height / QRCodeImg.extent.size.height
		//new ciImage from above transformation...
		let transformedQRImg = QRCodeImg.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
		//serve newly created & transformed image to QR code image view
		QRCodeImageView.image = UIImage(ciImage: transformedQRImg)
	}
//MARK: actions
	//create/remove qr code when user clicks generate/clear button
	@IBAction func generateQRCodeButtonAction(_ sender: UIButton) {
		//if no QRCode has been generated...get on with the chlorophyl!
		if QRCodeImg == nil {
			QRCodeImageView.layer.borderColor = UIColor.clear.cgColor
			Alamofire.request("https://8mpaf1q1g5.execute-api.us-west-1.amazonaws.com/default/random-qr-seed_seed",
							  headers: headers).validate().responseJSON { response in
								if response.result.isSuccess {
									if let json = response.result.value as? [String : String] {
										let seed = (json["seed"]!)
										//need to encode String(seed) as a "rawValue" to play nicely with the value for CIFilter
										let data = seed.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
										let filter = CIFilter(name: "CIQRCodeGenerator")
										//set filter value for data to convert to QRCode --> "inputMessage"
										filter?.setValue(data, forKey: "inputMessage")
										//set value for amount of data entered into each QRCode image --> higher % => larger output
										//L => 7%    M => 15%    Q => 25    H => 30%
										filter?.setValue("M", forKey: "inputCorrectionLevel")
										//set output image...convert ciImage => UIImage
										self.QRCodeImg = filter?.outputImage
										self.QRCodeImageView.image = UIImage(ciImage: self.QRCodeImg)
										//call custom func to transform image so it's not blurry...
										self.displayQRCodeImg()
									}
								} else if response.result.isFailure {
									print("FAILURE: \(String(describing: response.error))")
								}
			}
			//clearing QRCodeImage
			generateQRCodeButton.setTitle("CLEAR", for: UIControlState.normal)
			generateQRCodeButton.backgroundColor = UIColor.red
		} else {
			//set image and imageView to nil and return/keep button title to "Generate"
			QRCodeImageView.image = nil
			QRCodeImageView.layer.borderColor = UIColor.lightGray.cgColor
			QRCodeImg = nil
			generateQRCodeButton.setTitle("Generate", for: UIControlState.normal)
			generateQRCodeButton.backgroundColor = UIColor.blue
		}
	}
}
