//
//  RestaurantService.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 27/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import Foundation

protocol RestaurantService {
    
    //@escaping, il peut sortir du context courant
    func getALL(completion: @escaping ([Restaurant]) -> Void)
    
    func getById(_ id: String, completion :@escaping (Restaurant?) -> Void)

    
    
}
