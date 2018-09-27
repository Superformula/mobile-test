//
//  DisplayQRCodeViewModel.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import UIKit


typealias FinishedCompletionHandler = ((Seed?) -> ())

class DisplayQRCodeViewModel: NSObject {
    
    private var service: Networking!
    
    //MARK: - ViewLifeCycle
    override init() {
        self.service = Networking()
        super.init()
    }
    
    //MARK: - Fetch
    func fetchSeed(withCompletion completion: @escaping FinishedCompletionHandler) {
        DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.service.getSeed(completion: { (seed, resultStatus) in
                switch resultStatus {
                case .success:
                    print("Success - \(String(describing: seed)):)")
                    completion(seed)
                case .error:
                    print("Log Error - Seed Failed)")
                    completion(seed)
                }
            })
        }
    }
    
    //MARK: - Access
}
