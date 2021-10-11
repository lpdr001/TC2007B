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
    }
    
    
    func testLogInTanatologoSuccess() throws {
        
        let test = Tanatologo(id: "123" , nombre: "Juan", password: "cetac123", user: "tanatologo1")
        var datos = [Tanatologo]()
        //var datos1 = [Administrador]()
        //var datos2 = [AdminSoporte]()
       
        
        let login = LogInViewController()
        
        datos.append(test)
        let result = login.updatedatos(with: datos, password: "cetac123", username: "tanatologo1")
        
        XCTAssertTrue(result)
            
        
        }
    
    func testLogInTanatologoFail() throws {
        
        let test = Tanatologo(id: "123" , nombre: "Juan", password: "cetac123", user: "tanatologo1")
        var datos = [Tanatologo]()
        //var datos2 = [AdminSoporte]()
        
        let login = LogInViewController()
        
        datos.append(test)
        let result = login.updatedatos(with: datos, password: "cetac", username: "tanatologo1")
        
        XCTAssertFalse(result)
            
            
        }
    
    func testLogInAdminSuccess() throws {
        
        let test = Administrador(id: "123" , nombre: "Juan", password: "cetac123", user: "admin1")
        var datos1 = [Administrador]()
        //var datos2 = [AdminSoporte]()
       
        
        let login = LogInViewController()
        
        datos1.append(test)
        let result = login.updatedatos1(with: datos1, password: "cetac123", username: "admin1")
        
        XCTAssertTrue(result)
            
        
        }
    
    func testLogInAdminFail() throws {
        
        let test = Administrador(id: "123" , nombre: "Juan", password: "cetac123", user: "admin1")
        var datos1 = [Administrador]()
        //var datos2 = [AdminSoporte]()
        
        let login = LogInViewController()
        
        datos1.append(test)
        let result = login.updatedatos1(with: datos1, password: "cetac", username: "tanatologo1")
        
        XCTAssertFalse(result)
            
            
        }
    
    func testLogInAdminSoporteSuccess() throws {
        
        let test = AdminSoporte(id: "123" , nombre: "Juan", password: "cetac123", user: "soporte1")
        var datos2 = [AdminSoporte]()
       
        
        let login = LogInViewController()
        
        datos2.append(test)
        let result = login.updatedatos2(with: datos2, password: "cetac123")
        
        XCTAssertTrue(result)
            
        
        }
    
    func testLogInAdminSoporteFail() throws {
        
        let test = AdminSoporte(id: "123" , nombre: "Juan", password: "cetac123", user: "soporte1")
        var datos2 = [AdminSoporte]()
        
        let login = LogInViewController()
        
        datos2.append(test)
        let result = login.updatedatos2(with: datos2, password: "cetac")
        
        XCTAssertFalse(result)
            
            
        }
            
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    

    func testPerformanceExample() throws {
        
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

