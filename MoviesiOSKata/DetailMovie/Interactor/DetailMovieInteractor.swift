//
//  DetailMovieInteractor.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
protocol GetMovieDetailInteractor: AnyObject {
    func getMovie(movieId : Int) -> Movie?
}

class DetailMovieInteractor: GetMovieDetailInteractor {
    private var movieRepository: MovieRepository!
    
    func setMovieRepository(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func getMovie(movieId : Int) -> Movie?{
        movieRepository.getMovies().first(where: {$0.id == movieId})
    }
}
