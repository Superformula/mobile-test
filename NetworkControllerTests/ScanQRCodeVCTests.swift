//
//  ScanQRCodeVCTests.swift
//  NetworkControllerTests
//
//  Created by Caleb Stultz on 8/30/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import qr_scan_ios

class ScanQRCodeVCTests: XCTestCase {
    
    var controllerUnderTest: ScanQRViewController!
    var testString = "test string"

    override func setUp() {
        controllerUnderTest = ScanQRViewController()
    }

    override func tearDown() {
        controllerUnderTest = nil
    }
    
    func testCaptureSessionIsNotNil() {
        controllerUnderTest.viewDidLoad()
        XCTAssertNotNil(controllerUnderTest.captureSession)
    }

    func testScanLabelIsNotNil() {
        controllerUnderTest.viewWillAppear(true)
        XCTAssertNotNil(controllerUnderTest.qrCodeDataLabel)
    }

    func testPreviewLayerIsNotNil() {
        controllerUnderTest.viewDidLoad()
        XCTAssertNotNil(controllerUnderTest.previewLayer)
    }
    
    func testScanFailureDoesResetCaptureSession() {
        controllerUnderTest.viewDidLoad()
        controllerUnderTest.failed()
        XCTAssertNil(controllerUnderTest.captureSession)
    }
    
    func testQRScanDoesSetText() {
        controllerUnderTest.viewDidLoad()
        controllerUnderTest.viewWillAppear(true)
        controllerUnderTest.found(code: testString)
        XCTAssertEqual(controllerUnderTest.qrCodeDataLabel.text, testString)
    }
}
