//
//  AddNewMoviesViewController.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AddNewMoviesViewController: UIViewController, MovieControllerProtocol {

    //MARK: - PROPERTIES
    @IBOutlet weak var movieTextField: UITextField!
    
    
    //MARK: - METHODS
    @IBAction func addMovieButtonPressed(_ sender: Any) {
        guard let movie = movieTextField.text else {return}
        movieController?.createNewMovie(movieTitle: movie)
        movieTextField.text = ""
    }
    
    
    var movieController: MovieController?
    
}
