//  ViewController.swift
//  QRGenerator
//  Created by Jacob Ross Dobson on 8/15/18.
//  Copyright © 2018 Jacob Ross Dobson. All rights reserved.
import UIKit
import CoreImage
import Alamofire

class ViewController: UIViewController {
//MARK: globals
	//constants
	let seedURL = "https://8mpaf1q1g5.execute-api.us-west-1.amazonaws.com/default/random-qr-seed_seed"
	let headers: HTTPHeaders = ["x-api-key"	: "VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6",
								  "Accept"	: "application/json"]
	//vars
	var apiKey: String?
	var QRCodeImg: CIImage!
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
	//api request
	func requestSeed(completion: @escaping (String?, Error?) -> ()) -> () {
		Alamofire.request(seedURL, headers: headers).validate().responseJSON { response in
			if response.result.isSuccess {
				if let jsonDict = response.result.value as?  [String : String] {
					let seed = (jsonDict["seed"]!)
					let error = response.error
					completion(seed, error)
				}
			}
		}
	}
	//setup CIImage from seed as qr code...return as UIImage
	func createCoreImage(seed: String) {
		let strSeed = seed.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
		let filter  = CIFilter(name: "CIQRCodeGenerator")
		//set filter value for strSeed to convert to QRCode --> "inputMessage"
		filter?.setValue(strSeed, forKey: "inputMessage")
		//set value for amount of data entered into each QRCode image --> higher % => larger output
		//L => 7%    M => 15%    Q => 25    H => 30%
		filter?.setValue("Q", forKey: "inputCorrectionLevel")
		//set output image...convert ciImage => UIImage
		self.QRCodeImg = filter?.outputImage
		self.QRCodeImageView.image = UIImage(ciImage: self.QRCodeImg)
		transformQRCodeImg(img: self.QRCodeImageView.image!)
	}
	//transform qr code image so is no longer blurry
	func transformQRCodeImg(img: UIImage) {
		//scale factor for each axis of QRCode image
		let scaleX = QRCodeImageView.frame.size.width  / QRCodeImg.extent.size.width
		let scaleY = QRCodeImageView.frame.size.height / QRCodeImg.extent.size.height
		//new ciImage from above transformation...
		let transformedQRImg = QRCodeImg.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
		//serve newly created & transformed image to QR code image view
		QRCodeImageView.image = UIImage(ciImage: transformedQRImg)
//		return QRCodeImageView.image!
	}
	//reset image view and generate button
	func resetButtonAndImg() {
		//set image and imageView to nil and return/keep button title to "Generate"
		QRCodeImageView.image = nil
		QRCodeImageView.layer.borderColor = UIColor.lightGray.cgColor
		QRCodeImg = nil
		generateQRCodeButton.setTitle("Generate", for: UIControlState.normal)
		generateQRCodeButton.backgroundColor = UIColor.blue
	}
	//set clear state of button
	func clearButtonState() {
		generateQRCodeButton.setTitle("CLEAR", for: UIControlState.normal)
		generateQRCodeButton.backgroundColor = UIColor.red
	}
//MARK: actions
	//create/remove qr code when user clicks generate/clear button
	@IBAction func generateQRCodeButtonAction(_ sender: UIButton) {
		//if no QRCode has been generated...get on with the chlorophyl!
		if QRCodeImg == nil {
			QRCodeImageView.layer.borderColor = UIColor.clear.cgColor
			requestSeed { (seed, error) in
				if seed != nil {
					self.createCoreImage(seed: seed!)
				} else {
					print("FAILURE: \(String(describing: error))")
					self.resetButtonAndImg()
				}
			}
			clearButtonState()
		} else {
			resetButtonAndImg()
		}
	}
}
