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
