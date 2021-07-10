//
//  WeatherCell.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var mainStatusLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func cellBind(_ model: WeatherViewModel) {
        idLbl.text = model.id
        descriptionLbl.text = model.description
        dateLbl.text = model.date
        mainStatusLbl.text = model.main
    }
    
}
