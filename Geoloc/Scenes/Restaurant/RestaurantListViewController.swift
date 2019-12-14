//
//  RestaurantListViewController.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 27/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {

    public static let RestaurantTableViewCellId = "rtvc"
    
    @IBOutlet var restaurantTableView: UITableView!
    var restaurants: [Restaurant] = [] {
        //met à jour le tableau à chaque fois que le tableau est modifié
        didSet {
            self.restaurantTableView.reloadData()
        }
    }
    var restaurantService: RestaurantService {
        //return RestaurantMockService()
        return RestaurantAPIService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //fixer la taille de la cellule
        self.restaurantTableView.rowHeight = 200
        // Do any additional setup after loading the view.
        self.restaurantTableView.dataSource = self
        self.restaurantTableView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(touchSearchButton))
        
        //relier avec la cellule que nous avons créer
        self.restaurantTableView.register(UINib(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: RestaurantListViewController.RestaurantTableViewCellId)
    
    }
    override func viewDidAppear(_ animated: Bool) {
        self.restaurantService.getALL { (restaurants) in
            self.restaurants = restaurants
        }
    }
    
    @objc func touchSearchButton() {
        let mapViewController = RestaurantMapViewController()
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RestaurantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.restaurants[indexPath.row].name
        return cell */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantListViewController.RestaurantTableViewCellId, for: indexPath) as! RestaurantTableViewCell
        let restaurant = self.restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.detailsLabel.text = restaurant.location.description
        cell.pictureImageView.image = UIImage(named: "background5")
        
        cell.pictureImageView.image = nil //restore default image
        if let pictureUrl = restaurant.pictureURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: pictureUrl) {
                    DispatchQueue.main.sync {
                        cell.pictureImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
    
    
}


extension RestaurantListViewController: UITableViewDelegate {
    
}

