//
//  RegistrarSoporteViewController.swift
//  Reto01
//
//  Created by user193889 on 10/13/21.
//

import UIKit

class RegistrarSoporteViewController: UIViewController,UITextFieldDelegate  {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var tc = TanatologosController()
    var asc = AdminSoporteController()
    var ac = AdministradorController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.delegate = self
        password.delegate = self
        username.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    }
    
    func finishval(with tanatologos: Administradores){
       
        let tanatologo = AdminSoporte(id: "", nombre: name.text!, password: password.text!, user:username.text!)
      
        
        if (tanatologos.count <= 0){
            
            asc.SendSoporte(sn: tanatologo)
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
    
    @IBAction func Registrar(_ sender: Any) {
        //let tanatologo = Tanatologo(id: "", nombre: Name.text!, password: password.text!, user:username.text!)
      
        tc.fetchTanatologos(st: username.text!){ (result) in
            switch result{
            case .success(let tanatologos):self.updatedatos(with: tanatologos)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a ")
            }
        }
        
    }
    
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
     username.resignFirstResponder()
    password.resignFirstResponder()
        name.resignFirstResponder()
    }
    
}
