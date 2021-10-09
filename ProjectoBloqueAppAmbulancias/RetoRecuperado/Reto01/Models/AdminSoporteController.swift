//
//  AdminSoporteController.swift
//  Reto01
//
//  Created by Paola Diaz on 08/10/21.
//

import Foundation
import Firebase


class AdminSoporteController{
    
    let db = Firestore.firestore()
    
    

    func fetchAdminSoporte(st:String, completion: @escaping (Result<AdminSoporte, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var adminsoporte = [AdminSoporte]()
        db.collection("AdminSoporte").whereField("user", isEqualTo: st).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    
                    let s = AdminSoporte(aDoc: document)
                    //if(s.tipo == st){
                    adminsoporte.append(s)
                    //}
                }
                completion(.success(adminsoporte))
            }
        }
       
    }
}

