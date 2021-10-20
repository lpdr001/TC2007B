//
//  reporteH.swift
//  Reto01
//
//  Created by Paola Diaz on 19/10/21.
//

import UIKit


class reporteHistoricoViewCell: UITableViewCell{

    @IBOutlet weak var NU: UILabel!
    @IBOutlet weak var EE: UILabel!
    @IBOutlet weak var Ses: UILabel!
    @IBOutlet weak var Mot: UILabel!
    @IBOutlet weak var Ser: UILabel!
    @IBOutlet weak var Int: UILabel!
    @IBOutlet weak var Tan: UILabel!
    @IBOutlet weak var Fecha: UILabel!

}


class reporteHistoricoTableView:   UITableViewController, UISearchBarDelegate{


    @IBOutlet weak var searchBar: UISearchBar!


    var tc = TanatologosController()
    var sc = SesionesController()
    var uc = UsuariosController()

    var datos = [Tanatologo]()
    var datos1 = [Usuario]()
    var datos2 = [Sesion]()

    var filtro = [Tanatologo]()
    var filtro1 = [Usuario]()
    var filtro2 = [Sesion]()

override func viewWillAppear(_ animated: Bool) {
    self.tableView.keyboardDismissMode = .onDrag
    searchBar.delegate = self

    tc.fetchEspecificTanatologos(st: ""){ (result) in
        switch result{
        case .success(let sesiones):self.ReloadScene(with: sesiones)
        case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
        }

    }
}
    @IBAction func CloseKeyboard(_ sender: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
    }

    func ReloadScene(with sesiones:Tanatologos){

        self.datos = sesiones
        self.filtro = datos

    uc.fetchallUsers{ (result) in
        switch result{
        case .success(let sesiones):self.updateUI(with: sesiones)
        case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
        }
}
}
    func updateUI(with sesiones:Usuarios){
        self.datos1 = sesiones
        self.filtro1 = datos1

        sc.fetchAllSesiones{ (result) in
            switch result{
            case .success(let sesiones):self.updateUI2(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
    }
    }


func updateUI2(with sesiones:Sesiones){

    self.datos2 = sesiones.sorted(by: {$0.fecha > $1.fecha })
    self.filtro2 = self.datos2
    self.tableView.reloadData()
}

func displayError(_ error: Error, title: String) {
    DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}



override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Reportes"
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows

    return filtro2.count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath) as! reporteHistoricoViewCell

    let today = filtro2[indexPath.row].fecha
    let formatter1 = DateFormatter()
    formatter1.dateStyle = .short
    let h = formatter1.string(from: today)

    cell.Fecha.text = h

    let user = self.filtro1.filter({$0.id == filtro2[indexPath.row].idUsuario})
    let tan = self.filtro.filter({$0.id == user[0].idTanatologo})

    cell.NU.text = user[0].nombre
    cell.EE.text = filtro2[indexPath.row].idUsuario
    cell.Ses.text = String(filtro2[indexPath.row].numeroSesion)
    cell.Mot.text = filtro2[indexPath.row].motivo
    cell.Ser.text = filtro2[indexPath.row].servicio
    cell.Int.text = filtro2[indexPath.row].intervencion
    cell.Tan.text = tan[0].nombre

    return cell
}

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print ("using bar2")
    if searchBar.text == nil || searchBar.text == "" {
        self.filtro2 = self.datos2
    } else {
        let lowerCase = searchBar.text!
        self.filtro2 = self.datos2.filter({ (book:Sesion) -> Bool in
                                            let titleMatch = book.intervencion.range(of: lowerCase, options: NSString.CompareOptions.caseInsensitive)
                                            let authorMatch = book.idUsuario .range(of: lowerCase, options: NSString.CompareOptions.caseInsensitive)
                                            let seriesMatch = book.motivo.range(of: lowerCase, options: NSString.CompareOptions.caseInsensitive)
                                            let numSesion = book.servicio.range(of: lowerCase, options: NSString.CompareOptions.caseInsensitive)
                    return titleMatch != nil || authorMatch != nil || seriesMatch != nil || numSesion != nil}
                )
    }
    tableView.reloadData()
}
}
