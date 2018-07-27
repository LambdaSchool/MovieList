//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Vuk Radosavljevic on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, MovieControllerProtocol {
    
    //MARK: - TABLE VIEW DATA SOURCE
    
    
    //MARK: - METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        guard let movieCell = cell as? MovieTableViewCell else {return cell}
        let movie = movieController?.movies[indexPath.row]
        movieCell.movie = movie
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController?.movies.count ?? 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    
    //METHODS: - PROPERTIES
    @IBOutlet weak var tableView: UITableView!
    var movieController: MovieController?
}
