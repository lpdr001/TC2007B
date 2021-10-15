//
//  RegistrarTanatologoViewController.swift
//  Reto01
//
//  Created by user193889 on 10/13/21.
//

import UIKit
import Firebase

class RegistrarTanatologoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
  
   // var datos = [Tanatologo]()
    var tc = TanatologosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Name.delegate = self
        //password.delegate = self
        //username.delegate = self
        
        
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
    @IBAction func Registrar(_ sender: Any) {
        let tanatologo = Tanatologo(id: "", nombre: Name.text!, password: password.text!, user:username.text!)
        tc.SingUpTanatologo(sup: tanatologo)
        
        
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
