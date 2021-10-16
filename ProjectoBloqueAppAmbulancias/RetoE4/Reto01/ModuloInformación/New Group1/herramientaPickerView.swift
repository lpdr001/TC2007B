//
//  herramientaPickerView.swift
//  Reto01
//
//  Created by Adriana López on 15/10/21.
//


import UIKit

class herramientaPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currentValue = "Contención"

    let herramienta = ["Contención", "Diálogo", "Ejercicio", "Encuadre", "Infografía", "Dinámica", "Lectura", "Meditación", "Video", "Otro"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return herramienta.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentValue = herramienta[row]
        print(currentValue)
        return herramienta[row]
    }
    
    func getSelected(_ pickerView: UIPickerView, selectedRow row: Int) -> String? {
        currentValue = herramienta[row]
        print(currentValue)
        return herramienta[row]
    }

}


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


