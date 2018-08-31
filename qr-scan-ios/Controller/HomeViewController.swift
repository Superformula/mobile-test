//
//  HomeViewController.swift
//  qr-scan-ios
//
//  Created by Caleb Stultz on 8/30/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var plusBtn: MaterialButton!
    @IBOutlet var qrButtons: [UIButton]! {
        didSet {
            qrButtons.forEach {
                $0.isHidden = true
            }
        }
    }
    
    @IBAction func plusBtnWasPressed(_ sender: Any) {
        animateButtons()
    }
    
    @IBAction func generateBtnWasPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GenerateQRViewController") as? GenerateQRViewController {
            vc.navigationItem.title = "Generate QR Code"
            if let navController = navigationController {
                navController.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func scanBtnWasPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ScanQRViewController") as? ScanQRViewController {
            vc.navigationItem.title = "Scan QR Code"
            if let navController = navigationController {
                navController.pushViewController(vc, animated: true)
            }
        }
    }
}

extension HomeViewController {
    func animateButtons() {
        UIView.animate(withDuration: 0.2) {
            self.qrButtons.forEach {
                $0.isHidden = !$0.isHidden
            }
        }
    }
}
