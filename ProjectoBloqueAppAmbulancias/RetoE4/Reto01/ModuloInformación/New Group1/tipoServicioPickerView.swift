//
//  TipoServicioPickerView.swift
//  Reto01
//
//  Created by Adriana López on 15/10/21.
//

import UIKit

class tipoServicioPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currentValue = "Servicios de Acompañamiento"

    let servicios = ["Servicios de Acompañamiento", "Servicios holísticos", "Herramientas alternativas"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return servicios.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentValue = servicios[row]
        print(currentValue)
        return servicios[row]
    }
    
    func getSelected(_ pickerView: UIPickerView, selectedRow row: Int) -> String? {
        currentValue = servicios[row]
        print(currentValue)
        return servicios[row]
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


    


