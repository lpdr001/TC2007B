//
//  DetalleSesionViewController.swift
//  Reto01
//
//  Created by user193889 on 10/6/21.
//

import UIKit
import Firebase

class DetalleSesionViewController: UIViewController {

    @IBOutlet weak var Fecha: UILabel!
    @IBOutlet weak var ns: UILabel!
    @IBOutlet weak var sesionDesc: UILabel!
    @IBOutlet weak var nexp: UILabel!
    @IBOutlet weak var usname: UILabel!
    @IBOutlet weak var tanname: UILabel!
    @IBOutlet weak var motivo: UILabel!
    @IBOutlet weak var servicio: UILabel!
    @IBOutlet weak var intervencion: UILabel!
    @IBOutlet weak var herramienta: UILabel!
    
    var tc = TanatologosController()
    
    @IBOutlet weak var cuota: UILabel!
    
    var sesion = Sesion(id: "", cierre: false, numeroSesion: 1, evaluacion: "", idUsuario: "", servicio: "", couta: 1, fecha: "", intervencion: "", herramienta: "", motivo: "")
    var user = Usuario(domicilio:"",estadoCivil:"",iDRA:"",idTanatologo:"",motivo:"",ocupacion:"",procedencia:"",referencia:"",religion:"",sexo:"", nombre:"",fechaIngreso:"",cerrado:false,edad:0,telefono:0)
    
    var Tananame = ""
    var tanatologo = Tanatologo(id:"", nombre:"", password:"", user:"")
    
    
    override func viewWillAppear(_ animated: Bool) {
    
    //} viewDidLoad() {
        super.viewDidLoad()
        self.tanname.text = self.tanatologo.nombre
            self.Fecha.text = self.sesion.fecha
            self.ns.text = "Numero de sesion: " + String(self.sesion.numeroSesion)
            self.nexp.text = self.user.id
            self.usname.text = self.user.nombre
            self.motivo.text = self.sesion.motivo
            self.servicio.text = self.sesion.servicio
            self.intervencion.text = self.sesion.intervencion
            self.herramienta.text = self.sesion.herramienta
            self.cuota.text = String(self.sesion.cuota)
            self.sesionDesc.text = self.sesion.evaluacion

        // Do any additional setup after loading the view.
    }
    
        func updateUI(with tanatologos:Tanatologos){
            for t in tanatologos{
                if(t.id == user.idTanatologo){
                    self.tanname.text = t.nombre}
            }
            
        }
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! EditarSesionViewController
        siguiente.sesion = self.sesion
    

}
}
