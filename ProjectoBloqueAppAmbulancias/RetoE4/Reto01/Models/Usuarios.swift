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
    let domicilio,estadoCivil,iDRA,idTanatologo,motivo,ocupacion,procedencia,referencia,religion,sexo,nombre: String
    let fechaIngreso: Date
    let cerrado:Bool
    let edad,telefono:Int
    
    /*enum CodingKeys: String, CodingKey {
        
        case domicilio
        case estadoCivil
        case iDRA
        case idTanatologo
        case motivo
        case ocupacion
        case procedencia
        case referencia
        case religion
        case sexo
        case nombre
        case fechaIngreso
        case cerrado = "cerrado"
        case edad
        case telefono
       }*/
    
    init(domicilio:String,estadoCivil:String,iDRA:String,idTanatologo:String,motivo:String,ocupacion:String,procedencia:String,referencia:String,religion:String,sexo:String, nombre:String,fechaIngreso:Date,cerrado:Bool,edad:Int,telefono:Int){
        self.domicilio = domicilio
        self.estadoCivil=estadoCivil
        self.iDRA=iDRA
        self.idTanatologo=idTanatologo
        self.motivo=motivo
        self.ocupacion=ocupacion
        self.procedencia=procedencia
        self.referencia=referencia
        self.religion=religion
        self.sexo=sexo
        self.nombre = nombre
        self.fechaIngreso = fechaIngreso
        self.cerrado = cerrado
        self.edad = edad
        self.telefono = telefono
        id = "1234"
    }
    init(id:String,domicilio:String,estadoCivil:String,iDRA:String,idTanatologo:String,motivo:String,ocupacion:String,procedencia:String,referencia:String,religion:String,sexo:String,nombre:String,fechaIngreso:Date,cerrado:Bool,edad:Int,telefono:Int){
        self.id = id
        self.domicilio = domicilio
        self.estadoCivil=estadoCivil
        self.iDRA=iDRA
        self.idTanatologo=idTanatologo
        self.motivo=motivo
        self.ocupacion=ocupacion
        self.procedencia=procedencia
        self.referencia=referencia
        self.religion=religion
        self.sexo=sexo
        self.nombre = nombre
        self.fechaIngreso  = fechaIngreso
        self.cerrado = cerrado
        self.edad = edad
        self.telefono = telefono
        
    }
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        let st = ""
        self.nombre = aDoc.get("nombre") as? String ?? st
        
        let timestamp = NSDate()
        let postTimestamp = aDoc.get("fechaIngrso") as? Timestamp ?? Timestamp(date: timestamp as Date)

        self.fechaIngreso = postTimestamp.dateValue()
        self.domicilio = aDoc.get("domicilio") as? String ?? ""
        self.estadoCivil=aDoc.get("estadoCivil") as? String ?? ""
        self.iDRA=aDoc.get("iDRA") as? String ?? ""
        self.idTanatologo=aDoc.get("idTanatologo") as? String ?? ""
        self.motivo=aDoc.get("motivo") as? String ?? ""
        self.ocupacion=aDoc.get("ocupacion") as? String ?? ""
        self.procedencia=aDoc.get("procedencia") as? String ?? ""
        self.referencia=aDoc.get("referencia") as? String ?? ""
        self.religion=aDoc.get("religion") as? String ?? ""
        self.sexo=aDoc.get("sexo") as? String ?? ""
        self.cerrado = aDoc.get("cerrado") as? Bool ?? false
        self.edad = aDoc.get("edad") as? Int ?? 1
        self.telefono = aDoc.get("telefono") as? Int ?? 1
    }
    
    static func == (left:Usuario, right:Usuario)-> Bool{return left.nombre == right.nombre }
}

typealias Usuarios = [Usuario]
