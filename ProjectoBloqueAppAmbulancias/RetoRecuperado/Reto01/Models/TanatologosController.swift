//
//  TanatologosController.swift
//  Reto01
//
//  Created by Paola Diaz on 07/10/21.
//

import Foundation
import Firebase


class TanatologosController{
    
    let db = Firestore.firestore()
    
    

    func fetchTanatologos(st:String, completion: @escaping (Result<Tanatologos, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var tanatologos = [Tanatologo]()
        db.collection("Tanatologos").whereField("user", isEqualTo: st).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    
                    let s = Tanatologo(aDoc: document)
                    //if(s.tipo == st){
                    tanatologos.append(s)
                    //}
                }
                completion(.success(tanatologos))
            }
        }
       
    }
}

