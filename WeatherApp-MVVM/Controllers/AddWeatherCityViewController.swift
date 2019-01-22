//
//  AddWeatherCityViewController
//  WeatherApp-MVVM
//
//  Created by Ice on 22/1/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController{
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed(){
        
        if let city = cityNameTextField.text {
            
            let id = "167db99d3414a00fc858dbf112fabb78"
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(id)")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL){ data in
                
                let weaTherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weaTherVM
            }
            
            WebService().load(resource: weatherResource){ [weak self] result in
                
                if let weatherVM = result{
                    
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
            }
            
        }
        
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
