//
//  AdministradorController.swift
//  Reto01
//
//  Created by Paola Diaz on 08/10/21.
//

import Foundation
import Firebase


class AdministradorController{
    
    let db = Firestore.firestore()
    
    

    func fetchAdministrador(st:String, completion: @escaping (Result<Administrador, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var administrador = [Administrador]()
        db.collection("Admnistrador").whereField("user", isEqualTo: st).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    
                    let s = Administrador(aDoc: document)
                    //if(s.tipo == st){
                    administrador.append(s)
                    //}
                }
                completion(.success(administrador))
            }
        }
       
    }
}

