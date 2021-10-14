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
    
                        /*db.collection("Administradores").document(correoClean).setData(["apellido": apellidoClean, "correo": correoClean, "nombre": nombreClean, "uid":result!.user.uid, "esSoporte": switchCase]) { (error) in
                            if let error = error {
                                self.showError("fail 2 :(")
                            }

                        }*/
    func EditUsuario(sn:Usuario){
        db.collection("Usuarios").document(sn.id).setData([
            "domicilio":sn.domicilio,
            "estadoCivil":sn.estadoCivil,
            "iDRA":sn.iDRA,
            "idTanatologo":sn.idTanatologo,
            "motivo":sn.motivo,
            "ocupacion":sn.ocupacion,
            "procedencia":sn.procedencia,
            "referencia":sn.referencia,
            "religion":sn.religion,
            "sexo":sn.sexo,
            "nombre":sn.nombre,
            "fechaIngreso":sn.fechaIngreso,
            "cerrado":sn.cerrado,
            "edad":sn.edad,
            "telefono":sn.telefono

        ]) 
    }
    
    func SentServicio(sn:Usuario){
        var ref: DocumentReference? = nil
        ref = db.collection("Usuarios").addDocument(data: [
            "domicilio":sn.domicilio,
            "estadoCivil":sn.estadoCivil,
            "iDRA":sn.iDRA,
            "idTanatologo":sn.idTanatologo,
            "motivo":sn.motivo,
            "ocupacion":sn.ocupacion,
            "procedencia":sn.procedencia,
            "referencia":sn.referencia,
            "religion":sn.religion,
            "sexo":sn.sexo,
            "nombre":sn.nombre,
            "fechaIngreso":sn.fechaIngreso,
            "cerrado":false,
            "edad":sn.edad,
            "telefono":sn.telefono

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        //db.collection("Usuarios").setData()
    }

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
    
    func fetchUsers(start:Date,End:Date, completion: @escaping (Result<Usuarios, Error>) -> Void){//        let servicios = [Servicio(nombre: "Uno", desc: "Desc Uno")]
        var usuarios = [Usuario]()
        db.collection("Usuarios").whereField("fechaIngreso", isGreaterThanOrEqualTo: start).whereField("fechaIngreso", isLessThanOrEqualTo: End).getDocuments() { (querySnapshot, err) in
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
