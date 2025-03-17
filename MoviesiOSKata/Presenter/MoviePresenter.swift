//
//  MoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateMovieViewController: AnyObject {
    func updateTable()
    func loadingCount()
    func loadCount()
}

final class MoviePresenter {
    private var movieRepo: MovieRepository!
    private weak var updateMovies: UpdateMovieViewController?
    var movies: [Movie] = []
    
    func setMovieRepository(movieRepo: MovieRepository) {
        self.movieRepo = movieRepo
    }
    
    func loadMovies() {
        movies = movieRepo.getMovies()
    }
    
    func setUpdateMovies(updateMovies: UpdateMovieViewController) {
        self.updateMovies = updateMovies
    }
 
    func removeMovies() {
        movies.removeAll()
    }
    
    func reloadMovies() {
        removeMovies()
        loadinMovies()
        showListMovies()
    }
    
    func loadinMovies() {
        updateMovies?.updateTable()
        updateMovies?.loadingCount()
    }
    
    func showListMovies() {
        DispatchQueue.global(qos: .background).async {
            self.loadMovies()
            
            DispatchQueue.main.async {
                self.updateMovies?.updateTable()
                self.updateMovies?.loadCount()
            }
        }
    }
}
