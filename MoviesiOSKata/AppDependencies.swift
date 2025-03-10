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
    
    let movieRepository = DiskMovieRepository()
    
    func injectDependencies(window: UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController{
            if let moviesViewController = navigationController.visibleViewController as?  MoviesViewController {
                moviesViewController.movieRepository = movieRepository
            }
            
        }
    }
}

