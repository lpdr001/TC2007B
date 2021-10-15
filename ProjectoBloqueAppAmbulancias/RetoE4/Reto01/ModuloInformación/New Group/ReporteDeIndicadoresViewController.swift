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
    
    @IBOutlet weak var FechaInicial: UIDatePicker!
    @IBOutlet weak var FechaFinal: UIDatePicker!
    
    
    
    @IBOutlet weak var vistapie: UIView!
    @IBOutlet weak var vistabubble: UIView!
    @IBOutlet weak var vistabarras: UIView!
    var UC = UsuariosController()
    var SC = SesionesController()
    
    var datosUsuarios = [Usuario]()
    var FiltrodatosUsuarios = [Usuario]()
    
    var datosSesiones = [Sesion]()
    var FiltrodatosSesiones = [Sesion]()
    
    lazy var graficaBarras: BarChartView = {
        var g =  BarChartView()
        return g
    }()
    
    lazy var graficaBubble: BubbleChartView = {
        var g =  BubbleChartView()
        return g
    }()
    
    override func viewWillAppear(_ animated: Bool)  {
        //super.viewDidLoad()
        let toDate = FechaFinal.date
        let fromDate = Calendar.current.date(byAdding: .month, value: -1, to: toDate)

        FechaInicial.date = fromDate!
        // If you want to have exactly 30 days before
        //let fromDate = Calendar.current.date(byAdding: .day, value: -30, to: toDate)
        // Do any additional setup after loading the view.
        
        vistabarras.addSubview(graficaBarras)
        graficaBarras.center(in: vistabarras)
        graficaBarras.width(to: vistabarras)
        graficaBarras.height(to: vistabarras)
        
        vistabubble.addSubview(graficaBubble)
        graficaBubble.center(in: vistabubble)
        graficaBubble.width(to: vistabubble)
        graficaBubble.height(to: vistabubble)
        
        GetData()
    
    }
    
    @IBAction func updateFecha(_ sender: UIDatePicker) {
        GetData()
    }
    
    
    func GetData(){
        UC.fetchUsers(start: FechaInicial.date, End: FechaFinal.date){ (result) in
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
    
    func definirSesiones(with sesiones:Sesiones){
        datosSesiones = sesiones
        FiltrodatosSesiones = sesiones
        definicionGraficaBarras()
    }
    
    func definicionGraficaBarras(){

        let punto1 = BarChartDataEntry(x: 1, y: Double(self.FiltrodatosUsuarios.filter({$0.sexo == "Hombre"}).count), data: "Hombre")
        let punto2 = BarChartDataEntry(x: 2, y: Double(self.FiltrodatosUsuarios.filter({$0.sexo == "Mujer"}).count), data: "Mujer")

        var arreglo = [BarChartDataEntry]()
        arreglo.append(punto1)
        arreglo.append(punto2)

        let dataSet = BarChartDataSet(entries: arreglo, label: "Usuarios atendidos")
        let colores = [UIColor.blue, UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)]
        dataSet.colors = colores //ChartColorTemplates.colorful()
        let data = BarChartData(dataSet: dataSet)
        graficaBarras.data = data
        //let motivos = ["Hombres","Mujer"]
        //graficaBarras.xAxis.valueFormatter = IndexAxisValueFormatter(values: motivos)
        //graficaBarras.chartDescription?.text = "del 1-oct al 30-dic"
        graficaBarras.notifyDataSetChanged()
        
        SC.fetchSesionesTiempo(start: FechaInicial.date, End: FechaFinal.date){ (result) in
            switch result{
            case .success(let sesiones):self.definirSesiones(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
        }
    }
    
    func definicionGraficaBubble(){
        let punto1 = BubbleChartDataEntry(x: 1, y: 1, size: CGFloat(Double(self.FiltrodatosSesiones.filter({$0.servicio == "Servicios Acompañamiento"}).count)), data: "Servicios Acompañamiento")
        let punto2 = BubbleChartDataEntry(x: 2, y: 1, size: CGFloat(Double(self.FiltrodatosSesiones.filter({$0.servicio == "Servicios Holísticos"}).count)), data: "Servicios Holísticos")
        let punto3 = BubbleChartDataEntry(x: 3, y: 1, size: CGFloat(Double(self.FiltrodatosSesiones.filter({$0.servicio == "Herramientas Alternativas"}).count)), data: "Herramientas Alternativas")
        
        var arreglo = [BubbleChartDataEntry]()
        arreglo.append(punto1)
        arreglo.append(punto2)
        arreglo.append(punto3)
        
        let dataSet = BubbleChartDataSet(entries: arreglo)
        let colores = [UIColor.blue, UIColor(red: 0, green: 1.0, blue: 1.0, alpha: 1.0),UIColor.lightGray]
        dataSet.colors = colores //ChartColorTemplates.colorful()
        let data = BubbleChartData(dataSet: dataSet)
        graficaBubble.data = data
        graficaBubble.notifyDataSetChanged()
    }

}
