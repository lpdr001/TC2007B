//
//  EditarTanatologoViewController.swift
//  Reto01
//
//  Created by user193889 on 10/13/21.
//

import UIKit

class EditarTanatologoViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var tc = TanatologosController()
    var asc = AdminSoporteController()
    var ac = AdministradorController()
    
    var sup : Tanatologo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //sup = LogInViewController.Lv.datos[0]
                
                username.delegate = self
                name.delegate = self
                password.delegate = self
                
        username.text = sup?.user
        name.text = sup?.nombre
        password.text = sup?.password
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
        else if(tanatologos.count != 0){
            let  tanatologo = Tanatologo(id: sup!.id, nombre: name.text!, password: password.text!, user: sup!.nombre)
                
                tc.Editar(sup: tanatologo)
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
    }
    
    func finishval(with tanatologos: Administradores){
       
        let  tanatologo = Tanatologo(id: sup!.id, nombre: name.text!, password: password.text!, user: username.text!)
      
        
        if (tanatologos.count <= 0){
            
            tc.Editar(sup: tanatologo)
            LogInViewController.Lv.datos[0] = tanatologo
                    _ = navigationController?.popViewController(animated: true)
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
