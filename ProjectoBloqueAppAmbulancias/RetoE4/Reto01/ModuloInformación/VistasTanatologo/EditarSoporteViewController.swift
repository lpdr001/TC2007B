//
//  EditarSoporteViewController.swift
//  Reto01
//
//  Created by user193889 on 10/14/21.
//

import UIKit

class EditarSoporteViewController: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var asc = AdminSoporteController()
    
    var us : AdminSoporte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        us = LogInViewController.Lv.datos2[0]
        
        username.delegate = self
        name.delegate = self
        password.delegate = self
        
        username.text = us?.user
        name.text = us?.nombre
        password.text = us?.password

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Editar(_ sender: Any) {
        let  soporte = AdminSoporte(id: "", nombre: name.text!, password: password.text!, user: username.text!)
        asc.SendSoporte(sn: soporte)
        LogInViewController.Lv.datos2[0] = soporte
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
        name.resignFirstResponder()
        username.resignFirstResponder()
        password.resignFirstResponder()}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
