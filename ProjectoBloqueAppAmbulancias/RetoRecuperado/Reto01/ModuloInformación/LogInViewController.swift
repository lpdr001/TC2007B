//
//  LogInViewController.swift
//  Reto01
//
//  Created by user193889 on 10/6/21.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseAnalytics


class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func singUpTapped(_ sender: Any) {
        if username.text?.isEmpty == true{
            print ("Ingrese su nombre de usuario")
            return
        }
        
        if password.text?.isEmpty == true{
            print ("Ingrese su contraseña")
            return
        }
    }
    
    
    func signUpT(){
        Auth.auth().createUser(withEmail: username.text!, password: password.text!) { authResult, error in
            
            guard let user = authResult?.user, error == nil else{
                print("Error \(error?.localizedDescription)")
                return
            }
            
            
        }
        
    }
    
    func updatedatos(with sesiones:Sesiones){
        DispatchQueue.main.async {
            //elf.datos = sesiones
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

    }
}
