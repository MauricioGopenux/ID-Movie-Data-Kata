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
    private let movieRepository: DiskMovieRepository = DiskMovieRepository()
    private let moviePresenter: MoviePresenter = MoviePresenter()
    private let movieInteractor: MovieInteractor = MovieInteractor()
    private let movieRouter: MoviesRouter = MoviesRouter()
    
    private let detailMovieInteractor: DetailMovieInteractor = DetailMovieInteractor()
    private let detailMoviePresenter: DetailMoviePresenter = DetailMoviePresenter()
    private let detailMovieRouter: DetailMovieRouter = DetailMovieRouter()
    
    func injectDependencies(window: UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController{
            if let moviesViewController = navigationController.visibleViewController as?  MoviesViewController {
                movieInteractor.setMovieRepository(movieRepository: movieRepository)
                detailMovieInteractor.setMovieRepository(movieRepository: movieRepository)
                detailMovieRouter.setAppDependencies(appDependencies: self)
                
                moviePresenter.setMovieInteractor(movieInteractor: movieInteractor)
                movieRouter.setMoviesViewController(moviesViewController: moviesViewController)
                
                movieRouter.setDetailMovieRouting(detailMovieRouting: detailMovieRouter)
                moviePresenter.setMovieRouter(movieRouting: movieRouter)
                
                detailMoviePresenter.setMDetailMovieInteractor(detailMovieInteractor: detailMovieInteractor)
                
                moviesViewController.setMoviePresenter(moviePresenter: moviePresenter)
                moviePresenter.setLoadListMovies(loadListMovies: moviesViewController)
            }
        }
    }
    
    func showMovieDetailVC(movieId: Int) -> UIViewController{
        let detailMovieViewController: DetailMovieViewController = DetailMovieViewController()
        detailMoviePresenter.setMovieId(movieId: movieId)
        detailMovieViewController.setDetailMoviePresenter(detailMoviePresenter: detailMoviePresenter)
        detailMoviePresenter.setDetailMovieVC(detailMovieVC: detailMovieViewController)
        
        return detailMovieViewController
    }
}

