//
//  Networking.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import Alamofire

enum ResultStatus {
    case success
    case error
}


class Networking: NSObject {
    
    //MARK: - Properties
    let serverURL = Environment().configuration(PlistKey.ServerURL)
    let connectionTimeout = Environment().configuration(PlistKey.ConnectionTimeout)
    let connectionProtocol = Environment().configuration(PlistKey.ConnectionProtocol)
    let networkingQueue = DispatchQueue.global(qos: .background)
    
    //MARK: - GET
    func getSeed(completion: @escaping (Seed?, ResultStatus) -> ()) {
        let url = "http://127.0.0.1:5000/seed"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(request).validate(statusCode: 200..<202).validate(contentType: ["application/json"]).responseData(queue: self.networkingQueue) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let data):
                    do {
                        let seed = try JSONDecoder().decode(Seed.self, from: data)
                        print("Successfully getSeed - \(seed)")
                        completion(seed, .success)
                    } catch {
                        print("Fetch - catch - \(error.localizedDescription)")
                        completion(nil, .error)
                    }
                case .failure(let error):
                    print("Failure getSeed - \(error.localizedDescription)")
                    completion(nil, .error)
                }
            }
        }
    }
    
}

