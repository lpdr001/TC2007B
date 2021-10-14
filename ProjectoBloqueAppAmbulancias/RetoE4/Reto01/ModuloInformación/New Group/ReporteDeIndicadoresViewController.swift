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
    
    lazy var graficaBarras: BarChartView = {
        var g =  BarChartView()
        return g
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vistabarras.addSubview(graficaBarras)
        graficaBarras.center(in: vistabarras)
        graficaBarras.width(to: vistabarras)
        graficaBarras.heightToWidth(of: vistabarras)
        definicionGraficaBarras()
    }
    
    func definicionGraficaBarras(){
        let punto1 = BarChartDataEntry(x: 1, y: 12)
        let punto2 = BarChartDataEntry(x: 2, y: 8)
        let punto3 = BarChartDataEntry(x: 3, y: 14)
        var arreglo = [BarChartDataEntry]()
        arreglo.append(punto1)
        arreglo.append(punto2)
        arreglo.append(punto3)
        let dataSet = BarChartDataSet(entries: arreglo, label: "Sesiones por motivo")
        var colores = [UIColor.blue, UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor.yellow]
        dataSet.colors = colores //ChartColorTemplates.colorful()
        let data = BarChartData(dataSet: dataSet)
        graficaBarras.data = data
        let motivos = ["No aplica","Duelo", "Violencia", "Adicción"]
        graficaBarras.xAxis.valueFormatter = IndexAxisValueFormatter(values: motivos)
        graficaBarras.chartDescription?.text = "del 1-oct al 30-dic"
        graficaBarras.notifyDataSetChanged()
    }

}
