//
//  WeatherListViewModel.swift
//  WeatherApp-MVVM
//
//  Created by Ice on 22/1/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModel = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel){
        self.weatherViewModel.append(vm)
    }
    
    func numberOfRows(_ section:Int) -> Int {
        return self.weatherViewModel.count
    }
    
    func modelAt(_ index: Int)->WeatherViewModel{
        return self.weatherViewModel[index]
    }
    
}

struct WeatherViewModel: Decodable {

    let name:String
    let currentTemperature:TemperatureViewmodel
    
    private enum CodingKeys: String, CodingKey{
        case name
        case currentTemperature = "main"
    }

}

struct TemperatureViewmodel:Decodable {
    let temperature:Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey{
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
