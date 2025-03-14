//
//  MovieTableViewCell.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    
    func configure(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieImageView.load(url: URL(string: movie.image!)!)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

