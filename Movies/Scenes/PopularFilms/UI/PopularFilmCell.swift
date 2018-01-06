//
//  TableViewCell.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 06/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import UIKit
import Kingfisher

class PopularFilmCell: UITableViewCell {

    @IBOutlet weak var filmPictureImageView: UIImageView!
    @IBOutlet weak var filmAboutLabel: UILabel!
    @IBOutlet weak var filmView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(film: PopularFilmsScene.PopularFilmsList.DisplayedFilm) {
        let pictureURL = URL(string: film.pictureURL)
        self.filmPictureImageView.kf.setImage(with: pictureURL)
        self.filmView.layer.cornerRadius = 4
        self.filmAboutLabel.text = "\(film.title)\n\(film.overview)\n\(film.year)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }   

}
