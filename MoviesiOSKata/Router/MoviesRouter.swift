//
//  MoviesRouter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
protocol MoviesRouting: AnyObject {
    func showDetailMovie(movieId: Int)
}

class MoviesRouter: MoviesRouting {
    private weak var moviesViewController: MoviesViewController?
    private var detailMovieRouting: DetailMovieRouting?
    
    func setMoviesViewController(moviesViewController: MoviesViewController) {
        self.moviesViewController = moviesViewController
    }
    
    func setDetailMovieRouting(detailMovieRouting: DetailMovieRouting) {
        self.detailMovieRouting = detailMovieRouting
    }
    
    func showDetailMovie(movieId: Int) {
        guard let vc = moviesViewController else { return }
        detailMovieRouting?.showDetailMovie(referenceVC: vc, movieId: movieId)
    }
}

