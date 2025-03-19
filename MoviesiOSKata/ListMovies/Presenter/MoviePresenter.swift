//
//  MoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
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
    
    func setLoadListMovies(loadListMovies: LoadListMoviesViewController) {
        self.loadListMovies = loadListMovies
    }
    
    func setMovieRouter(movieRouting: MoviesRouting) {
        self.movieRouting = movieRouting
    }
    
    func reloadMovies() {
        removeMovies()
        loadListMovies?.loadingMovies()
        movieInteractor.loadMovies()
    }
 
    func removeMovies() {
        movies.removeAll()
    }
    
    func showMovieDetail(indexPath: Int) {
        let movie: Movie = movies[indexPath]
        movieRouting?.showDetailMovie(movie: movie)
    }
}

extension MoviePresenter: ShowMoviesPresenter {
    func showListMovies(movies: [Movie]) {
        self.movies = movies
        self.loadListMovies?.uploadedMovies()
    }
}
