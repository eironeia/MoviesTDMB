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
        self.filmPictureImageView.layer.cornerRadius = 4
        self.filmPictureImageView.layer.masksToBounds = true
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .right

        
        let titleAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17)]
        let overviewAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
        let yearAttributes = [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: 15),
                           NSAttributedStringKey.paragraphStyle: paragraph]
        
        let filmAbout = NSMutableAttributedString(string: film.title, attributes: titleAttributes)
        let filmOverview = NSMutableAttributedString(string: "\n\(film.overview)", attributes: overviewAttributes)
        let filmYear = NSMutableAttributedString(string: "\n\(film.year) ‍", attributes: yearAttributes)
        
        filmAbout.append(filmOverview)
        filmAbout.append(filmYear)
        
        self.filmAboutLabel.attributedText = filmAbout
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }   

}
