//
//  NetworkControllerTests.swift
//  NetworkControllerTests
//
//  Created by Caleb Stultz on 8/30/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import qr_scan_ios

class NetworkControllerTests: XCTestCase {
    
    var controllerUnderTest: NetworkController!

    override func setUp() {
        controllerUnderTest = NetworkController()
    }

    override func tearDown() {
        controllerUnderTest = nil
    }

    func testQRSeedLoaded() {
        controllerUnderTest.loadQRCodeSeed { (seed) in
            XCTAssertNotNil(seed)
        }
    }
}

