//
//  DetalleSesionViewController.swift
//  Reto01
//
//  Created by user193889 on 10/6/21.
//

import UIKit

class DetalleSesionViewController: UIViewController {

    @IBOutlet weak var sesionDesc: UILabel!
    var datos = [Sesion]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sesionDesc.text = datos[0].evaluacion

        // Do any additional setup after loading the view.
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
