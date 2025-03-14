//
//  OverviewPresenter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import Foundation

protocol configOverviewVC: AnyObject {
    func config(movie: Movie)
}

final class OverviewPresenter {
    
    private var movieRepo: MovieRepository
    private weak var overviewVC: configOverviewVC?
    var movieId: Int!
    
    init(movieRepo: MovieRepository!, movieId: Int!) {
        self.movieRepo = movieRepo
        self.movieId = movieId
    }
    
    func setOverviewVC(overviewVC: configOverviewVC) {
        self.overviewVC = overviewVC
    }
    
    func showMovie() {
        guard let movie = movieRepo.getMovieById(movieId: movieId) else { return }
        overviewVC?.config(movie: movie)
    }
}
