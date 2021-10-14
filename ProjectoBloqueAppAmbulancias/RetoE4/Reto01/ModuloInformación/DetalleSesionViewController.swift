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
    var uc = SesionesController()
    
    @IBOutlet weak var cuota: UILabel!
    
    var num = 0
    var user : Usuario!
    
    var sesion = Sesion(id: "", cierre: false, numeroSesion: 1, evaluacion: "", idUsuario: "not loading", servicio: "", couta: 1, fecha: "", intervencion: "", herramienta: "", motivo: "")
    
    
    var tanatologo = Tanatologo(id:"", nombre:"", password:"", user:"")
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        uc.fetchOneSesion(st: user.id, stt: num){ (result) in
            switch result{
            case .success(let sesiones):self.updateUI(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
    }

    
    //} viewDidLoad() {
        //super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
        func updateUI(with sesiones:Sesiones) -> Int{
            if(sesiones.count != 0)
            {
                    self.sesion = sesiones[0]
                    self.sesion.idUsuario = user.id
                    self.tanname.text = self.tanatologo.nombre
                    self.Fecha.text = self.sesion.fecha
                    self.ns.text = "Numero de sesion: " + String(self.sesion.numeroSesion)
                    self.nexp.text = self.sesion.idUsuario
                    self.usname.text = self.user.nombre
                    self.motivo.text = self.sesion.motivo
                    self.servicio.text = self.sesion.servicio
                    self.intervencion.text = self.sesion.intervencion
                    self.herramienta.text = self.sesion.herramienta
                    self.cuota.text = String(self.sesion.cuota)
                    self.sesionDesc.text = self.sesion.evaluacion
            return 1
            }
            else{
                return 0
            }
            
            
        }
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    
    @IBAction func Editsesion(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "editsesion")as! EditarSesionViewController
        
        balanceViewController.sesion = self.sesion
            self.show(balanceViewController, sender: nil)
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
