//
//  DetalleServicioViewController.swift
//  Tabla524
//
//  Created by molina on 06/09/21.
//

import UIKit

class DetalleServicioViewController: UIViewController {
    var elServicio:Servicio?
    var imageName = "Image1"
    var section = ""
    var descServicio = ""
    
    @IBOutlet weak var nombreServicio: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var imgDEsc: UITextView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        nombreServicio.text = String(format: "%.2f", imageName)
        nombreServicio.text = elServicio?.nombre
        descServicio.text = elServicio?.desc
        //imageName.text = elServicio?.desc
        
        //imagen.image = UIImage(named: "Image1")
        
        var imgDEsc: Bool = true
        switch imgDEsc {
        
        case section == "C":
            imagen.image = UIImage(named: "Image")
            
        case section == "Ho":
            imagen.image = UIImage(named: "Image1")
            
        case section == "A":
            imagen.image = UIImage(named: "Image2")
       
        default:
            imagen.image = UIImage(named: "Image3")
    
        }
         
        
       /*
        nombreServicio.text = elServicio?.nombre
        descServicio.text = elServicio?.desc
        
         imagen.image = UIImage(named: "Image1")
        
        if (section == "C"){
            imagen.image = UIImage(named: "Image")
        }
        else if (section == "Ho"){
            imagen.image = UIImage(named: "Image1")
            
        }
        else if (section == "A"){
          
            imagen.image = UIImage(named: "Image2")
        }
        else if (section == "Ha"){
           
            imagen.image = UIImage(named: "Image3")
           
        }
        */
        
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
