//
//  Seed.swift
//  QRSample
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import Foundation

struct Seed: Codable {
    
    //MARK: - Properties
    var seed: String?
    
    //MARK: - Coding Keys enum
    private enum CodingKeys: String, CodingKey {
        case seed
    }
    
    //MARK: - LifeCycle
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seed = try container.decodeIfPresent(String.self, forKey: .seed)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.seed, forKey: .seed)
    }
    
}
