//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//
import UIKit

class MoviesViewController: UIViewController {
    private var moviesPresenter: MoviesPresenter!
    
    @IBOutlet private weak var moviesTableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBAction private func refreshClicked(_ sender: UIButton) {
        reloadMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.tableFooterView = UIView()
        moviesPresenter.setLoadListMovies(loadListMovies: self)
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        reloadMovies()
    }
    
    func setMoviesPresenter(moviesPresenter: MoviesPresenter) {
        self.moviesPresenter = moviesPresenter
    }
    
    func reloadMovies() {
        moviesPresenter.reloadMovies()
    }
    
    func changeText(text: String) {
        titleLabel.text = text
    }
    
    func updateTable() {
        moviesTableView.reloadData()
    }
}

extension MoviesViewController: LoadListMoviesViewController {
    func loadingMovies() {
        updateTable()
        changeText(text: "loading ...")
    }
    
    func uploadedMovies() {
        updateTable()
        changeText(text: "Movies: \(moviesPresenter.movies.count)")
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesPresenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie: Movie = moviesPresenter.movies[indexPath.item]
        cell.configure(movie: movie)
        
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesPresenter.showMovieDetail(indexPath: indexPath.row)
    }
}
