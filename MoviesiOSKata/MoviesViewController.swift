//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//
import UIKit

class MoviesViewController: UIViewController {
    private var moviePresenter: MoviePresenter!
    
    @IBOutlet private weak var moviesTableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBAction private func refreshClicked(_ sender: UIButton) {
        reloadMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.tableFooterView = UIView()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        reloadMovies()
    }
    
    func setMoviePresenter(moviePresenter: MoviePresenter) {
        self.moviePresenter = moviePresenter
    }
    
    func reloadMovies() {
        moviePresenter.reloadMovies()
    }
    
    func updatecount(text: String) {
        titleLabel.text = text
    }
    
    func updateTable() {
        moviesTableView.reloadData()
    }
}

extension MoviesViewController: LoadListMoviesViewController {
    func loadingMovies() {
        updateTable()
        updatecount(text: "loading ...")
    }
    
    func uploadedMovies() {
        updateTable()
        updatecount(text: "Movies: \(moviePresenter.movies.count)")
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviePresenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie: Movie = moviePresenter.movies[indexPath.item]
        cell.configure(movie: movie)
        
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviePresenter.showMovieDetail(indexPath: indexPath.row)
    }
}
