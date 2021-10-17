//
//  EditarHerPickerView.swift
//  Reto01
//
//  Created by user193889 on 10/16/21.
//

import UIKit

class EditarHerPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
        
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

