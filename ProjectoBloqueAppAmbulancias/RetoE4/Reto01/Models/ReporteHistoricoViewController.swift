//
//  ReporteHistoricoViewController.swift
//  Reto01
//
//  Created by Paola Diaz on 19/10/21.
//

import UIKit
import Firebase


class reporteHistoricoViewCell : UITableViewCell{
    
    
    
}




class ReporteHistoricoViewController: UIViewController {

        var tc = TanatologosController()
        var uc = SesionesController()
        var us = UsuariosController()
        
        var num = 0
        var user : Usuario!
        
        var sesion: Sesion!
        
        
        var tanatologo = Tanatologo(id:"", nombre:"", password:"", user:"")
        
    

        func updateUI(with sesiones:Sesiones) -> Int{
            if(sesiones.count != 0)
            {
                    self.sesion = sesiones[0]
                    self.sesion.idUsuario = user.id
                    self.tanname.text = self.tanatologo.nombre
                
                let today = self.sesion.fecha
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                print(formatter1.string(from: today))
                
                let h = formatter1.string(from: today)
                
                    self.Fecha.text = "Fecha: "+h
                    self.ns.text = "Numero de sesiones: " + String(self.sesion.numeroSesion)
                self.nexp.text = "Expediente: " + self.sesion.idUsuario
                    self.usname.text = "Usuario: " + self.user.nombre
                    self.motivo.text = "Motivo: " + self.sesion.motivo
                    self.servicio.text = "Servicio: " + self.sesion.servicio
                    self.intervencion.text = "Intervención: " + self.sesion.intervencion
                    self.herramienta.text = "Hermienta: " + self.sesion.herramienta
                    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        uc.fetchOneSesion(st: sesion!.idUsuario, stt: num){ (result) in
            switch result{
            case .success(let sesiones):self.updateUI(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
                    
            return 0
        }
        
        
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "zelda1", for: indexPath) //as! tanGraphTableViewCell
            
        }
    
    
    
  //  override func viewDidLoad() {
    //    super.viewDidLoad()

        // Do any additional setup after loading the view.

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


