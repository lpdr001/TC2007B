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
    var cierre:Bool
    var evaluacion,idUsuario,servicio, intervencion, herramienta, motivo: String
    let fecha:String
    var cuota,numeroSesion:Int
    
    init(id:String, cierre:Bool, numeroSesion: Int, evaluacion:String, idUsuario:String, servicio:String, couta:Int , fecha:String, intervencion:String, herramienta:String, motivo:String){
        self.id = id
        self.cierre = cierre
        self.evaluacion = evaluacion
        self.idUsuario = idUsuario
        self.fecha = fecha
        self.servicio = servicio
        self.numeroSesion = numeroSesion
        self.cuota = couta
        self.intervencion = intervencion
        self.herramienta = herramienta
        self.motivo = motivo
    }
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        self.cierre = aDoc.get("cierre") as? Bool ?? false
        self.fecha = aDoc.get("fecha") as? String ?? ""
        self.evaluacion = aDoc.get("evaluacion") as? String ?? ""
        self.idUsuario = aDoc.get("isUsuario") as? String ?? ""
        self.servicio = aDoc.get("servicio") as? String ?? ""
        self.intervencion = aDoc.get("intervencion") as? String ?? ""
        self.herramienta = aDoc.get("herramienta") as? String ?? ""
        self.motivo = aDoc.get("motivo") as? String ?? ""
        self.numeroSesion = aDoc.get("numeroSesion")as? Int ?? 0
        self.cuota = aDoc.get("cuota")as? Int ?? 0
    }
}

typealias Sesiones = [Sesion]
