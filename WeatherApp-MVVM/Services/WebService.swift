//
//  WebService.swift
//  WeatherApp-MVVM
//
//  Created by Ice on 22/1/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService{
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url){data,response,error in
            //print(data)
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }else{
                completion(nil)
            }
            
        }.resume()
    }
    
}
