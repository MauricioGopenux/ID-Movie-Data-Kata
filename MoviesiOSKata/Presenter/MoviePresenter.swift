//
//  MoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import Foundation

protocol LoadListMoviesViewController: AnyObject {
    func loadingMovies()
    func uploadedMovies()
}

final class MoviePresenter {
    private var movieInteractor: GetMoviesInteractor!
    private weak var loadListMovies: LoadListMoviesViewController?
    private var movieRouting: MoviesRouting?
    var movies: [Movie] = []
    
    func setMovieInteractor(movieInteractor: GetMoviesInteractor) {
        self.movieInteractor = movieInteractor
    }
    
    func loadMovies() {
        movies = movieInteractor.loadMovies()
    }
    
    func setLoadListMovies(loadListMovies: LoadListMoviesViewController) {
        self.loadListMovies = loadListMovies
    }
    
    func setMovieRouter(movieRouting: MoviesRouting) {
        self.movieRouting = movieRouting
    }
    
    func reloadMovies() {
        removeMovies()
        loadListMovies?.loadingMovies()
        showListMovies()
    }
 
    func removeMovies() {
        movies.removeAll()
    }
    
    func showListMovies() {
        DispatchQueue.global(qos: .background).async {
            self.loadMovies()
            
            DispatchQueue.main.async {
                self.loadListMovies?.uploadedMovies()
            }
        }
    }
    
    func showMovieDetail(indexPath: Int) {
        let movieId = movies[indexPath].id
        movieRouting?.showDetailMovie(movieId: movieId)
    }
}
