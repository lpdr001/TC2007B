//
//  Sesiones.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import Foundation
import Firebase

class Sesion: Codable {
    let id:String
    let cierre:Bool
    let fecha,idUsuario,servicio: String
    let numeroSesion:Int
    init(cierre:Bool, fecha:String, idUsuario:String, servicio:String){
        self.cierre = cierre
        self.fecha = fecha
        self.idUsuario = idUsuario
        self.servicio = servicio
        numeroSesion = 0
        id = "1234"
    }
    init(id:String, cierre:Bool, fecha:String, numeroSesion:Int, idUsuario:String, servicio:String){
        self.id = id
        self.cierre = cierre
        self.fecha = fecha
        self.idUsuario = idUsuario
        self.servicio = servicio
        self.numeroSesion = numeroSesion
    }
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        self.cierre = aDoc.get("cierre") as? Bool ?? false
        self.fecha = aDoc.get("fecha") as? String ?? ""
        self.idUsuario = aDoc.get("isUsuario") as? String ?? ""
        self.servicio = aDoc.get("servicio") as? String ?? ""
        self.numeroSesion = aDoc.get("numeroSesion")as? Int ?? 0
    }
}

typealias Sesiones = [Sesion]
