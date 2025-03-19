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

final class MoviesPresenter {
    private var moviesInteractor: MoviesInteractor!
    private weak var loadListMovies: LoadListMoviesViewController?
    private var moviesRouting: MoviesRouting?
    var movies: [Movie] = []
    
    func setMoviesInteractor(moviesInteractor: MoviesInteractor) {
        self.moviesInteractor = moviesInteractor
    }
    
    func setLoadListMovies(loadListMovies: LoadListMoviesViewController) {
        self.loadListMovies = loadListMovies
    }
    
    func setMoviesRouter(moviesRouting: MoviesRouting) {
        self.moviesRouting = moviesRouting
    }
    
    func reloadMovies() {
        removeMovies()
        loadListMovies?.loadingMovies()
        moviesInteractor.loadMovies()
    }
 
    func removeMovies() {
        movies.removeAll()
    }
    
    func showMovieDetail(indexPath: Int) {
        let movie: Movie = movies[indexPath]
        moviesRouting?.showDetailMovie(movie: movie)
    }
}

extension MoviesPresenter: ShowMoviesPresenter {
    func showListMovies(movies: [Movie]) {
        self.movies = movies
        self.loadListMovies?.uploadedMovies()
    }
}
