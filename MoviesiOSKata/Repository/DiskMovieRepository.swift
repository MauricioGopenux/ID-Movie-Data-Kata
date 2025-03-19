//
//  DiskMovieRepository.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 2/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import Foundation

class DiskMovieRepository: MovieRepository {
    
    
    func getMovies() -> [Movie] {
        var movies:[Movie] = []
        
        let url = Bundle.main.url(forResource: "Movies", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            if let moviesjson = json as? [[String: AnyObject]] {
                for moviejson in moviesjson {
                    var movie: Movie = Movie(id: (moviejson["id"] as? Int)!);
                    movie.title = moviejson["title"] as? String
                    movie.image = moviejson["image"] as? String
                    movie.overview = moviejson["overview"] as? String

                    movies.append(movie)
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        simulateDelay()
        
        return movies;
    }
    
  //  func getMovieById(movieId: Int) -> Movie? {
    //    movies.first(where: {$0.id == movieId})
    //}
    
    private func simulateDelay() -> Void{
        sleep(2)
    }
}
