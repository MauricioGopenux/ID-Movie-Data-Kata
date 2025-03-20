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
    private let moviesRepository: MoviesRepository = DiskMovieRepository()
    private let moviesPresenter: MoviesPresenter = MoviesPresenter()
    private let moviesInteractor: MoviesInteractor = MoviesInteractor()
    private let moviesRouter: MoviesRouter = MoviesRouter()
    
    private let detailMoviePresenter: DetailMoviePresenter = DetailMoviePresenter()
    private let detailMovieRouter: DetailMovieRouter = DetailMovieRouter()
    private var detailMovieViewController: DetailMovieViewController!
    
    func injectDependencies(window: UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController{
            if let moviesViewController = navigationController.visibleViewController as?  MoviesViewController {
                injectMovieDependencies(moviesViewController: moviesViewController)
                injectAppDependenciesToDetailRouter()
            }
        }
    }
    
    private func injectMoviePresenterToMovieVC(moviesViewController: MoviesViewController) {
        moviesViewController.setMoviesPresenter(moviesPresenter: moviesPresenter)
    }
    
    private func injectRepositoryToInteractor() {
        moviesInteractor.setMoviesRepository(moviesRepository: moviesRepository)
    }
    
    private func injectAppDependenciesToDetailRouter() {
        detailMovieRouter.setAppDependencies(appDependencies: self)
    }
    
    private func injectMovieDependencies(moviesViewController: MoviesViewController) {
        injectMoviePresenterToMovieInteractor()
        injectRepositoryToInteractor()
        injectMovieInteractorToMoviePresenter()
        injectMovieVCToMovieRouter(moviesViewController: moviesViewController)
        injectDetailRouterToMovieRouter()
        injectMovieRouterToMoviePresenter()
        injectMoviePresenterToMovieVC(moviesViewController: moviesViewController)
    }
    
    private func injectMoviePresenterToMovieInteractor() {
        moviesInteractor.setMoviesPresenter(moviesPresenter: moviesPresenter)
    }
    
    private func injectMovieInteractorToMoviePresenter() {
        moviesPresenter.setMoviesInteractor(moviesInteractor: moviesInteractor)
    }
    
    private func injectMovieVCToMovieRouter(moviesViewController: MoviesViewController) {
        moviesRouter.setMoviesViewController(moviesViewController: moviesViewController)
    }
    
    private func injectDetailRouterToMovieRouter() {
        moviesRouter.setDetailMovieRouter(detailMovieRouter: detailMovieRouter)
    }
    
    private func injectMovieRouterToMoviePresenter() {
        moviesPresenter.setMoviesRouter(moviesRouting: moviesRouter)
    }
    
    func configMovieDetailVC(movie: Movie) -> UIViewController{
        injectDetailMovieVC()
        injectMovieInPresenter(movie: movie)
        injectDetailMovieDependencies()
        
        return detailMovieViewController
    }
    
    private func injectDetailMovieVC() {
        detailMovieViewController = DetailMovieViewController()
    }
    
    private func injectMovieInPresenter(movie: Movie) {
        detailMoviePresenter.setMovie(movie: movie)
    }
    
    private func injectDetailMovieDependencies() {
        injectDetailPresenterToDetailViewController(detailMovieViewController: detailMovieViewController)
    }
    
    private func injectDetailPresenterToDetailViewController(detailMovieViewController: DetailMovieViewController) {
        detailMovieViewController.setDetailMoviePresenter(detailMoviePresenter: detailMoviePresenter)
    }
}

