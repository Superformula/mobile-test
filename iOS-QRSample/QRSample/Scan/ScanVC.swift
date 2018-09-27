//
//  ScanVC.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import UIKit

class ScanVC: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var seedLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.fetchData()
    }

    //MARK: - Setup
    private func setupView() {
        
    }
    //MARK: - Fetch
    private func fetchData() {
        
    }
    
    //MARK: - Utilities
    private func displayWebVC(withLink link: String) {
        
    }
    
    //MARK: - onTouch
    @IBAction func onTouchShareButton(_ sender: UIButton) {
        
    }

    func shareTextButton(text: String) {
        let text = "This is some text that I want to share."
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ .airDrop, .postToFacebook, .mail, .message ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func shareImage(image: UIImage) {
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        activityViewController.excludedActivityTypes = [ .airDrop, .postToFacebook, .mail, .message ]
        self.present(activityViewController, animated: true, completion: nil)
    }
}
