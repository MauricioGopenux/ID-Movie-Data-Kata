//
//  DetailMovieRouter.swift
//  MoviesiOSKata
//
//  Created by Radmas on 18/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import UIKit

protocol DetailMovieRouting: AnyObject {
    func showDetailMovie(referenceVC: UIViewController, movieId: Int)
}

class DetailMovieRouter: DetailMovieRouting {
    
    private weak var appDependencies: AppDependencies!
    
    func setAppDependencies(appDependencies: AppDependencies) {
        self.appDependencies = appDependencies
    }
    
    func showDetailMovie(referenceVC: UIViewController, movieId: Int) {
        let detailVC =  appDependencies.showMovieDetailVC(movieId: movieId)
        referenceVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
