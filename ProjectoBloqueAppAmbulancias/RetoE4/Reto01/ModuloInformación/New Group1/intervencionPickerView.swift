//
//  intervencionPickerView.swift
//  Reto01
//
//  Created by Adriana López on 15/10/21.
//
import UIKit

class intervencionPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var currentValue = "Tanatología"
    
    let intervenciones = ["Tanatología", "Acompañamiento Individual", "Acompañamiento Grupal", "Logoterapia", "Mindfulness", "Aromaterapia y Musicoterapia", "Cristaloterapia", "Reiki", "Biomagnetismo", "Angeloterapia", "Cama Térmica de Jade", "Flores de Bach", "Brisas ambientales","Tanatología"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return intervenciones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentValue = intervenciones[row]
        print(currentValue)
        return intervenciones[row]
    }
    
    func getSelected(_ pickerView: UIPickerView, selectedRow row: Int) -> String? {
        currentValue = intervenciones[row]
        print(currentValue)
        return intervenciones[row]
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


