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
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    private var viewModel: DisplayQRCodeViewModel!
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
            guard let strongSelf = self, let seed = seed else {
                self?.displayAlertController(withAlertStyle: .alert, withTitle: "Error", withMesssage: "With Fetching Seed from Server", withActions: [])
                return
            }
            strongSelf.displayQRCode(withSeed: seed)
        }
    }
    
    //MARK: - Utilities
    private func displayQRCode(withSeed seed: Seed) {
        self.displayAlertController(withAlertStyle: .alert, withTitle: "Seed", withMesssage: "\(String(describing: seed.seed))", withActions: [])

    }
    
}
