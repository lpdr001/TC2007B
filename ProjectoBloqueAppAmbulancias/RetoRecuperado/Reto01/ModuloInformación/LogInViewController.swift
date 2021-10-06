//
//  LogInViewController.swift
//  Reto01
//
//  Created by user193889 on 10/6/21.
//

import UIKit

class LogInViewController: UIViewController {
    
    var datos = [Sesion]()
    var sesionControlador = SesionesController()
    
    //var users = [Usuario]()
    var userControlador = UsuariosController()

    var UserName = "-1"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func LogInAsUsuario(_ sender: Any) {
        
        userControlador.fetchServicios(st:""){ (result) in
            switch result{
            case .success(let usuarios):self.updateuser(with: usuarios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
    }
        }
            
            func updateuser(with usuarios:Usuarios){
                
                sesionControlador.fetchSesiones(st: usuarios[0].id){ (result) in
                switch result{
                case .success(let servicios):self.updatedatos(with: servicios)
                case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
                }
                }
            }
                
    
    func updatedatos(with sesiones:Sesiones){
        DispatchQueue.main.async {
            self.datos = sesiones
        }}
    
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
        if (UserName != "-1"){
        let siguiente = segue.destination as! DetalleSesionViewController
        //indexPathForSelectedRow?.row
      
        siguiente.datos = self.datos
        }
    }
}
