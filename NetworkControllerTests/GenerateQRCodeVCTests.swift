//
//  GenerateQRCodeVCTests.swift
//  NetworkControllerTests
//
//  Created by Caleb Stultz on 8/30/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import qr_scan_ios

class GenerateQRCodeVCTests: XCTestCase {
    
    var controllerUnderTest: GenerateQRViewController!
    var testString = "test string"

    override func setUp() {
        controllerUnderTest = GenerateQRViewController()
    }

    override func tearDown() {
        controllerUnderTest = nil
    }

    func testGenerateQRCodeIsNotNil() {
        let qrCode = controllerUnderTest.generateQRCode(from: testString)
        XCTAssertNotNil(qrCode)
    }
}
