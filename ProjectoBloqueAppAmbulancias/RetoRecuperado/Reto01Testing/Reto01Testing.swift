//
//  Reto01Testing.swift
//  Reto01Testing
//
//  Created by user193889 on 10/10/21.
//

import XCTest
 @testable import Reto01



class Reto01Testing: XCTestCase {
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let sesion = SesionesController()
        
        
        sesion.fetchSesiones(st:""){ (result) in
            switch result{
            case .success:XCTAssert(true)
            case .failure:XCTAssert(false)
            }
        }
    
    
    func test1 () throws {
        
        let test = Tanatologo(id: "123" , nombre: "Juan", password: "cetac123", user: "tanatologo1")
        var datos = [Tanatologo]()
        //var datos1 = [Administrador]()
        //var datos2 = [AdminSoporte]()
       
        
        let login = LogInViewController()
        
        datos.append(test)
        let result = login.updatedatos(with: datos, password: "cetac123", username: "tanatologo1")
        
        XCTAssertTrue(result)
        
        
            
            
        }
            
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}