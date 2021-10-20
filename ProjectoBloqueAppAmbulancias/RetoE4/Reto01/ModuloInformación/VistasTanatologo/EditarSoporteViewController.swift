//
//  EditarSoporteViewController.swift
//  Reto01
//
//  Created by user193889 on 10/14/21.
//

import UIKit

class EditarSoporteViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var admin = false;
    
    var asc = AdminSoporteController()
    var ac = AdministradorController()
    var tc = TanatologosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        name.delegate = self
        password.delegate = self
        
        if(LogInViewController.Lv.datos1.count != 0)
        {
            admin = true
                
            username.text = LogInViewController.Lv.datos1[0].user
            name.text = LogInViewController.Lv.datos1[0].nombre
            password.text =  LogInViewController.Lv.datos1[0].password
        }
        else if(LogInViewController.Lv.datos2.count != 0)
        {
            admin = false
                
            username.text = LogInViewController.Lv.datos2[0].user
            name.text = LogInViewController.Lv.datos2[0].nombre
            password.text =  LogInViewController.Lv.datos2[0].password
        }
    }
    
    @IBAction func Editar(_ sender: Any) {
        
        tc.fetchTanatologos(st: username.text!){ (result) in
            switch result{
            case .success(let tanatologos):self.updatedatos(with: tanatologos)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a ")
            }
        }
    }
    
    func updatedatos(with tanatologos: Tanatologos){
        if(tanatologos.count <= 0){
            asc.fetchAdminSoporte(st: username.text!){ (result) in switch result{
                case .success(let tanatologos):self.updatedatos2(with: tanatologos)
                case .failure(let error):self.displayError(error, title: "No se pudo acceder a ")
                }
            }
        }
    }
    
    func updatedatos2(with tanatologos: Soportes){
        
        if(tanatologos.count <= 0){
            ac.fetchAdministrador(st: username.text!){ (result) in
            switch result{
            case .success(let tanatologos):self.finishval(with: tanatologos)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a ")
                }
            }
        }
        else if(!admin){
            let tmp = AdminSoporte(id: LogInViewController.Lv.datos2[0].id, nombre: name.text!, password: password.text!, user: LogInViewController.Lv.datos2[0].user)
            asc.EditUsuario(sn: tmp)
        }
    }
    
    func finishval(with tanatologos: Administradores){
       
        if(tanatologos.count <= 0){
            
            if(admin){
                let tmp = Administrador(id: LogInViewController.Lv.datos1[0].id, nombre: name.text!, password: password.text!, user: username.text!)
                ac.EditUsuario(sn: tmp)
                
                LogInViewController.Lv.datos1[0] = tmp
            }
            else if(!admin){
                let tmp = AdminSoporte(id: LogInViewController.Lv.datos2[0].id, nombre: name.text!, password: password.text!, user: username.text!)
                asc.EditUsuario(sn: tmp)
                
                LogInViewController.Lv.datos2[0] = tmp
        

            }
                    _ = navigationController?.popViewController(animated: true)
        }
        else if(admin){
            let tmp = Administrador(id: LogInViewController.Lv.datos1[0].id, nombre: name.text!, password: password.text!, user: LogInViewController.Lv.datos1[0].user)
            ac.EditUsuario(sn: tmp)
        }
    }
   
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
     username.resignFirstResponder()
    password.resignFirstResponder()
        name.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

