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
    var currentMoviesArray = [Movie]()
    
    //MARK: - METHODS
    func createNewMovie(movieTitle: String) {
        let movie = Movie(movieTitle: movieTitle)
        movies.append(movie)
        currentMoviesArray = movies
    }
    
    func switchHasBeenSeen(movie: Movie) {
        movie.hasMovieBeenSeen = !movie.hasMovieBeenSeen
    }
    
    func delete(at indexPath: Int) {
        movies.remove(at: indexPath)
    }
    
    func sort() {
        movies = movies.sorted(by: {$0.movieTitle < $1.movieTitle})
        currentMoviesArray = movies
    }

}
