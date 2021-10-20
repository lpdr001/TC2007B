//
//  reporteH.swift
//  Reto01
//
//  Created by Paola Diaz on 19/10/21.
//

import UIKit


class reporteHistoricoViewCell: UITableViewCell{
 
}


class reporteHistoricoTableView:  UITableView, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var nexp: UITableViewCell!
    @IBOutlet weak var ns: UITableViewCell!
    @IBOutlet weak var motivo: UITableViewCell!
    @IBOutlet weak var servicio: UITableViewCell!
    @IBOutlet weak var intervencion: UITableViewCell!
    @IBOutlet weak var herramienta: UITableViewCell!
    @IBOutlet weak var Fecha: UITableViewCell!
    @IBOutlet weak var tanname: UITableViewCell!
    

    
//class reporteHistoricoTableView:  UITableView, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let sections = ["Sesiones"]
    let sections1 = ["Tanatologos"]
    
    var tc = TanatologosController()
    var uc = SesionesController()
    var us = UsuariosController()
    
    var filtro = [Tanatologo]()
    var filtro1 = [Usuario]()
    var filtro2 = [Sesion]()
   
         
    

    var num = 0
           var user : Usuario!
           
           var sesion: Sesion!
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "zelda1", for: indexPath)
        
        var sum = 0
        
        
        for u in ReporteDeIndicadoresViewController.inst.FiltrodatosUsuarios.filter({$0.idTanatologo == filtro[indexPath.row].id}) {
            print(u.nombre)
            print (u.id)
            for s in ReporteDeIndicadoresViewController.inst.FiltrodatosSesiones.filter({$0.idUsuario == u.id}) {
                sum += s.cuota
                //print(s.idUsuario)
                print(String(sum))
            }
        }
             
        cell.textLabel?.text = filtro[indexPath.row].nombre + "(" + filtro[indexPath.row].user + ")"
        cell.detailTextLabel?.text = "Usuarios: " + String(ReporteDeIndicadoresViewController.inst.FiltrodatosUsuarios.filter({$0.idTanatologo == filtro[indexPath.row].id}).count) + "  Cuota: " + String(sum) + "$"
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print ("using bar")
        if searchBar.text == nil || searchBar.text == "" {
            self.filtro = self.motivos
        } else {
            let lowerCase = searchBar.text!
            self.filtro = self.motivos.filter({$0.nombre.range(of: lowerCase, options: .caseInsensitive) != nil })
        }
        globalSum = 0
        self.reloadData()
    }

    
    
        /*   func updateUI(with sesiones:Sesiones) -> Int{
               if(sesiones.count != 0)
               {
                       self.sesion = sesiones[0]
                       self.sesion.idUsuario = user.id
                self.tanname = self.filtro
                   
                   let today = self.sesion.fecha
                   let formatter1 = DateFormatter()
                   formatter1.dateStyle = .short
                   print(formatter1.string(from: today))
                   
                   let h = formatter1.string(from: today)
                   
                self.Fecha. = "Fecha: "+h
                       self.ns = "Numero de sesiones: " + String(self.sesion.numeroSesion)
                   self.nexp = "Expediente: " + self.sesion.idUsuario
                       self.usname.text = "Usuario: " + self.user.nombre
                       self.motivo.text = "Motivo: " + self.sesion.motivo
                       self.servicio.text = "Servicio: " + self.sesion.servicio
                       self.intervencion.text = "Intervención: " + self.sesion.intervencion
                       self.herramienta.text = "Hermienta: " + self.sesion.herramienta
                       
               return 1
               }
               else{
                   return 0
               }*/
               
               
           }
       func displayError(_ error: Error, title: String) {
               DispatchQueue.main.async {
                   let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                 //  self.present(alert, animated: true, completion: nil)
               }
           }
       

       
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               // #warning Incomplete implementation, return the number of rows
                       
               return 0
           }
           

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print ("using bar")
    if searchBar.text == nil || searchBar.text == "" {
        self.filtro = self.motivos
    } else {
        let lowerCase = searchBar.text!
        self.filtro = self.motivos.filter({$0.nombre.range(of: lowerCase, options: .caseInsensitive) != nil })
    }
    globalSum = 0
    self.reloadData()
}

}

           
            
    
    
 

