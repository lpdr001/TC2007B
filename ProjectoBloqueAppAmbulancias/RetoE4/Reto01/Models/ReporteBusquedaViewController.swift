//
//  ReporteBusquedaViewController.swift
//  Reto01
//
//  Created by Adriana López on 07/10/21.
//

/*

import UIKit
import Firebase  // falta

class ReporteBusquedaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    

    
    let searController = UISearchController()
    

    var userList = [User]()
    var filteredUsers = [User]()
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initList()
        initSearchController()
    }
        
    func initSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["Todo", "Nombre","Expediente Electrónico", "Sesiones", "Motivo", "Tipo de Servicio", "Intervención", "Herramienta","Fecha", "Tanatólogo"]
        searchController.searchBar.delegate = self
    }
    
    func initList()
    {
        let nombre = User(id: "0", name: "nombre 1")
        userList.append(nombre1)
        
        let expediente = User(id: "1", name: "expediente 1")
        userList.append(expediente1)
        
        let sesiones = User(id: "2", name: "sesion 1")
            userList.append(sesion1)
            
        let motivo = User(id: "3", name: "motivo 1")
            userList.append(motivo1)
            
        let servicio = User(id: "4", name: "servicio 1")
            userList.append(servicio1)
            
        let intervencion = User(id: "5", name: "intervencion 1")
            userList.append(circle2)
            
        let herramienta = User(id: "6", name: "herramienta 1")
            userList.append(herramienta1)
            
        let fecha = User(id: "7", name: "fecha 1")
            userList.append(fecha1)
            
        let tanatologo = User(id: "8", name: "tanatologo1")
            userList.append(tanatologo1)
            

        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(searchController.isActive)
        {
            return filteredUsers.count
        }
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
            
        let thisUser: User!
        
        if(searchController.isActive)
        {
            thisUser = filteredUsers[indexPath.row]
        }
        else
        {
            thisUser = userList[indexPath.row]
        }
        
        
        tableViewCell.userName.text = thisUser.id + " " + thisUser.name
        tableViewCell.userImage.image = UIImage(named: thisUser.imageName)
            
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "detailSegue")
        {
            let indexPath = self.userTableView.indexPathForSelectedRow!
                
            let tableViewDetail = segue.destination as? TableViewDetail
                
            let selectedShape: User!
                
            if(searchController.isActive)
            {
                selectedUser = filteredUsers[indexPath.row]
            }
            else
            {
                selectedUser = UserList[indexPath.row]
            }
                
                
            tableViewDetail!.selectedShape = selectedShape
            
            self.userTableView.deselectRow(at: indexPath, animated: true)
        }
    }

        
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
            
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton :String = "All")
    {
        filteredUsers = userList.filter
        {
            user in
            let scopeMatch = (scopeButton == "All" || user.name.lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != "")
            {
                let searchTextMatch = user.name.lowercased().contains(searchText.lowercased())
                    
                return scopeMatch && searchTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        userTableView.reloadData()
    }
}

*/







    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


