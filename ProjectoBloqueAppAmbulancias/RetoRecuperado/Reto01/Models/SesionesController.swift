//
//  SesionesController.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import Foundation
import Firebase


class SesionesController{
    
    let db = Firestore.firestore()
    
    func EditUsuario(sn:Sesion){
        db.collection("Sesiones").document(sn.id).setData([
            "cierre" : sn.cierre,
            "evaluacion" : sn.evaluacion,
            "idUsuario":sn.idUsuario,
            "fecha": sn.fecha,
            "servicio" : sn.servicio,
            "numeroSesion": sn.numeroSesion,
            "cuota": sn.cuota,
            "motivo":sn.motivo,
            "herramienta":sn.herramienta,
            "intervencion":sn.intervencion
        ])
    }
    
    func SendSesion(sn:Sesion){
        var ref: DocumentReference? = nil
        ref = db.collection("Sesiones").addDocument(data: [
            "cierre" : sn.cierre,
            "evaluacion" : sn.evaluacion,
            "idUsuario":sn.idUsuario,
            "fecha": sn.fecha,
            "servicio" : sn.servicio,
            "numeroSesion": sn.numeroSesion,
            "cuota": sn.cuota,
            "motivo":sn.motivo,
            "herramienta":sn.herramienta,
            "intervencion":sn.intervencion

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        //db.collection("Usuarios").setData()
    }
    
    func fetchOneSesion(st:String,stt:Int, completion: @escaping (Result<Sesiones, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var sesiones = [Sesion]()
        db.collection("Sesiones").whereField("idUsuario", isEqualTo: st).whereField("numeroSesion", isEqualTo: stt).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    
                    let s = Sesion(aDoc: document)
                    //if(s.tipo == st){
                    sesiones.append(s)
                    //}
                }
                completion(.success(sesiones))
            }
        }
       
    }

    func fetchSesiones(st:String, completion: @escaping (Result<Sesiones, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var sesiones = [Sesion]()
        db.collection("Sesiones").whereField("idUsuario", isEqualTo: st).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    
                    let s = Sesion(aDoc: document)
                    //if(s.tipo == st){
                    sesiones.append(s)
                    //}
                }
                completion(.success(sesiones))
            }
        }
       
    }
}
