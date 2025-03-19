//
//  ResumeViewController.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//
import UIKit

class DetailMovieViewController: UIViewController {
    private var detailMoviePresenter: DetailMoviePresenter!
    
    @IBOutlet weak var overviewImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMoviePresenter.setDetailMovieVC(detailMovieVC: self)
        detailMoviePresenter.showMovie()
        // Do any additional setup after loading the view.
    }
    
    func setDetailMoviePresenter(detailMoviePresenter: DetailMoviePresenter) {
        self.detailMoviePresenter = detailMoviePresenter
    }
}

extension DetailMovieViewController: DetailMovieVC {
    func showDetailMovie(movie: Movie) {
        titleLabel.text = movie.title
        overviewTextField.text = movie.overview
        if let imageUrl = movie.image, let url = URL(string: imageUrl) {
            overviewImage.load(url: url)
        }
    }
}
