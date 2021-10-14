//
//  ReporteDeIndicadoresViewController.swift
//  Reto01
//
//  Created by user193889 on 10/14/21.
//

import UIKit
import Firebase
import Charts
import TinyConstraints

class ReporteDeIndicadoresViewController: UIViewController {
    @IBOutlet weak var vistabarras: UIView!
    var UC = UsuariosController()
    
    var datosUsuarios = [Usuario]()
    var FiltrodatosUsuarios = [Usuario]()
    
    lazy var graficaBarras: BarChartView = {
        var g =  BarChartView()
        return g
    }()
    override func viewWillAppear(_ animated: Bool)  {
        //super.viewDidLoad()
        // Do any additional setup after loading the view.
        vistabarras.addSubview(graficaBarras)
        graficaBarras.center(in: vistabarras)
        graficaBarras.width(to: vistabarras)
        graficaBarras.height(to: vistabarras)
        
        UC.fetchUsers{ (result) in
            switch result{
            case .success(let sesiones):self.definirUsuarios(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
    }
    }
    
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    
    func definirUsuarios(with sesiones:Usuarios){
        datosUsuarios = sesiones
        FiltrodatosUsuarios = sesiones
        definicionGraficaBarras()
    }
    
    func definicionGraficaBarras(){

        let punto1 = BarChartDataEntry(x: 1, y: Double(self.FiltrodatosUsuarios.filter({$0.sexo == "Hombre"}).count))
        let punto2 = BarChartDataEntry(x: 2, y: Double(self.FiltrodatosUsuarios.filter({$0.sexo == "Mujer"}).count))

        var arreglo = [BarChartDataEntry]()
        arreglo.append(punto1)
        arreglo.append(punto2)

        let dataSet = BarChartDataSet(entries: arreglo, label: "Usuarios atendidos")
        let colores = [UIColor.blue, UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)]
        dataSet.colors = colores //ChartColorTemplates.colorful()
        let data = BarChartData(dataSet: dataSet)
        graficaBarras.data = data
        let motivos = ["Hombres","Mujer"]
        graficaBarras.xAxis.valueFormatter = IndexAxisValueFormatter(values: motivos)
        graficaBarras.chartDescription?.text = "del 1-oct al 30-dic"
        graficaBarras.notifyDataSetChanged()
    }

}
