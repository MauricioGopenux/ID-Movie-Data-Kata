//
//  Mvoies.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import Foundation

protocol GetMoviesInteractor: AnyObject {
    func loadMovies() -> [Movie]
}

class MovieInteractor: GetMoviesInteractor {
    private var movieRepository: MovieRepository!
    
    func setMovieRepository(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func loadMovies() -> [Movie] {
        movieRepository.getMovies()
    }
}
