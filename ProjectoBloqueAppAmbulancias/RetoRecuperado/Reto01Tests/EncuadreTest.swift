//
//  EncuadreTest.swift
//  Reto01Tests
//
//  Created by Adriana López on 10/10/21.

import XCTest
@testable import Reto01

class EncuadreTest: XCTestCase {
    
    var encuadre: EncuadreViewController!

    override func setUpWithError() throws {
        encuadre = EncuadreViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        encuadre = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertNoThrow(try.encuadre.EncuadreViewController("Hola si funciona"))
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
