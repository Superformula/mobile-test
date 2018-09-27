//
//  QRSampleTests.swift
//  QRSampleTests
//
//  Created by Lamar Jay Caaddfiir on 9/26/18.
//  Copyright © 2018 Super QR Sample. All rights reserved.
//

import XCTest
@testable import QRSample
import OHHTTPStubs

class QRSampleTests: XCTestCase {

    //MARK: - Properties
    var host: String!
    var path: String!
    var stubbedJSON: [String : Any]!
    let serverURL = "http://localhost:5000"
    let connectionTimeout = Environment().configuration(PlistKey.ConnectionTimeout)
    let connectionProtocol = Environment().configuration(PlistKey.ConnectionProtocol)
    let networkingQueue = DispatchQueue.global(qos: .background)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        self.host = ""
        self.path = ""
        self.stubbedJSON = [:]
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func testGetSeed() {
        self.host = "\(self.connectionProtocol)://" + "\(self.serverURL)"
        self.path = "/seed"

        // Expectation
        let sExpectation = self.expectation(description: "We expected the method's completion handler to be called.")
        
        // Code Under Test
        let network = Networking()
        network.getSeed(completion: { (seed, resultStatus) in
            XCTAssertNotNil(seed)
            XCTAssert(resultStatus == .success)
            sExpectation.fulfill()
        })
        self.waitForExpectations(timeout: 5.0, handler: .none)
    }

}
