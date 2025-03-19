//
//  Mvoies.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import Foundation

protocol ShowMoviesPresenter: AnyObject {
    func showListMovies(movies: [Movie])
}

class MoviesInteractor {
    private var moviesRepository: MoviesRepository!
    private weak var moviesPresenter: ShowMoviesPresenter?
    
    func setMoviesRepository(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func setMoviesPresenter(moviesPresenter: ShowMoviesPresenter) {
        self.moviesPresenter = moviesPresenter
    }
    
    func loadMovies(){
        DispatchQueue.global(qos: .background).async {
            let movies: [Movie] = self.moviesRepository.getMovies()
            DispatchQueue.main.async {
                self.moviesPresenter?.showListMovies(movies: movies)
            }
        }
    }
}
