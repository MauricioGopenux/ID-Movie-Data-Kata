//
//  ResumeViewController.swift
//  MoviesiOSKata
//
//  Created by Radmas on 13/03/25.
//  Copyright © 2025 xurxodev. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {

    @IBOutlet weak var overviewImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewTextField: UITextView!
    private let overviewPresenter: OverviewPresenter!
    
    init(overviewPresenter: OverviewPresenter) {
        self.overviewPresenter = overviewPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewPresenter.setOverviewVC(overviewVC: self)
        overviewPresenter.showMovie()
        // Do any additional setup after loading the view.
    }


}

extension OverviewViewController: configOverviewVC {
    func config(movie: Movie) {
        titleLabel.text = movie.title
        overviewTextField.text = movie.overview
        overviewImage.load(url: URL(string: movie.image!)!)
    }
    
    

}
