//
//  UsuariosController.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import Foundation
import Foundation
import Firebase


class UsuariosController{
    
    let db = Firestore.firestore()
    
    

    func fetchServicios(st:String, completion: @escaping (Result<Usuarios, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var usuarios = [Usuario]()
        db.collection("Usuarios").whereField("idTanatologo", isEqualTo: st).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    
                    let s = Usuario(aDoc: document)
                    //if(s.tipo == st){
                    usuarios.append(s)
                    //}
                }
                completion(.success(usuarios))
            }
        }
       
    }
}
