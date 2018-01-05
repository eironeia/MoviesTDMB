//
//  URLs.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 03/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import Foundation


struct ConstantsURLs {
    
    struct TMDB {
        static let API = "https://api.themoviedb.org/4"
        static let popularFilmsDesc = "\(ConstantsURLs.TMDB.API)/discover/movie?api_key=\(ConstantsAPIKeys.tmdb)&sort_by=popularity.desc"
        static let filmPicture = "http://image.tmdb.org/t/p/w185"
    }
    
    
}
