//
//  DetalleServicioViewController.swift
//  Tabla524
//
//  Created by molina on 06/09/21.
//

import UIKit

class DetalleServicioViewController: UIViewController {
    var elServicio:Servicio?
    
    
    @IBOutlet weak var nombreServicio: UILabel!
    
   
    @IBOutlet weak var imagenPrueba: UIImageView!
    
    @IBOutlet weak var descServicio: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nombreServicio.text = elServicio?.nombre
        descServicio.text = elServicio?.desc
        
        
        imagenPrueba.image = UIImage(named: "Image")
        switch elServicio?.tipo {
        case "CETAC":
            imagenPrueba.image = UIImage(named: "Image")
        case "Holístico":
            imagenPrueba.image = UIImage(named: "Image1")
        case "Acompañamiento":
            imagenPrueba.image = UIImage(named: "Image2")
        default:
            imagenPrueba.image = UIImage(named: "Image3")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
