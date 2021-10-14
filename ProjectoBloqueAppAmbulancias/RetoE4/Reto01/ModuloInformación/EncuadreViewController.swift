//
//  EncuadreViewController.swift
//  Reto01
//
//  Created by user193889 on 10/8/21.
//

import UIKit
import Firebase

class EncuadreViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var fecha: UIDatePicker!
    @IBOutlet weak var Ocupación: UITextField!
    @IBOutlet weak var religion: UITextField!
    @IBOutlet weak var procedencia: UITextField!
    @IBOutlet weak var estadocivil: UITextField!
    @IBOutlet weak var domicilio: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var celular: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var sexo: UITextField!
    @IBOutlet weak var ref: UITextField!
    @IBOutlet weak var motivo: UITextField!
    @IBOutlet weak var idra: UITextField!
    
    @IBOutlet weak var tan: UILabel!
    var vc = UsuariosController()
    
    let date = NSDate(timeIntervalSince1970: 1)
    
    var user = Usuario(domicilio:"",estadoCivil:"",iDRA:"",idTanatologo:"",motivo:"",ocupacion:"",procedencia:"",referencia:"",religion:"",sexo:"", nombre:"",fechaIngreso:NSDate(timeIntervalSince1970: 1) as Date,cerrado:false,edad:0,telefono:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.delegate = self
        Ocupación.delegate = self
        religion.delegate = self
        procedencia.delegate = self
        estadocivil.delegate = self
        domicilio.delegate = self
        telefono.delegate = self
        celular.delegate = self
        edad.delegate = self
        sexo.delegate = self
        ref.delegate = self
        motivo.delegate = self
        idra.delegate = self
        tan.text = LogInViewController.Lv.datos[0].nombre

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
        nombre.resignFirstResponder()
        Ocupación.resignFirstResponder()
        religion.resignFirstResponder()
        procedencia.resignFirstResponder()
        estadocivil.resignFirstResponder()
        domicilio.resignFirstResponder()
        telefono.resignFirstResponder()
        celular.resignFirstResponder()
        edad.resignFirstResponder()
        sexo.resignFirstResponder()
        ref.resignFirstResponder()
        motivo.resignFirstResponder()
        idra.resignFirstResponder()
    }
    
    @IBAction func Registrar(_ sender: Any) {
        let us = Usuario(domicilio:domicilio.text!,estadoCivil:estadocivil.text!,iDRA:idra.text!,idTanatologo:LogInViewController.Lv.datos[0].id,motivo:motivo.text!,ocupacion:Ocupación.text!,procedencia:procedencia.text!,referencia:ref.text!,religion:religion.text!,sexo:sexo.text!, nombre:nombre.text!,fechaIngreso:fecha.date,cerrado:false,edad:Int(edad.text!) ?? 18,telefono:Int(telefono.text!) ?? 00000000)
        vc.SentServicio(sn: us)
        user = us
        
        self.loadView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let siguiente = segue.destination as! SesionesViewController
        siguiente.user = self.user

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
