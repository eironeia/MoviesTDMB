//
//  tmdbAPIStore.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 03/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TmdbAPIStore {
    
    typealias PopularFilmsDescCompletion = ([Film]?, String?) -> Void //(Films, error)
    
    func getPopularFilmsDesc(page: Int, completion: @escaping PopularFilmsDescCompletion) {
        Alamofire.request(ConstantsURLs.TMDB.popularFilmsDesc).responseJSON { response in
            if let result = response.result.value {
                let filmsDictionary = result as! NSDictionary
                let filmsJSON = JSON(filmsDictionary)
                let films = Film.collection(fromJSON: filmsJSON) as? [Film]
                    print(films)
                //                print(JSON)
                completion(films, nil)
            }
            else {
                print("ERROR: Getting TMDB popular films in desc order")
                completion(nil, "Alamofire error")
            }
        }
    }
}
