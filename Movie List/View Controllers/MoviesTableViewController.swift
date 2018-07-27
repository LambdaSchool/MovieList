//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, MovieControllerProtocol, UITableViewDelegate, MovieTableViewCellDelegate, UISearchBarDelegate {
    
    
    
    //MARK: - METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        guard let movieCell = cell as? MovieTableViewCell else {return cell}
        let movie = movieController?.currentMoviesArray[indexPath.row]
        movieCell.movie = movie
        movieCell.delegate = self
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController?.currentMoviesArray.count ?? 0
    }
    
    func seenButtonWasTapped(on cell: MovieTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        guard let movie = movieController?.movies[indexPath.row] else {return}
        movieController?.switchHasBeenSeen(movie: movie)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieController?.sort()
        tableView.reloadData()
    }
 
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieController?.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    }
    
    //SEARCH BAR
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let movieController = movieController else {return}
        guard !searchText.isEmpty else {
            movieController.currentMoviesArray = movieController.movies
            tableView.reloadData()
            return}
        if movieController.movies.count > 0 {
            movieController.currentMoviesArray = movieController.movies.filter({movie -> Bool in
    
                movie.movieTitle.lowercased().contains(searchText.lowercased())
            })
            tableView.reloadData()
        }
        
    }
    
    
    //METHODS: - PROPERTIES
    @IBOutlet weak var tableView: UITableView!
    var movieController: MovieController?
    @IBOutlet weak var searchBar: UISearchBar!
}
