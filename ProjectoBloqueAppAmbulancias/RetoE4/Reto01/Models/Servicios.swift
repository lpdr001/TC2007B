//
//  Servicios.swift
//  Tabla524
//
//  Created by molina on 06/09/21.
//

import Foundation
import Firebase

struct Servicio: Codable {
    let id:String
    let nombre, desc, tipo: String
    
    init(nombre:String, desc:String, tipo:String){
        self.nombre = nombre
        self.desc  = desc
        self.tipo = tipo
        id = "1234"
    }
    init(id:String, nombre:String, desc:String, tipo:String){
        self.id = id
        self.nombre = nombre
        self.desc  = desc
        self.tipo = tipo
    }
    init(aDoc: DocumentSnapshot){
        self.id = aDoc.documentID
        self.nombre = aDoc.get("nombre") as? String ?? ""
        self.desc = aDoc.get("desc") as? String ?? ""
        self.tipo = aDoc.get("tipo") as? String ?? ""
    }
}

typealias Servicios = [Servicio]


/*
extension Servicio{
    static func listaServicios()->[Servicio]{
        return [
            Servicio(nombre: "Tanatología", desc:"Proceso de encuentro personal en donde a través de un diálogo con la ayuda de técnicas y herramientas tanatológicas la persona identifica y reconoce sus emociones ante una pérdida."),
            Servicio(nombre: "Acompañamiento Individual", desc:"Proceso individual en donde se crea un vínculo de afecto y confianza, la persona se siente escuchada, comprendida, respetada y aceptada. Se busca resignificar su propia vida de alguna situación que está viviendo o vivió (miedos, violencia, dudas, inseguridades, bloqueos, vicios, etc.) con el fin de ayudarlos a desarrollar soluciones en su propio beneficio y vivir el aquí y el ahora."),
            Servicio(nombre: "Acompañamiento Grupal", desc: "Proceso en donde las personas no se enjuician, se comparten las experiencias que al mismo tiempo está siendo vivida por el resto de los participantes. Se crean lazos de confianza, compasión, empatía y aceptación en un espacio seguro en donde se es libre de comunicar y dar solución ante una situación."),
            Servicio(nombre: "Logoterapia", desc: "Proceso para guiar a la persona en su búsqueda del sentido de vida y permite descubrir la capacidad que tienen los humanos para superar los condicionamientos más difíciles “sanar a través del sentido”. Sanar, cuidar, acompañar lo que implica buscar sentido y esencia para vivir en plenitud."),
            Servicio(nombre: "Mindfulness", desc: "Es una práctica que ayuda a la persona a enfocarse en el presente reconociendo que puede pasar por momentos de estrés, momentos de crisis laboral y personal, de baja autoestima y depresión. A través de herramientas de autoconocimiento, autoreconocimiento y autocontrol podemos entrenar la mente para tener una actitud de apertura, aceptación y solución en cualquier situación de nuestra vida para un balance y dominio emocional.")
        ]
    
    }
}
 */
