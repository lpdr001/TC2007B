//
//  DetalleServicioViewController.swift
//  TablaEstatica
//
//  Created by molina on 29/08/21.
//

import UIKit

class DetalleServicioViewController: UIViewController {
    
    var servicioControlador = ServicioController()
    
    @IBOutlet weak var editBoton: UIBarButtonItem!
    @IBOutlet weak var saveBoton: UIButton!
    @IBOutlet weak var cancelBoton: UIButton!
    @IBOutlet weak var nombre: UITextField!
    var elServicio: Servicio?
    var editar = false
    
//    var nombreServicio:String = ""
//    var descServicio:String = ""

    @IBOutlet weak var descripcion: UITextView!
    
    func botones(estado:Bool){
        if estado{
            editBoton.isEnabled = false
            saveBoton.isHidden =  false
            cancelBoton.isHidden =  false
            descripcion.isEditable = true
            nombre.isEnabled = true
        }
        else{
            editBoton.isEnabled = true
            saveBoton.isHidden =  true
            cancelBoton.isHidden =  true
            descripcion.isEditable = false
            nombre.isEnabled = false
        }
        
    }
    
    @IBAction func editarServicio(_ sender: UIBarButtonItem) {
        editar = !editar
        botones(estado: editar)
       
    }
    
    /*@IBAction func guardarEdicion(_ sender: UIButton) {
        editar = !editar
        botones(estado: editar)
        let servicioUpdated = Servicio(id: elServicio!.id, nombre: nombre.text!, desc: descripcion.text!)
        servicioControlador.updateServicio(updateServicio: servicioUpdated){ (result) in
            switch result{
            case .success(let retorno):self.displayExito(title: retorno, detalle: "Se actualizó el registro")
            case .failure(let error):self.displayError(error, title: "No se pudo modificar el registro")
            }
            
        }
    }*/
    @IBAction func cancelarEdicion(_ sender: UIButton) {
        editar = !editar
        botones(estado: editar)
        nombre.text = self.elServicio?.nombre
        descripcion.text = self.elServicio?.desc
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nombre.text = self.elServicio?.nombre
        descripcion.text = self.elServicio?.desc
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
}
