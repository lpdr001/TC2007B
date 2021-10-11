//
//  EditarUserViewController.swift
//  Reto01
//
//  Created by user193889 on 10/8/21.
//

import UIKit
import Firebase

class EditarUserViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var oc: UITextField!
    @IBOutlet weak var rel: UITextField!
    @IBOutlet weak var proce: UITextField!
    @IBOutlet weak var estCiv: UITextField!
    @IBOutlet weak var dom: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var cel: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var sexo: UITextField!
    @IBOutlet weak var ref: UITextField!
    @IBOutlet weak var motivo: UITextField!
    @IBOutlet weak var idra: UITextField!
    @IBOutlet weak var swit: UISwitch!
    
    var user = Usuario(domicilio:"",estadoCivil:"",iDRA:"",idTanatologo:"",motivo:"",ocupacion:"",procedencia:"",referencia:"",religion:"",sexo:"", nombre:"",fechaIngreso:"",cerrado:false,edad:0,telefono:0)
    
    var uc = UsuariosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        oc.delegate = self
        rel.delegate = self
        proce.delegate = self
        estCiv.delegate = self
        dom.delegate = self
        tel.delegate = self
        cel.delegate = self
        edad.delegate = self
        sexo.delegate = self
        ref.delegate = self
        motivo.delegate = self
        idra.delegate = self
        
        name.text = user.nombre
        oc.text = user.ocupacion
        rel.text = user.religion
        proce.text = user.procedencia
        estCiv.text = user.estadoCivil
        dom.text = user.domicilio
        tel.text = String(user.telefono)
        //cel.text = user.cel
        edad.text = String(user.edad)
        sexo.text = user.sexo
        ref.text = user.referencia
        motivo.text = user.motivo
        idra.text = user.iDRA
        swit.isOn = user.cerrado
        
        // Do any additional setup after loading the view.
    }
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
        name.resignFirstResponder()
        oc.resignFirstResponder()
        rel.resignFirstResponder()
        proce.resignFirstResponder()
        estCiv.resignFirstResponder()
        dom.resignFirstResponder()
        tel.resignFirstResponder()
        cel.resignFirstResponder()
        edad.resignFirstResponder()
        sexo.resignFirstResponder()
        ref.resignFirstResponder()
        motivo.resignFirstResponder()
        idra.resignFirstResponder()
    }

    @IBAction func editar(_ sender: Any) {
        
        let tmpuser = Usuario(id:user.id,domicilio:dom.text!,estadoCivil:estCiv.text!,iDRA:idra.text!,idTanatologo:user.idTanatologo,motivo:motivo.text!,ocupacion:oc.text!,procedencia:proce.text!,referencia:ref.text!,religion:rel.text!,sexo:sexo.text!, nombre:name.text!,fechaIngreso:user.fechaIngreso,cerrado:swit.isOn,edad:Int(edad.text!) ?? 18,telefono:Int(tel.text!) ?? 00000000)
        
        uc.EditUsuario(sn: tmpuser)
        
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
