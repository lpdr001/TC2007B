//
//  motivosTableView.swift
//  Reto01
//
//  Created by user193889 on 10/17/21.
//

import UIKit

class motivosTbleView: UITableView, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let sections = ["Motivos"]
    var filtroDatos = ReporteDeIndicadoresViewController.inst.FiltrodatosSesiones
    
    let motivos = ["Abuso", "Adicción", "Ansiedad", "Baja Autoestima", "Codependencia", "Comunicación familiar", "Conflicto con hermano", "Conflicto con madre", "Conflicto con padre", "Dependencia", "Divorcio", "Duelo", "Duelo Grupal", "Enfermedad", "Enfermedad Crónico degenerativa", "Heridas de la infancia", "Identidad de género", "Infertilidad", "Infidelidad", "Intento de suicidio", "Miedo", "Pérdida de vienes materiales", "Pérdida de identidad", "Pérdida laboral", "Relación con los padres", "Ruptura de noviazgo", "Stress", "Trastorno Obsesivo", "Violación", "Violencia Intrafamiliar", "Violencia Psicológica", "Viudez", "Otro"]
    var filtro = ["Abuso", "Adicción", "Ansiedad", "Baja Autoestima", "Codependencia", "Comunicación familiar", "Conflicto con hermano", "Conflicto con madre", "Conflicto con padre", "Dependencia", "Divorcio", "Duelo", "Duelo Grupal", "Enfermedad", "Enfermedad Crónico degenerativa", "Heridas de la infancia", "Identidad de género", "Infertilidad", "Infidelidad", "Intento de suicidio", "Miedo", "Pérdida de vienes materiales", "Pérdida de identidad", "Pérdida laboral", "Relación con los padres", "Ruptura de noviazgo", "Stress", "Trastorno Obsesivo", "Violación", "Violencia Intrafamiliar", "Violencia Psicológica", "Viudez", "Otro"]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
             
        cell.textLabel?.text = filtro[indexPath.row] + ": " + String(ReporteDeIndicadoresViewController.inst.FiltrodatosSesiones.filter({$0.motivo == motivos[indexPath.row]}).count)
        
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print ("using bar")
        if searchBar.text == nil || searchBar.text == "" {
            self.filtro = self.motivos
        } else {
            let lowerCase = searchBar.text!
            self.filtro = self.motivos.filter({$0.range(of: lowerCase, options: .caseInsensitive) != nil })
        }
        self.reloadData()
    }

}
