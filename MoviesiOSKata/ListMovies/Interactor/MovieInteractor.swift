//
//  Mvoies.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import Foundation

protocol GetMoviesInteractor: AnyObject {
    func loadMovies()
}

protocol ShowMoviesPresenter: AnyObject {
    func showListMovies(movies: [Movie])
}

class MovieInteractor: GetMoviesInteractor {
    private var movieRepository: MovieRepository!
    private weak var moviePresenter: ShowMoviesPresenter?
    
    func setMovieRepository(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func setMoviePresenter(moviePresenter: ShowMoviesPresenter) {
        self.moviePresenter = moviePresenter
    }
    
    func loadMovies(){
        DispatchQueue.global(qos: .background).async {
            let movies: [Movie] = self.movieRepository.getMovies()
            DispatchQueue.main.async {
                self.moviePresenter?.showListMovies(movies: movies)
            }
        }
    }
}
