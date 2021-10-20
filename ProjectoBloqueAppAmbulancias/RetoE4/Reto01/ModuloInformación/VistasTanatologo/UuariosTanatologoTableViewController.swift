//
//  UuariosTanatologoTableViewController.swift
//  Reto01
//
//  Created by user193889 on 10/5/21.
//

import UIKit
import Firebase

class UuariosTanatologoTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var UITableView: UITableView!
   
    var UsuarioControlador = UsuariosController()
    var Tananame = ""
    var tanatologo = Tanatologo(id:"", nombre:"", password:"", user:"")
    var datos = [Usuario]()
    var filtroDatos = [Usuario]()
   // var datosResult = [Usuario]() = {
     //   return filtroDatos ?? datos
    //}()
    let sections = ["Usuarios"]
    

    @IBOutlet weak var tname: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        searchBar.delegate = self

   // }
   // override func viewDidLoad() {
     //   super.viewDidLoad()
       
        Tananame = LogInViewController.Lv.datos[0].nombre
        tanatologo = LogInViewController.Lv.datos[0]
        tname.text = Tananame
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //let str = "Herramientas Alternativas"//[//3] = ["Herramientas Alternativas", "Holístico", "Acompañamiento"]
        
        UsuarioControlador.fetchServicios(st: tanatologo.id){ (result) in
            switch result{
            case .success(let usuarios):self.updateUI(with: usuarios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
        }

}


func updateUI(with usuarios:Usuarios){
    DispatchQueue.main.async {
        self.datos = usuarios
        self.filtroDatos = usuarios
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
                
        return filtroDatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
        // Configure the cell...
        var s:String
        switch filtroDatos[indexPath.row].cerrado {
        case true:
            s = "Cerrado";
        default:
            s = "Abierto";
        }

        cell.textLabel?.text = filtroDatos[indexPath.row].nombre
        cell.detailTextLabel?.text = "Expediente cerrado:" + String(filtroDatos[indexPath.row].cerrado)
        
        
        
        return cell
    }
    
   // return dataString.range(of: searchText, options: .caseInsensitive) != nil

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print ("using bar")
        if searchBar.text == nil || searchBar.text == "" {
            self.filtroDatos = self.datos
        } else {
            let lowerCase = searchBar.text!
            self.filtroDatos = self.datos.filter({$0.nombre.range(of: lowerCase, options: .caseInsensitive) != nil })
        }
        tableView.reloadData()
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

    @IBAction func EditarTan(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "ETan") as! EditarTanatologoViewController
        
        balanceViewController.sup = self.tanatologo
        //balanceViewController.datos = self.datos
        self.show(balanceViewController, sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! DetalleUsuariosTableViewController
        let indice = self.tableView.indexPathForSelectedRow?.item //indexPathForSelectedRow?.row
      
        siguiente.Username = datos[indice!].nombre
        siguiente.UserID = datos[indice!].id
        siguiente.user = datos[indice!]
        siguiente.tanatologo = self.tanatologo
    }
    

}
