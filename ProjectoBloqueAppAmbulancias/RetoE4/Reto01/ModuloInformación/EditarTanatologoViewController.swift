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
    var sup : Tanatologo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sup = LogInViewController.Lv.datos[0]
                
                username.delegate = self
                name.delegate = self
                password.delegate = self
                
        username.text = sup?.user
        name.text = sup?.nombre
        password.text = sup?.password
    }
    
    @IBAction func Editar(_ sender: Any) {
        let  tanatologo = Tanatologo(id: "", nombre: name.text!, password: password.text!, user: username.text!)
                tc.SingUpTanatologo(sup: tanatologo)
                LogInViewController.Lv.datos[0] = tanatologo
                _ = navigationController?.popViewController(animated: true)
        
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
