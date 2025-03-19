//
//  OverviewPresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import Foundation

protocol DetailMovieVC: AnyObject {
    func showDetailMovie(movie: Movie)
}

final class DetailMoviePresenter {
    private var detailMovieInteractor: GetMovieDetailInteractor!
    private var detailMovieVC: DetailMovieVC!
    private var movieId: Int?
    
    func setMovieId(movieId: Int) {
        self.movieId = movieId
    }
    
    func setMDetailMovieInteractor(detailMovieInteractor: GetMovieDetailInteractor) {
        self.detailMovieInteractor = detailMovieInteractor
    }
    
    func setDetailMovieVC(detailMovieVC: DetailMovieVC) {
        self.detailMovieVC = detailMovieVC
    }
    
    func showMovie() {
        guard let movieId: Int = movieId , let movie: Movie = detailMovieInteractor.getMovie(movieId: movieId) else { return }
        detailMovieVC.showDetailMovie(movie: movie)
    }
}
