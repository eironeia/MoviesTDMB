//
//  Film.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 05/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import Foundation

class Film {
    let title: String
    let year: String
    let overview: String
    let pictureURL:String
    
    init(title: String, year: String, overview: String, pictureURL: String) {
        self.title = title
        self.year = year
        self.overview = overview
        self.pictureURL = pictureURL
    }
}
