//
//  WeatherCell.swift
//  WeatherApp-MVVM
//
//  Created by Ice on 22/1/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell{
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel.text = "\(vm.name)"
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature.formatAsDegree)"
    }
}
