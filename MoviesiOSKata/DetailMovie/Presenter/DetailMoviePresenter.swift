//
//  OverviewPresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
protocol DetailMovieVC: AnyObject {
    func showDetailMovie(movie: Movie)
}

final class DetailMoviePresenter {
    private var detailMovieVC: DetailMovieVC!
    private var movie: Movie?
    
    func setMovie(movie: Movie) {
        self.movie = movie
    }
    
    func setDetailMovieVC(detailMovieVC: DetailMovieVC) {
        self.detailMovieVC = detailMovieVC
    }
    
    func showMovie() {
        guard let movie: Movie = movie else { return }
        detailMovieVC.showDetailMovie(movie: movie)
    }
}
