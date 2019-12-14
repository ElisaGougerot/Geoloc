//
//  HomeViewController.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 27/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var titleLablel: UILabel!
    @IBOutlet var commanderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home";
        //Changer le nom du bouton en focntion de la langue
        self.commanderButton.setTitle(NSLocalizedString("home.display_commander", comment : ""), for: .normal)
        

        // Do any additional setup after loading the view.
    }

    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    // Cycle de vie de la view : par exemple faire apparaitre ou non la ToolBar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.titleLablel.alpha = 0
        self.commanderButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3, animations:  {
            self.titleLablel.alpha = 1
            self.commanderButton.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat, .curveEaseOut], animations: {
                var frame = self.titleLablel.frame
                frame.origin.y += 50
                self.titleLablel.frame = frame
            })
        }
        
    }
    
    
    
    @IBAction func touchCommander(_ sender: Any) {
        
        guard let navigationView = self.navigationController?.view else {
            return
        }
        UIView.transition(with: navigationView, duration: 0.33, options: .transitionFlipFromRight, animations: {
            self.navigationController?.pushViewController(RestaurantListViewController(), animated: true)
        })
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
    
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
