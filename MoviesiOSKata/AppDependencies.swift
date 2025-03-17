//
//  AppDependencies.swift
//  MoviesiOSKata
//
//  Created by Radmas on 7/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    private let movieRepo: MovieRepository = DiskMovieRepository()
    private let moviePresenter: MoviePresenter = MoviePresenter()
    
    func injectDependencies(window: UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController{
            if let moviesViewController = navigationController.visibleViewController as?  MoviesViewController {
                moviePresenter.setMovieRepository(movieRepo: movieRepo)
                moviesViewController.setMoviePresenter(moviePresenter: moviePresenter)
            }
            
        }
    }
}

