//
//  TanatologosAminTableViewController.swift
//  Reto01
//
//  Created by user193889 on 10/13/21.
//

import UIKit

class TanatologosAminTableViewController: UITableViewController , UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var UITableView: UITableView!
    
    var tc = TanatologosController()
    
    var datos = [Tanatologo]()
    var filtroDatos = [Tanatologo]()

    override func viewWillAppear(_ animated: Bool) {
        
        searchBar.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tc.fetchEspecificTanatologos(st: ""){ (result) in
            switch result{
            case .success(let usuarios):self.updateUI(with: usuarios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }

            
        }    }


    func updateUI(with usuarios:Tanatologos){
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
            return 1
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           
            return "Tanatologos"
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
                    
            return filtroDatos.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
            // Configure the cell...

            cell.textLabel?.text = filtroDatos[indexPath.row].nombre
            
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

    @IBAction func Addtan(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "ATan")//as! SesionesViewController
        
        //balanceViewController.user = self.user
        //balanceViewController.datos = self.datos
        self.show(balanceViewController, sender: nil)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //let siguiente = segue.destination as! UuariosTanatologoTableViewController
        let indice = self.tableView.indexPathForSelectedRow?.item
        var tmp = [Tanatologo]()
        tmp.append(filtroDatos[indice!])
        LogInViewController.Lv.datos = tmp
        
    }

}
