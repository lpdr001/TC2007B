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

class ReporteDeIndicadoresViewController: UIViewController{
    
    static var inst = ReporteDeIndicadoresViewController()
    @IBOutlet weak var FechaInicial: UIDatePicker!
    @IBOutlet weak var FechaFinal: UIDatePicker!
    @IBOutlet weak var Cuota: UILabel!
    
    @IBOutlet weak var UAPP: UILabel!
    @IBOutlet weak var SPP: UILabel!
    @IBOutlet weak var IPP: UILabel!
    
    
    @IBOutlet weak var search1: UISearchBar!
    @IBOutlet weak var tableview1: motivosTbleView!
    
    @IBOutlet weak var tableview2: cuotaYtanTableView!
    @IBOutlet weak var search2: UISearchBar!
    
    @IBOutlet weak var CuotaGlobal: UILabel!
    
    @IBOutlet weak var vistapie: UIView!
    @IBOutlet weak var vistabubble: UIView!
    @IBOutlet weak var vistabarras: UIView!
    var UC = UsuariosController()
    var SC = SesionesController()
    var TC = TanatologosController()
    
    var FiltrodatosUsuarios = [Usuario]()
    
    var FiltrodatosSesiones = [Sesion]()
    
    var FiltrodatosTanatologos = [Tanatologo]()
    
    lazy var graficaBarras: BarChartView = {
        var g =  BarChartView()
        return g
    }()
    
    lazy var graficaBubble: PieChartView = {
        var h =  PieChartView()
        return h
    }()
    
