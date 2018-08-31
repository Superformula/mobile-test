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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func plusBtnWasPressed(_ sender: Any) {
        animateButtons()
    }
    
    @IBAction func generateBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func scanBtnWasPressed(_ sender: Any) {
    }
    
    func animateButtons() {
        UIView.animate(withDuration: 0.2) {
            self.qrButtons.forEach {
                $0.isHidden = !$0.isHidden
            }
        }
    }
    
}

