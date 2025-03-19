//
//  MovieRepository.swift
//  MoviesiOSKata
//
//  Created by Radmas on 10/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

protocol MoviesRepository {
    func getMovies() -> [Movie]
}
