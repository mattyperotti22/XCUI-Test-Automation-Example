//
//  MovieTableCell.swift
//  Projector
//
//  Created by Fatih Gursoy on 8.02.2022.
//

import UIKit

class MovieTableCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    func configure(viewModel: MovieViewModel?) {
                
        self.movieTitle.text = viewModel?.movieTitle ?? ""
        
        if let rating = viewModel?.rating {
            self.movieRating.text = String(format:"%.1f", rating)
        }
        
        self.movieImage.setImage(url: viewModel?.photoURL)
        
    }
}
