//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    
    var movieRepository: MovieRepository!
    var movies = [Movie]()
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func refreshClicked(_ sender: UIButton) {
        loadMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.tableFooterView = UIView()
        moviesTableView.dataSource = self;
        
        loadMovies()
    }
    
    func loadMovies() {
        loadingMovies()
        
        DispatchQueue.global(qos: .background).async {
            
            self.receiveMovies()
            
            DispatchQueue.main.async {
                self.loadedMovies()
            }
        }
    }
    
    func receiveMovies() {
        self.movies = self.movieRepository.getMovies()
    }
    
    func loadingMovies() {
        removeMovies()
        updateTable()
        updateCount(texto: "loading ...")
    }
    
    func loadedMovies() {
        moviesTableView.reloadData()
        updateCount(texto: "Movies: " + String(movies.count))
    }
    
    func updateCount(texto: String) {
        titleLabel.text = texto
    }
    
    func removeMovies() {
        movies.removeAll()
    }
    
    func updateTable() {
        moviesTableView.reloadData()
    }

}


extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)as! MovieTableViewCell
        
        let movie:Movie = movies[indexPath.item]
        cell.configure(movie: movie)
        
        return cell
    }
}
