//
//  ServiciosController.swift
//  Tabla524
//
//  Created by molina on 20/09/21.
//

import Foundation
import Foundation
import Firebase


class ServicioController{
    
    let db = Firestore.firestore()
    
    func fetchServicios(completion: @escaping (Result<Servicios, Error>) -> Void){
        
//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var servicios = [Servicio]()
        db.collection("Servicios").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    var s = Servicio(aDoc: document)
                    servicios.append(s)
                }
                completion(.success(servicios))
            }
        }
       
    }
}
