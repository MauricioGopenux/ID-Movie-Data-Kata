//
//  MoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import Foundation
import UIKit

protocol ConfMovieViewController: AnyObject {
    func updateTable()
    func updateCount(texto: String)
}

final class MoviePresenter {
    
    private var movieRepo: MovieRepository
    private weak var configMovies: ConfMovieViewController?
    var movies: [Movie] = []
    
    
    init(movieRepo: MovieRepository) {
        self.movieRepo = movieRepo
    }
    
    func getMovies() {
        movies = movieRepo.getMovies()
    }
    
    func setConfigMovies(configMovies: ConfMovieViewController) {
        self.configMovies = configMovies
    }
 
    
    func removeMovies() {
        movies.removeAll()
    }
    
    func showOverview(movieId: Int, referenceVC: UIViewController) {
        guard let idMovie = movies[movieId].id else { return }
        let overviewPresenter = OverviewPresenter(movieRepo: movieRepo, movieId: idMovie)
        let overviewVC = OverviewViewController(overviewPresenter: overviewPresenter)
        referenceVC.navigationController?.pushViewController(overviewVC, animated: true)
    }
    
    func loadMovies() {
        removeMovies()
        loadinMovies()
        showListMovies()
    }
    
    func loadinMovies() {
        configMovies?.updateTable()
        configMovies?.updateCount(texto: "loading ...")
    }
    
    func showListMovies() {
        DispatchQueue.global(qos: .background).async {
            self.getMovies()
            
            DispatchQueue.main.async {
                self.configMovies?.updateTable()
                self.configMovies?.updateCount(texto: "Movies: \(self.movies.count)")
            }
        }
    }
    
    
}
