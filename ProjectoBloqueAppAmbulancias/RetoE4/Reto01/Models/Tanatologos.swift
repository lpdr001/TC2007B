//
//  Tanatologos.swift
//  Reto01
//
//  Created by Paola Diaz on 07/10/21.
//

import Foundation
import Firebase

struct Tanatologo: Codable {
    let id:String
    let nombre,password,user: String
    
    
    init(id:String, nombre:String, password:String, user:String){
        self.id = id
        self.nombre = nombre
        self.password  = password
        self.user = user
    }
    
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        self.nombre = aDoc.get("nombre") as? String ?? ""
        self.password = aDoc.get("password") as? String ?? ""
        self.user = aDoc.get("user") as? String ?? ""
        
    }
}

typealias Tanatologos = [Tanatologo]
