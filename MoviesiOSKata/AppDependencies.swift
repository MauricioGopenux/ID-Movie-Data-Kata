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
                injectRepositoryToInteractor()
                injectMovieDependencies(moviesViewController: moviesViewController)
                injectDetailMovieDependencies()
            }
        }
    }
    
    private func injectMoviePresenterToMovieVC(moviesViewController: MoviesViewController) {
        moviesViewController.setMoviePresenter(moviePresenter: moviePresenter)
    }
    
    private func injectRepositoryToInteractor() {
        movieInteractor.setMovieRepository(movieRepository: movieRepository)
        detailMovieInteractor.setMovieRepository(movieRepository: movieRepository)
    }
    
    private func injectMovieDependencies(moviesViewController: MoviesViewController) {
        injectMovieInteractorToMoviePresenter()
        injectMovieVCToMovieRouter(moviesViewController: moviesViewController)
        injectDetailRouterToMovieRouter()
        injectMovieRouterToMoviePresenter()
        injectMovieVCToMoviePresenter(moviesViewController: moviesViewController)
        injectMoviePresenterToMovieVC(moviesViewController: moviesViewController)
    }
    
    private func injectDetailMovieDependencies() {
        injectAppDependenciesToDetailRouter()
        injectDetailInteractorToDetailPresenter()
    }
    
    private func injectMovieInteractorToMoviePresenter() {
        moviePresenter.setMovieInteractor(movieInteractor: movieInteractor)
    }
    
    private func injectMovieVCToMovieRouter(moviesViewController: MoviesViewController) {
        movieRouter.setMoviesViewController(moviesViewController: moviesViewController)
    }
    
    private func injectDetailRouterToMovieRouter() {
        movieRouter.setDetailMovieRouting(detailMovieRouting: detailMovieRouter)
    }
    
    private func injectMovieRouterToMoviePresenter() {
        moviePresenter.setMovieRouter(movieRouting: movieRouter)
    }
    
    private func injectMovieVCToMoviePresenter(moviesViewController: MoviesViewController) {
        moviePresenter.setLoadListMovies(loadListMovies: moviesViewController)
    }
    
    private func injectAppDependenciesToDetailRouter() {
        detailMovieRouter.setAppDependencies(appDependencies: self)
    }
    
    private func injectDetailInteractorToDetailPresenter() {
        detailMoviePresenter.setMDetailMovieInteractor(detailMovieInteractor: detailMovieInteractor)
    }
    
    func showMovieDetailVC(movieId: Int) -> UIViewController{
        let detailMovieViewController: DetailMovieViewController = DetailMovieViewController()
        injectMovieIdInPresenter(movieId: movieId)
        injectDetailPresenterToDetailViewController(detailMovieViewController: detailMovieViewController)
        injectDetailViewControllerToDetailPresenter(detailMovieViewController: detailMovieViewController)
        
        return detailMovieViewController
    }
    
    private func injectMovieIdInPresenter(movieId: Int) {
        detailMoviePresenter.setMovieId(movieId: movieId)
    }
    
    private func injectDetailPresenterToDetailViewController(detailMovieViewController: DetailMovieViewController) {
        detailMovieViewController.setDetailMoviePresenter(detailMoviePresenter: detailMoviePresenter)
    }
    
    private func injectDetailViewControllerToDetailPresenter(detailMovieViewController: DetailMovieViewController) {
        detailMoviePresenter.setDetailMovieVC(detailMovieVC: detailMovieViewController)
    }
}

