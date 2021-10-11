//
//  LogInViewController.swift
//  Reto01
//
//  Created by user193889 on 10/6/21.
//

import UIKit
import Firebase


class LogInViewController: UIViewController {

    var name = "Mr. Meeseeks"
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var error: UILabel!
    
    
    var TanatologoControlador = TanatologosController()
    var AdministradorControlador = AdministradorController()
    var AdminSoporteControlador = AdminSoporteController()
   
    var datos = [Tanatologo]()
    var datos1 = [Administrador]()
    var datos2 = [AdminSoporte]()
    
    static var Lv = LogInViewController()
    var b = false
    
    
    @IBAction func LogInTanatologos(_ sender: Any) {
        
        TanatologoControlador.fetchTanatologos(st: username.text!){ (result) in
            switch result{
            case .success(let tanatologos):self.updatedatos(with: tanatologos, password:self.password.text!, username:self.username.text!)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a ")
            }
        }
        
        
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        error.text = ""

        // Do any additional setup after loading the view.
        
       
        

    }

    func updatedatos(with sesiones:Tanatologos, password: String, username: String)-> Bool{
        var b = false
        
            self.datos = sesiones
        if (self.datos.count >= 1){
            if(self.datos[0].password == password){
                if(LogInViewController.Lv != self  ){
                    LogInViewController.Lv = self
                }
                self.name = self.datos[0].nombre
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance1")
                //balanceViewController.Tananame = datos[0].nombre
                self.show(balanceViewController, sender: nil) //present(balanceViewController, animated: true, completion: nil)
                b = true
        }
           
        }else {
            AdministradorControlador.fetchAdministrador(st: username){ (result) in
                switch result{
                case .success(let administradores):self.updatedatos1(with: administradores, password: password, username: username)
                case .failure: b = false //self.displayError(error, title: "No se pudo acceder a ")
                }
            }
        }
        return b
    }
    
    func updatedatos1(with sesiones:Administradores, password: String, username: String)-> Bool{
        var b = false
       
            self.datos1 = sesiones
        if (self.datos1.count >= 1){
            if(self.datos1[0].password == password){
                if(LogInViewController.Lv != self  ){
                    LogInViewController.Lv = self
                }
                self.name = self.datos1[0].nombre
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance2")
                //balanceViewController.Tananame = datos[0].nombre
                self.show(balanceViewController, sender: nil) //present(balanceViewController, animated: true, completion: nil)
                b = true
        }
           
        } else {
            AdminSoporteControlador.fetchAdminSoporte(st: username){ (result) in
                switch result{
                case .success(let soportes):b = self.updatedatos2(with: soportes,  password: password)
                case .failure: b = false
                }
            }
        }
        return b
    }
    
    func updatedatos2(with sesiones:Soportes, password: String)-> Bool{
        var b = false
       
            self.datos2 = sesiones
        if (self.datos2.count >= 1){
            if(self.datos2[0].password == password){
                if(LogInViewController.Lv != self  ){
                    LogInViewController.Lv = self
                }
                
                self.name = self.datos2[0].nombre
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance3")
                //balanceViewController.Tananame = datos[0].nombre
                self.show(balanceViewController, sender: nil) //present(balanceViewController, animated: true, completion: nil)
         b = true
        }
            else {
                error.text = "error"
                b = false
            }
            
           
        }
        return b
    }
    
    
    
func displayError(_ error: Error, title: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       
       /* let siguiente = segue.destination as! UuariosTanatologoTableViewController
        siguiente.Tananame = self.datos[0].id */
      
        //siguiente.Username = datos[indice!].nombre
        //siguiente.UserID = datos[indice!].id

    }
}
