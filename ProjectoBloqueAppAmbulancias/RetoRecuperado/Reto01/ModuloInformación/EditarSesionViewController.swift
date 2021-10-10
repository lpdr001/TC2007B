//
//  EditarSesionViewController.swift
//  Reto01
//
//  Created by user193889 on 10/10/21.
//

import UIKit
import Firebase

class EditarSesionViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var cuota: UITextField!
    @IBOutlet weak var motivo: UITextField!
    var sc = SesionesController()

    var sesion = Sesion(id: "", cierre: false, numeroSesion: 1, evaluacion: "", idUsuario: "", servicio: "", couta: 1, fecha: "", intervencion: "", herramienta: "", motivo: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        cuota.delegate = self
        motivo.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cerrarteclado(_ sender: UITapGestureRecognizer) {
        cuota.resignFirstResponder()
        motivo.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func editar(_ sender: Any) {
        let tmpus = Sesion(id: sesion.id, cierre: sesion.cierre, numeroSesion: sesion.numeroSesion, evaluacion: motivo.text!, idUsuario: sesion.idUsuario, servicio: sesion.servicio, couta: Int(cuota.text!) ?? 0, fecha: sesion.fecha, intervencion: "", herramienta: "", motivo: "")
        
        sesion.evaluacion = motivo.text!
        
        sc.EditUsuario(sn: sesion)
        
        _ = navigationController?.popViewController(animated: true)
        
    }

}
