//
//  RestaurantAPIService.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 29/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class RestaurantAPIService: RestaurantService {
    /*
    func getALL(completion: @escaping ([Restaurant]) -> Void) {
        Alamofire.request("https://moc4a-poi.herokuapp.com/restaurants").responseString { response in
            if let JSON = response.result.value {
                print(JSON)
            }
        }
    }
    */
    
    func getALL(completion: @escaping ([Restaurant]) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://moc4a-poi.herokuapp.com/restaurants")!) { (data, res, err) in
            
            DispatchQueue.main.sync {
                guard let d=data,
                    let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [[String: Any]] else {
                        completion([])
                        return
                }
                completion(json.compactMap(RestaurantFactory.restaurantWith(dictionary:)))
            }
        }.resume()
    }
    
    func getById(_ id: String, completion: @escaping (Restaurant?) -> Void) {
        completion(nil)
    }
    
}
