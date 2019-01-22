//
//  WeatherListTableViewController.swift
//  WeatherApp-MVVM
//
//  Created by Ice on 22/1/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate{
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
        
        print(vm.name)
        print(vm.currentTemperature)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Nevigation Controller Not Found")
        }

        guard let addWeatherCityVC = nav.viewControllers.first as?
            AddWeatherCityViewController else{
                fatalError("AddWeatherCityController Not Found")
        }

        addWeatherCityVC.delegate = self

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        return cell
    }
}
