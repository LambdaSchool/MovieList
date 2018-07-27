//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol MovieTableViewCellDelegate: class {
    func seenButtonWasTapped(on cell: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {
    
    //MARK: - PROPERTIES
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    weak var delegate: MovieTableViewCellDelegate?
    
    
    //MARK: - METHODS
    @IBAction func seenButtonPressed(_ sender: Any) {
        delegate?.seenButtonWasTapped(on: self)
        }
    
    func updateViews() {
        guard let movie = movie else {return}
        movieLabel.text = movie.movieTitle
        if movie.hasMovieBeenSeen {
            seenButton.setTitle("Seen", for: .normal)
        } else {
            seenButton.setTitle("Not Seen", for: .normal)
        }
    }
    
    
    
    
}
