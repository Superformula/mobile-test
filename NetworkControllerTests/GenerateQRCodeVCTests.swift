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
    
    var generatorUnderTest: QRGenerator!
    var testString = "test string"

    override func setUp() {
        generatorUnderTest = QRGenerator()
    }

    override func tearDown() {
        generatorUnderTest = nil
    }
    
    func testGenerateQRCodeIsNotNil() {
        let qrCode = generatorUnderTest.generateQRCode(from: testString)
        XCTAssertNotNil(qrCode)
    }
}
