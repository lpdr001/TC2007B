//
//  cuotaYtanTableView.swift
//  Reto01
//
//  Created by user193889 on 10/18/21.
//

import UIKit

class tanGraphTableViewCell: UITableViewCell{

    @IBOutlet weak var tanname: UILabel!
    @IBOutlet weak var usuariosc: UILabel!
    @IBOutlet weak var tancuota: UILabel!
}

class cuotaYtanTableView: UITableView, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var globalSum = 100
    
    let sections = ["Tanatólogos"]
    
    var motivos = [Tanatologo]() //ReporteDeIndicadoresViewController.inst.FiltrodatosTanatologos
    var filtro = [Tanatologo]() //ReporteDeIndicadoresViewController.inst.FiltrodatosTanatologos
    
    func SetData(mot:[Tanatologo]){
        self.motivos = mot
        self.filtro = self.motivos
        self.reloadData()
        globalSum = 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]

        return section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
                
        return  filtro.count
    }

    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda1", for: indexPath) //as! tanGraphTableViewCell
        
        var sum = 0
        
        
        for u in ReporteDeIndicadoresViewController.inst.FiltrodatosUsuarios.filter({$0.idTanatologo == filtro[indexPath.row].id}) {
            print(u.nombre)
            for s in ReporteDeIndicadoresViewController.inst.FiltrodatosSesiones.filter({$0.idUsuario == u.id}) {
                sum += s.cuota
                print(sum)
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

}