    lazy var graficaPie: PieChartView = {
        var k =  PieChartView()
        return k
    }()
    override func viewDidLoad() {

        super.viewDidLoad()
        ReporteDeIndicadoresViewController.inst = self
        
        let toDate = FechaFinal.date
        let fromDate = Calendar.current.date(byAdding: .month, value: -1, to: toDate)

        FechaInicial.date = fromDate!
        
        let fromDate1 = Calendar.current.date(byAdding: .day, value: +1, to: toDate)
        
        FechaFinal.date = fromDate1!
        
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
        
        vistapie.addSubview(graficaPie)
        graficaPie.center(in: vistapie)
        graficaPie.width(to: vistapie)
        graficaPie.height(to: vistapie)
        
        
        tableview1.delegate = tableview1
        tableview1.dataSource = tableview1
        tableview2.delegate = tableview2
        tableview2.dataSource = tableview2
        
        GetData()
        
    
    }
    
    
    @IBAction func cerrarteclado(_ sender: UITapGestureRecognizer) {
    }
    
    
    @IBAction func updateFecha(_ sender: UIDatePicker) {
        GetData()
    }
    
    
    func GetData(){
        DispatchQueue.main.async {
            
            
            self.UC.fetchUsers(start: self.FechaInicial.date, End: self.FechaFinal.date){ (result) in
            switch result{
            case .success(let sesiones):self.definirUsuarios(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
        }
            
            self.TC.fetchEspecificTanatologos(st: ""){ (result) in
                switch result{
                case .success(let usuarios):self.definirTanatologos(with: usuarios)
                case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
                }

                
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
        DispatchQueue.main.async {
            self.FiltrodatosUsuarios = sesiones
            self.definicionGraficaBarras()
            print("Set Us")
        }
    }
    
    func definirSesiones(with sesiones:Sesiones){
        DispatchQueue.main.async {
            self.FiltrodatosSesiones = sesiones
            self.definicionGraficaBubble()
            print("Set Ses")
        }
    }
    
    func definirTanatologos(with tanatologos: Tanatologos){
        DispatchQueue.main.async {
            self.FiltrodatosTanatologos = tanatologos
            print("Set Tan")
            self.tableview2.SetData(mot: self.FiltrodatosTanatologos)
        }
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
        
        UAPP.text = "Hombres: " + String(punto1.y) + " Mujeres: " + String(punto2.y)
        
        SC.fetchSesionesTiempo(start: FechaInicial.date, End: FechaFinal.date){ (result) in
            switch result{
            case .success(let sesiones):self.definirSesiones(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
        }
    }
    
    func definicionGraficaBubble(){
        let punto1 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.servicio == "Servicios de Acompañamiento"}).count), label: "Servicios de Acompañamiento")
        let punto2 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.servicio == "Servicios holísticos"}).count), label: "Servicios holísticos")
        let punto3 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.servicio == "Herramientas alternativas"}).count), label: "Herramientas alternativas")

        var arreglo = [PieChartDataEntry]()
        arreglo.append(punto1)
        arreglo.append(punto2)
        arreglo.append(punto3)
        
        let dataSet = PieChartDataSet(entries: arreglo)
        let colores = [UIColor.blue, UIColor.green ,UIColor.lightGray]
        dataSet.colors = colores //ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: dataSet)
        graficaBubble.data = data
        graficaBubble.notifyDataSetChanged()
        
        SPP.text = "Servicios Acompañamiento: " + String(punto1.y) + " Servicios Holísticos: " + String(punto2.y) + " Herramientas Aalternativas: " + String(punto3.y)
        definicionGraficaPie()
    }
    
    func definicionGraficaPie(){
        let intervenciones = ["Tanatología", "Acompañamiento Individual", "Acompañamiento Grupal", "Logoterapia", "Mindfulness", "Aromaterapia y Musicoterapia", "Cristaloterapia", "Reiki", "Biomagnetismo", "Angeloterapia", "Cama Térmica de Jade", "Flores de Bach", "Brisas ambientales","Tanatología"]
        let punto1 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Tanatología"}).count), label: intervenciones[0])
        let punto2 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Acompañamiento Individual"}).count), label: intervenciones[1])
        let punto3 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Acompañamiento Grupal"}).count), label: intervenciones[2])
        let punto4 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Logoterapia"}).count), label: intervenciones[3])
        let punto5 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Mindfulness"}).count), label: intervenciones[4])
        let punto6 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Aromaterapia y Musicoterapia"}).count), label: intervenciones[5])
        let punto7 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Cristaloterapia"}).count), label: intervenciones[6])
        let punto8 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Reiki"}).count), label: intervenciones[7])
        let punto9 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Biomagnetismo"}).count), label: intervenciones[8])
        let punto10 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Angeloterapia"}).count), label: intervenciones[9])
        let punto11 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Cama Térmica de Jade"}).count), label: intervenciones[10])
        let punto12 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Flores de Bach"}).count), label: intervenciones[11])
        let punto13 = PieChartDataEntry(value: Double(self.FiltrodatosSesiones.filter({$0.intervencion == "Brisas ambientales"}).count), label: intervenciones[12])
        
        var arreglo = [PieChartDataEntry]()
        
        if(punto1.value != 0){
            arreglo.append(punto1)}
        if(punto2.value != 0){
            arreglo.append(punto2)}
        if(punto3.value != 0){
            arreglo.append(punto3)}
        if(punto4.value != 0){
            arreglo.append(punto4)}
        if(punto5.value != 0){
            arreglo.append(punto5)}
        if(punto6.value != 0){
            arreglo.append(punto6)}
        if(punto7.value != 0){
            arreglo.append(punto7)}
        if(punto8.value != 0){
            arreglo.append(punto8)}
        if(punto9.value != 0){
            arreglo.append(punto9)}
        if(punto10.value != 0){
            arreglo.append(punto10)}
        if(punto11.value != 0){
            arreglo.append(punto11)}
        if(punto12.value != 0){
            arreglo.append(punto12)}
        if(punto13.value != 0){
            arreglo.append(punto13)}
        
        
        let dataSet = PieChartDataSet(entries: arreglo)
        //let colores = [UIColor.blue, UIColor(red: 0, green: 1.0, blue: 1.0, alpha: 1.0),UIColor.lightGray]
        dataSet.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: dataSet)
        graficaPie.data = data
        graficaPie.notifyDataSetChanged()
        
        IPP.text = "Tanatología" + String(punto1.y) + " Acompañamiento Individual" + String(punto2.y) + " Acompañamiento Grupal" + String(punto3.y) + " Logoterapia" + String(punto4.y)
        
        IPP.text! += " Mindfulness" + String(punto5.y) + " Aromaterapia y Musicoterapia" + String(punto6.y) + " Cristaloterapia" + String(punto7.y)
        
        IPP.text! += " Reiki" + String(punto8.y) + " Biomagnetismo" + String(punto9.y) + " Angeloterapia" + String(punto10.y) + " Cama Térmica de Jade" + String(punto11.y) + " Flores de Bach" + String(punto12.y) + " Brisas ambientales" + String(punto13.y)
        
        tableview1.reloadData()
        tableview2.reloadData()
        
        var sum = 0
        for s in FiltrodatosSesiones{
            sum += s.cuota
        }
        
        Cuota.text = String(sum) + "$"
    }

}
