//
//  SesionesViewController.swift
//  Reto01
//
//  Created by user193889 on 10/9/21.
//

import UIKit
import Firebase

class SesionesViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var eval: UITextField!
    @IBOutlet weak var cuota: UITextField!
    @IBOutlet weak var tan: UILabel!
    @IBOutlet weak var nu: UILabel!
    @IBOutlet weak var fecha: UIDatePicker!
    
    var user = Usuario(domicilio:"",estadoCivil:"",iDRA:"",idTanatologo:"",motivo:"",ocupacion:"",procedencia:"",referencia:"",religion:"",sexo:"", nombre:"",fechaIngreso:"",cerrado:false,edad:0,telefono:0)
    
    var datos = [Sesion]()
    var vc = SesionesController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eval.delegate = self
        cuota.delegate = self
        tan.text = LogInViewController.Lv.datos[0].nombre

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
        eval.resignFirstResponder()
        cuota.resignFirstResponder()
    }
    
    @IBAction func Registrar(_ sender: Any) {
        let us = Sesion(id:"123",cierre: false, numeroSesion: datos.count+1, evaluacion: eval.text!, idUsuario: user.id, servicio: "tmp", couta: cuota.hashValue, fecha: "")
        vc.SendSesion(sn: us)
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
