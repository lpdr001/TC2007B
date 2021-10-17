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
    
    //Picker views

    @IBOutlet weak var motivo: motivoServPickerView!
    @IBOutlet weak var serv: tipoServicioPickerView!
    @IBOutlet weak var interv: intervencionPickerView!
    @IBOutlet weak var herram: herramientaPickerView!
    
    var sc = SesionesController()

    var sesion: Sesion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cuota.delegate = self
        Eval.delegate = self
        
        //PickerViews
        self.herram.delegate = herram
        self.herram.dataSource = herram
        
        self.interv.delegate = interv
        self.interv.dataSource = interv
        
        self.serv.delegate = serv
        self.serv.dataSource = serv
        
        self.motivo.delegate = motivo
        self.motivo.dataSource = motivo
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
    
    @IBAction func cerarteclado(_ sender: UITapGestureRecognizer) {
        cuota.resignFirstResponder()
        Eval.resignFirstResponder()
    }
    
    @IBAction func editar(_ sender: Any) {
        let tmpus = Sesion(id: sesion.id, cierre: sesion.cierre, numeroSesion: sesion.numeroSesion, evaluacion: Eval.text!, idUsuario: sesion.idUsuario, servicio: serv.currentValue, couta: Int(cuota.text!) ?? 0, fecha: sesion.fecha, intervencion: interv.currentValue, herramienta: herram.currentValue, motivo: motivo.currentValue)
        
        sesion.evaluacion = Eval.text!
        sesion.cuota = Int(cuota.text!) ?? 0
        
        sc.EditUsuario(sn: tmpus)
        
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
