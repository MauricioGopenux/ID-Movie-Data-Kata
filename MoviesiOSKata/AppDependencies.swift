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
    private let movieRepository: MovieRepository = DiskMovieRepository()
    private let moviePresenter: MoviePresenter = MoviePresenter()
    private let movieInteractor: MovieInteractor = MovieInteractor()
    private let movieRouter: MoviesRouter = MoviesRouter()
    
    private let detailMovieInteractor: DetailMovieInteractor = DetailMovieInteractor()
    private let detailMoviePresenter: DetailMoviePresenter = DetailMoviePresenter()
    private let detailMovieRouter: DetailMovieRouter = DetailMovieRouter()
    private var detailMovieViewController: DetailMovieViewController!
    
    func injectDependencies(window: UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController{
            if let moviesViewController = navigationController.visibleViewController as?  MoviesViewController {
                injectRepositoryToInteractor()
                injectMovieDependencies(moviesViewController: moviesViewController)
                injectAppDependenciesToDetailRouter()
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
    
    private func injectAppDependenciesToDetailRouter() {
        detailMovieRouter.setAppDependencies(appDependencies: self)
    }
    
    private func injectMovieDependencies(moviesViewController: MoviesViewController) {
        injectMovieInteractorToMoviePresenter()
        injectMovieVCToMovieRouter(moviesViewController: moviesViewController)
        injectDetailRouterToMovieRouter()
        injectMovieRouterToMoviePresenter()
        injectMovieVCToMoviePresenter(moviesViewController: moviesViewController)
        injectMoviePresenterToMovieVC(moviesViewController: moviesViewController)
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
    
    func showMovieDetailVC(movieId: Int) -> UIViewController{
        injectDetailMovieVC()
        injectMovieIdInPresenter(movieId: movieId)
        injectDetailMovieDependencies()
        
        return detailMovieViewController
    }
    
    private func injectDetailMovieVC() {
        detailMovieViewController = DetailMovieViewController()
    }
    
    private func injectMovieIdInPresenter(movieId: Int) {
        detailMoviePresenter.setMovieId(movieId: movieId)
    }
    
    private func injectDetailMovieDependencies() {
        injectDetailInteractorToDetailPresenter()
        injectDetailPresenterToDetailViewController(detailMovieViewController: detailMovieViewController)
        injectDetailViewControllerToDetailPresenter(detailMovieViewController: detailMovieViewController)
    }
    
    private func injectDetailInteractorToDetailPresenter() {
        detailMoviePresenter.setMDetailMovieInteractor(detailMovieInteractor: detailMovieInteractor)
    }
    
    private func injectDetailPresenterToDetailViewController(detailMovieViewController: DetailMovieViewController) {
        detailMovieViewController.setDetailMoviePresenter(detailMoviePresenter: detailMoviePresenter)
    }
    
    private func injectDetailViewControllerToDetailPresenter(detailMovieViewController: DetailMovieViewController) {
        detailMoviePresenter.setDetailMovieVC(detailMovieVC: detailMovieViewController)
    }
}

