//
//  DetailMovieRouter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import UIKit

class DetailMovieRouter {
    
    private weak var appDependencies: AppDependencies!
    
    func setAppDependencies(appDependencies: AppDependencies) {
        self.appDependencies = appDependencies
    }
    
    func showDetailMovie(referenceVC: UIViewController, movie: Movie) {
        let detailVC =  appDependencies.showMovieDetailVC(movie: movie)
        referenceVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
