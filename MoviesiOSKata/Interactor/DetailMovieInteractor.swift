//
//  DetailMovieInteractor.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import Foundation

protocol GetMovieDetailInteractor: AnyObject {
    func getMovie(movieId : Int) -> Movie?
}

class DetailMovieInteractor: GetMovieDetailInteractor {
    private var movieRepository: MovieRepository!
    
    func setMovieRepository(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func getMovie(movieId : Int) -> Movie?{
        movieRepository.getMovieById(movieId: movieId)
    }
}
