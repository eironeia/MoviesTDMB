//
//  ResponseObjectSerializable.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 05/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


extension Film: ResponseObjectSerializable, ResponseCollectionSerializable {
    
    struct ParsingKeysFilm {
        static let title = "title"
        static let releaseDate = "release_date"
        static let overview = "overview"
        static let posterPath = "poster_path"
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        guard let title = json[ParsingKeysFilm.title].string
            , let releaseDate = json[ParsingKeysFilm.releaseDate].string
            , let overview = json[ParsingKeysFilm.overview].string
            , let posterPath = json[ParsingKeysFilm.posterPath].string
            else {
                return nil
        }
        
        var year:String = "-"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            let calendar = Calendar.current
            year = "\(calendar.component(.year, from: date))"
            
            print("YEAR: \(year), releaseDate: \(releaseDate)")
        }
        
        var pictureURL = posterPath
        pictureURL.remove(at: pictureURL.startIndex) //due to it's "\/imageID.jpg, even there is no problem is cleaner"
        
        return Film(title: title, year: year, overview: overview, pictureURL: "\(ConstantsURLs.TMDB.filmPicture)\(pictureURL)")
    }
    
    static func collection(fromJSON json: JSON) -> AnyObject? {
        
        var films:[Film] = []
        
        if let filmsResultJSON = json["results"].array  {
            for filmResultJSON in filmsResultJSON {
                if let film = Film.object(fromJSON: filmResultJSON) as? Film {
                    films.append(film)
                }
            }
        }
        print(films.count)
        return films as AnyObject
    }
}
