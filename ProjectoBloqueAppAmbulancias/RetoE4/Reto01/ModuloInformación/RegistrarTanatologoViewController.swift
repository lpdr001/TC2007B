//
//  RegistrarTanatologoViewController.swift
//  Reto01
//
//  Created by user193889 on 10/13/21.
//

import UIKit

class RegistrarTanatologoViewController: UIViewController {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func Registrar(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
