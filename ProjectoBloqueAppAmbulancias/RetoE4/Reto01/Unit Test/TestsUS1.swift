//
//  TestsUS1.swift
//  Reto01
//
//  Created by user193889 on 10/10/21.
//

import XCTest

class TestsUS1: XCTestCase {

    override func setUpWithNullError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let sesion = SesionesController()
        
        let result = sesion.EditUsuario(sn:nil)        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
