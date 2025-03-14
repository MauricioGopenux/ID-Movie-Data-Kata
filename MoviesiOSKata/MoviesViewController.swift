//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import UIKit

protocol MoviePresenterProtocol: AnyObject {
    
    func loadMovies()
}

class MoviesViewController: UIViewController {

    @IBOutlet private weak var moviesTableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBAction private func refreshClicked(_ sender: UIButton) {
        loadMovies()
    }
    
    private var moviePresenter: MoviePresenter!
    
    
    func setMoviePresenter(moviePresenter: MoviePresenter) {
        self.moviePresenter = moviePresenter
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.tableFooterView = UIView()
        moviesTableView.dataSource = self
        moviesTableView.delegate  = self
        moviePresenter.setConfigMovies(configMovies: self)
        loadMovies()
    }
    
    func loadMovies() {
        moviePresenter.loadMovies()
    }

}

extension MoviesViewController: ConfMovieViewController {
    
    func updateTable() {
        moviesTableView.reloadData()
        
    }
    
    func updateCount(texto: String) {
        titleLabel.text = texto
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviePresenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)as! MovieTableViewCell
        
        let movie: Movie = moviePresenter.movies[indexPath.item]
        cell.configure(movie: movie)
        
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        moviePresenter.showOverview(movieId: indexPath.row, referenceVC: self)
          
      }
}



