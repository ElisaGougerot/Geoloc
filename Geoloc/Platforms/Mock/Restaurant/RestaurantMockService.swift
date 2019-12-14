//
//  RestaurantMockService.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 27/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import Foundation
import CoreLocation

class RestaurantMockService: RestaurantService {
    
    private let restaurants: [Restaurant] = [
        Restaurant(id: "1", name: "Cantine", location: CLLocation(latitude: 48.8491666, longitude: 2.3875456), pictureURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP8qDh24Q36hIaPYX1QtyjpKRE6DfPxD5MGn41x83dGBfVv0tu&s")),
        
        Restaurant(id: "2", name: "Burger King", location: CLLocation(latitude: 48.8491652, longitude: 2.3722247), pictureURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6pt5ojg6nisPM41rkY5aAnsZc05j-4UIyoWznDiLqD7W5hSGf&s"))
    ]
    
    func getALL(completion: @escaping ([Restaurant]) -> Void) {
    
        completion(self.restaurants)
        
    }
    
    func getById(_ id: String, completion: @escaping (Restaurant?) -> Void) {
        completion(self.restaurants.first(where: {
            (r) -> Bool in
            return r.id == id
        }))
    }
    
}
