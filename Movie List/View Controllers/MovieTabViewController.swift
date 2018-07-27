//
//  MovieTabViewController.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieTabViewController: UITabBarController {

    //MARK: - PROPERTIES
    let movieController = MovieController()
    

    //MARK: - METHODS
    func passMovieControllerToChildVcs() {
        for childVC in childViewControllers {
            if let vc = childVC as? MovieControllerProtocol {
                vc.movieController = movieController
            }
            }
        }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        passMovieControllerToChildVcs()
    }

    
}
