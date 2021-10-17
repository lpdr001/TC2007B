//
//  SesionesViewController.swift
//  Reto01
//
//  Created by user193889 on 10/9/21.
//

import UIKit
import Firebase

class SesionesViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var Fecha: UIDatePicker!
    @IBOutlet weak var eval: UITextField!
    @IBOutlet weak var cuota: UITextField!
    @IBOutlet weak var tan: UILabel!
    @IBOutlet weak var nu: UILabel!
    @IBOutlet weak var fechatext: UIDatePicker!
    
    
    //PickerViews
    @IBOutlet weak var herram: herramientaPickerView!
    @IBOutlet weak var interv: tipoServicioPickerView!
    @IBOutlet weak var tServ: tipoServicioPickerView!
    @IBOutlet weak var motivo: motivoServPickerView!
    
    
    
    @IBOutlet weak var name: UILabel!
    var user: Usuario?
    
    var datos = [Sesion]()
    var vc = SesionesController()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = user?.nombre
        eval.delegate = self
        cuota.delegate = self
        tan.text = LogInViewController.Lv.datos[0].nombre

        
        //PickerViews
        self.herram.delegate = herram
        self.herram.dataSource = herram
        
        self.interv.delegate = interv
        self.interv.dataSource = interv
        
        self.tServ.delegate = tServ
        self.tServ.dataSource = tServ
        
        self.motivo.delegate = motivo
        self.motivo.dataSource = motivo
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CerrarTeclado(_ sender: UITapGestureRecognizer) {
        eval.resignFirstResponder()
        cuota.resignFirstResponder()
    }
    
    
    
    @IBAction func Registrar(_ sender: Any) {
        
        
        let us = Sesion(id: "1", cierre: false, numeroSesion: self.datos.count+1, evaluacion: eval.text!, idUsuario: user?.id ?? "", servicio: tServ.currentValue, couta: Int(cuota.text!) ?? 0, fecha: Fecha.date, intervencion: interv.currentValue, herramienta: herram.currentValue, motivo: motivo.currentValue)
        vc.SendSesion(sn: us)
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
