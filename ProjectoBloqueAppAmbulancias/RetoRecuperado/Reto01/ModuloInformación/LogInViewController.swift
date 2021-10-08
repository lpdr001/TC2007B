//
//  LogInViewController.swift
//  Reto01
//
//  Created by user193889 on 10/6/21.
//

import UIKit
import Firebase


class LogInViewController: UIViewController {

    var username = "tanatologo1"
    
    var TanatologoControlador = TanatologosController()
   
    var datos = [Tanatologo]()
    let sections = ["Tanatologos"]
    
    
    @IBAction func LogInTanatologos(_ sender: Any) {
        
        TanatologoControlador.fetchTanatologos(st: username){ (result) in
            switch result{
            case .success(let tanatologos):self.updatedatos(with: tanatologos)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a ")
            }

            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        

    }

    func updatedatos(with sesiones:Tanatologos){
       
            self.datos = sesiones
        if (self.datos.count >= 1){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance") 
            self.present(balanceViewController, animated: true, completion: nil)
           
        }
           
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
