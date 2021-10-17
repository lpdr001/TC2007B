//
//  EditarSesionViewController.swift
//  Reto01
//
//  Created by user193889 on 10/10/21.
//

import UIKit
import Firebase

class EditarSesionViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate{
    
    @IBOutlet weak var cuota: UITextField!
    @IBOutlet weak var Eval: UITextField!
    
    let motivos = ["Abuso", "Adicción", "Ansiedad", "Baja Autoestima", "Codependencia", "Comunicación familiar", "Conflicto con hermano", "Conflicto con madre", "Conflicto con padre", "Dependencia", "Divorcio", "Duelo", "Duelo Grupal", "Enfermedad", "Enfermedad Crónico degenerativa", "Heridas de la infancia", "Identidad de género", "Infertilidad", "Infidelidad", "Intento de suicidio", "Miedo", "Pérdida de vienes materiales", "Pérdida de identidad", "Pérdida laboral", "Relación con los padres", "Ruptura de noviazgo", "Stress", "Trastorno Obsesivo", "Violación", "Violencia Intrafamiliar", "Violencia Psicológica", "Viudez", "Otro"]
    let servicios = ["Servicios de Acompañamiento", "Servicios holísticos", "Herramientas alternativas"]
    let intervenciones = ["Tanatología", "Acompañamiento Individual", "Acompañamiento Grupal", "Logoterapia", "Mindfulness", "Aromaterapia y Musicoterapia", "Cristaloterapia", "Reiki", "Biomagnetismo", "Angeloterapia", "Cama Térmica de Jade", "Flores de Bach", "Brisas ambientales"]
    let herramienta = ["Contención", "Diálogo", "Ejercicio", "Encuadre", "Infografía", "Dinámica", "Lectura", "Meditación", "Video", "Otro"]
    
    @IBOutlet weak var motivo: motivoServPickerView!
    @IBOutlet weak var servi: tipoServicioPickerView!
    @IBOutlet weak var inter: intervencionPickerView!
    @IBOutlet weak var herr: EditarHerPickerView!
    
    var sc = SesionesController()

    var sesion: Sesion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cuota.delegate = self
        Eval.delegate = self
        
        motivo.delegate = self
        
        /*let defM:Int = motivos.firstIndex(of: sesion!.motivo)!
        motivo.selectRow(1, inComponent: 0, animated: true)
        let defS:Int = servicios.firstIndex(of: sesion!.servicio)!
        servi.selectRow(1, inComponent: 0, animated: true)
        let defI:Int = intervenciones.firstIndex(of: sesion!.intervencion)!
        //inter.selectRow(0, inComponent: defI, animated: true)
        let defH:Int = herramienta.firstIndex(of: sesion!.herramienta)!
        herr.selectRow(0, inComponent: 0, animated: true)*/
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cerrarteclado(_ sender: UITapGestureRecognizer) {
        cuota.resignFirstResponder()
        Eval.resignFirstResponder()
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
        let tmpus = Sesion(id: sesion.id, cierre: sesion.cierre, numeroSesion: sesion.numeroSesion, evaluacion: Eval.text!, idUsuario: sesion.idUsuario, servicio: servi.currentValue, couta: Int(cuota.text!) ?? 0, fecha: sesion.fecha, intervencion: inter.currentValue, herramienta: herr.currentValue, motivo: motivo.currentValue)
        
        sesion.evaluacion = Eval.text!
        sesion.cuota = Int(cuota.text!) ?? 0
        
        sc.EditUsuario(sn: tmpus)
        
        _ = navigationController?.popViewController(animated: true)
        
    }

}
