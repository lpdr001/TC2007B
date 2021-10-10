//
//  DetalleUsuariosTableViewController.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import UIKit

class DetalleUsuariosTableViewController: UITableViewController {
    @IBOutlet var UITableView: UITableView!
    @IBOutlet var Namedisplay: UILabel!
    var UsuarioControlador = SesionesController()
    var Username = ""
    var UserID = ""
    var user = Usuario(domicilio:"",estadoCivil:"",iDRA:"",idTanatologo:"",motivo:"",ocupacion:"",procedencia:"",referencia:"",religion:"",sexo:"", nombre:"",fechaIngreso:"",cerrado:false,edad:0,telefono:0)

    var datos = [Sesion]()

    let sections = ["Sesiones"]
    
    var bo = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Namedisplay.text = Username
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //let str = "Herramientas Alternativas"//[//3] = ["Herramientas Alternativas", "Holístico", "Acompañamiento"]
        
        UsuarioControlador.fetchSesiones(st: UserID){ (result) in
            switch result{
            case .success(let sesiones):self.updateUI(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }

            
        }

}


func updateUI(with sesiones:Sesiones){
    DispatchQueue.main.async {
        self.datos = sesiones
        self.tableView.reloadData()
    }
    
    
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
                
        return datos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
        
        let date = datos[indexPath.row].fecha
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        
        //cell.textLabel?.text = strDate
        cell.detailTextLabel?.text = datos[indexPath.row].idUsuario
        
        
        
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
    
    @IBAction func add(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "b2")
        
        //balanceViewController.user = self.user
            self.show(balanceViewController, sender: nil)

    }
    
    
    
    @IBAction func Editar(_ sender: Any) {
        bo = false
        /*let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "b1") as! EditarUserViewController
        
        balanceViewController.user = self.user
            self.show(balanceViewController, sender: nil)*/

    }
    
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let siguiente = segue.destination as! DetalleSesionViewController
            siguiente.datos = self.datos}
    else if segue.identifier == "segue1" {
            let siguiente2 = segue.destination as! EditarUserViewController
            
            siguiente2.user = self.user
        }
    }
    

}

