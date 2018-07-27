//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    
    //MARK: - PROPERTIES
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - METHODS
    @IBAction func seenButtonPressed(_ sender: Any) {
        movie!.hasMovieBeenSeen = !(movie!.hasMovieBeenSeen)
        updateViews()
        }
    
    func updateViews() {
        guard let movie = movie else {return}
        movieLabel.text = movie.movieTitle
        if movie.hasMovieBeenSeen {
            seenButton.setTitle("Not Seen", for: .normal)
        } else {
            seenButton.setTitle("Seen", for: .normal)
        }
    }
    
    
    
    
}
