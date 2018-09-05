//
//  NetworkController.swift
//  qr-scan-ios
//
//  Created by Caleb Stultz on 8/30/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import Foundation

class NetworkController {
    func loadQRCodeSeed(withCompletion completion: @escaping (String?) -> Void) {
        guard let url = URL(string: lambdaURL) else { return }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: headerKey)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:String] else {
                completion(nil)
                return
            }
                        
            let seed = json["seed"]
            completion(seed)
        })
        task.resume()
    }
}
