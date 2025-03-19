//
//  MoviesRouter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
protocol MoviesRouting: AnyObject {
    func showDetailMovie(movie: Movie)
}

class MoviesRouter: MoviesRouting {
    private weak var moviesViewController: MoviesViewController!
    private var detailMovieRouter: DetailMovieRouter!
    
    func setMoviesViewController(moviesViewController: MoviesViewController) {
        self.moviesViewController = moviesViewController
    }
    
    func setDetailMovieRouter(detailMovieRouter: DetailMovieRouter) {
        self.detailMovieRouter = detailMovieRouter
    }
    
    func showDetailMovie(movie: Movie) {
        detailMovieRouter.showDetailMovie(referenceVC: moviesViewController, movie: movie)
    }
}

