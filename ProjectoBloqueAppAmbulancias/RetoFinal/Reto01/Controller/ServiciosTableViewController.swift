//
//  ServiciosTableViewController.swift
//  TablaEstatica
//
//  Created by molina on 29/08/21.
//

import UIKit

class ServiciosTableViewController: UITableViewController {

    
    var servicioControlador = ServicioController()
    var datos = [Servicio]()
    
    
    @IBAction func editarTabla(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        servicioControlador.fetchServicios{ (result) in
            switch result{
            case .success(let servicios):self.updateUI(with: servicios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
        tableView.rowHeight =  UITableView.automaticDimension
        tableView.estimatedRowHeight = 70.0
        servicioControlador.fetchServicios{ (result) in
            switch result{
            case .success(let servicios):self.updateUI(with: servicios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
    }
    
    func updateUI(with servicios:Servicios){
        DispatchQueue.main.async {
            self.datos = servicios
            self.tableView.reloadData()
        }
    }
    func updateUI(){
        
        servicioControlador.fetchServicios{ (result) in
            switch result{
            case .success(let servicios):self.updateUI(with: servicios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
        
    }
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    func displayExito(title: String, detalle:String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: detalle, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath) as! ServicioTableViewCell

        // Configure the cell...
//        cell.textLabel?.text = datos[indexPath.row].nombre
        cell.update(with: datos[indexPath.row])


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            servicioControlador.deleteServicio(registroID: datos[indexPath.row].id){ (result) in
                switch result{
                /*case .success(let retorno):self.displayExito(title: retorno, detalle: "Se eliminó el registro")*/
                case .success(let retorno):self.updateUI()
                case .failure(let error):self.displayError(error, title: "No se pudo eliminar")
                }
                
            }
            //datos.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .fade)
          
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedData = datos.remove(at: fromIndexPath.row)
        datos.insert(movedData, at: to.row)

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
        if segue.identifier == "detalle"{
            let siguiente = segue.destination as! DetalleServicioViewController
            let indice = self.tableView.indexPathForSelectedRow?.row
            siguiente.elServicio = datos[indice!]
        }
    }
    
}
