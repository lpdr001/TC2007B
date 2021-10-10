//
//  Sesiones.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import Foundation
import Firebase

struct Sesion: Codable {
    let id:String
    let cierre:Bool
    let evaluacion,idUsuario,servicio: String
    let fecha:String
    let cuota,numeroSesion:Int
    
    init(id:String, cierre:Bool, numeroSesion: Int, evaluacion:String, idUsuario:String, servicio:String, couta:Int , fecha:String){
        self.id = id
        self.cierre = cierre
        self.evaluacion = evaluacion
        self.idUsuario = idUsuario
        self.fecha = fecha
        self.servicio = servicio
        self.numeroSesion = numeroSesion
        self.cuota = couta
    }
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        self.cierre = aDoc.get("cierre") as? Bool ?? false
        self.fecha = aDoc.get("fecha") as? String ?? ""
        self.evaluacion = aDoc.get("evaluacion") as? String ?? ""
        self.idUsuario = aDoc.get("isUsuario") as? String ?? ""
        self.servicio = aDoc.get("servicio") as? String ?? ""
        self.numeroSesion = aDoc.get("numeroSesion")as? Int ?? 0
        self.cuota = aDoc.get("cuota")as? Int ?? 0
    }
}

typealias Sesiones = [Sesion]
