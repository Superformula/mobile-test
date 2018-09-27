//
//  Environment.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import Foundation

public enum PlistKey {
    case ServerURL
    case ConnectionTimeout
    case ConnectionProtocol
    
    func value() -> String {
        switch self {
        case .ServerURL:
            return "server_url"
        case .ConnectionTimeout:
            return "timeout_interval"
        case .ConnectionProtocol:
            return "protocol"
        }
    }
    
}

public struct Environment {
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    public func configuration(_ key: PlistKey) -> String {
        switch key {
        case .ServerURL:
            return infoDict[PlistKey.ServerURL.value()] as! String
        case .ConnectionTimeout:
            return infoDict[PlistKey.ConnectionTimeout.value()] as! String
        case .ConnectionProtocol:
            return infoDict[PlistKey.ConnectionProtocol.value()] as! String
        }
    }
    
}
