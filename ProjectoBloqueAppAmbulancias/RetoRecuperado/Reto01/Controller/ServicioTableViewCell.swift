//
//  ServicioTableViewCell.swift
//  TablaEstatica
//
//  Created by molina on 11/09/21.
//

import UIKit

class ServicioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombreServicio: UILabel!
    
    @IBOutlet weak var descServicio: UILabel!
    func update(with servicio:Servicio){
        nombreServicio.text = servicio.nombre
        descServicio.text = servicio.desc
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
