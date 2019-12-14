//
//  RestaurantFactory.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 29/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import Foundation
import CoreLocation


class RestaurantFactory {
    
    static func restaurantWith(dictionary: [String:Any]) -> Restaurant? {
        guard
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let coordinates = dictionary["coordinates"] as? [String: Double],
            let lat = coordinates["lat"],
            let lon = coordinates["lon"] else {
                return nil
        }
        let pictureURL = dictionary["pictureURL"] as? String
        return Restaurant(id: id,
                        name: name,
                        location: CLLocation(latitude: lat, longitude: lon),
                        pictureURL: pictureURL != nil ? URL(string: pictureURL!) : nil)
    }
}
