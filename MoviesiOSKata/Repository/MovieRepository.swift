//
//  MovieRepository.swift
//  MoviesiOSKata
//
//  Created by Radmas on 10/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

protocol MovieRepository {
    func getMovies() -> [Movie]

    func getMovieById(movieId: Int) -> Movie?
}
