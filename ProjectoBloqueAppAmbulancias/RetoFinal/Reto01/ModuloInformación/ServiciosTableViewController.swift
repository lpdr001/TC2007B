//
//  ServiciosTableViewController.swift
//  Tabla524
//
//  Created by molina on 06/09/21.
//

import UIKit
import Firebase

class ServiciosTableViewController: UITableViewController {
    
    @IBOutlet var UITableView: UITableView!
    var servicioControlador = ServicioController()
    var C = [Servicio]()
    var Ho = [Servicio]()
    var A = [Servicio]()
    var Ha = [Servicio]()
    
    var tmpdatos = [Servicio]()
    var datos = [Servicio]()
    let sections = ["CETAC", "Holístico", "Acompañamiento","Herramientas Alternativas"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //let str = "Herramientas Alternativas"//[//3] = ["Herramientas Alternativas", "Holístico", "Acompañamiento"]
        
        for n in 0...3 {
            print(n)
        
        servicioControlador.fetchServicios(st: sections[n]){ (result) in
            switch result{
            case .success(let servicios):self.updatelist(list:n , with: servicios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
        }

            
        }

}
    func updatelist(list : Int ,with servicios:Servicios){
        DispatchQueue.main.async {
            if (list == 0){
            self.C = servicios
            }
            else if (list == 1){
            self.Ho = servicios
            }
            else if (list == 2){
            self.A = servicios
            }
            else if (list == 3){
            self.Ha = servicios
                self.updateUI()
            }
        }
    }

func updateUI(){
     
    self.datos.append(contentsOf: C)
    self.datos.append(contentsOf: Ho)
    self.datos.append(contentsOf: A)
    self.datos.append(contentsOf: Ha)
    self.tmpdatos = datos
        self.tableView.reloadData()
    
}
func displayError(_ error: Error, title: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]

        return section
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let section = self.sections[section]
        var count = 0
        
        for i in datos {
            if(i.tipo == section){
                count += 1;
            }
        }
        
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
        // Configure the cell...
        let list = indexPath.section

        cell.textLabel?.text = tmpdatos[indexPath.row].nombre
        
        
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! DetalleServicioViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        let section = self.tableView.indexPathForSelectedRow?.section
        if (section == 0){
            siguiente.elServicio = C[indice!]
        }
        else if (section == 1){
            siguiente.elServicio = Ho[indice!]
        }
        else if (section == 2){
            siguiente.elServicio = A[indice!]
        }
        else if (section == 3){
            siguiente.elServicio = Ha[indice!]
        }
        siguiente.elServicio = datos[indice!]
    }
    

}
