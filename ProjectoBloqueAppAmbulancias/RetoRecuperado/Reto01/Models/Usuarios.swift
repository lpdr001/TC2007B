//
//  Usuarios.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import Foundation
import Firebase

struct Usuario: Codable {
    let id:String
    let nombre,fechaIngreso: String
    init(nombre:String, fechaIngreso:String){
        self.nombre = nombre
        self.fechaIngreso  = fechaIngreso
        id = "1234"
    }
    init(id:String, nombre:String, fechaIngreso:String){
        self.id = id
        self.nombre = nombre
        self.fechaIngreso  = fechaIngreso
    }
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        self.nombre = aDoc.get("nombre") as? String ?? ""
        self.fechaIngreso = aDoc.get("fechaIngreso") as? String ?? ""
    }
}

typealias Usuarios = [Usuario]
