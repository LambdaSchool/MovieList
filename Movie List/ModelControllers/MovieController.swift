//
//  MovieController.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    
    //MARK: varROPERTIES
    private(set) var movies = [Movie]()
    
    //MARK: - METHODS
    func createNewMovie(movieTitle: String) {
        let movie = Movie(movieTitle: movieTitle)
        movies.append(movie)
    }
    
    func switchHasBeenSeen(movie: Movie) {
        movie.hasMovieBeenSeen = !movie.hasMovieBeenSeen
    }

}
