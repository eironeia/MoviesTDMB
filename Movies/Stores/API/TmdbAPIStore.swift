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
    
    func getPopularFilmsDesc(page: Int, completion: (_ films: [Film]) -> Void) {
        Alamofire.request(ConstantsURLs.TMDB.popularFilmsDesc).responseJSON { response in
            if let result = response.result.value {
                let filmsDictionary = result as! NSDictionary
                let filmsJSON = JSON(filmsDictionary)
                let films = Film.collection(fromJSON: filmsJSON) as? [Film]
                    print(films)
                //                print(JSON)
            }
            else {
                print("ERROR: Getting TMDB popular films in desc order")
            }
        }
    }
    
    func h() {
        getPopularFilmsDesc(page: 1) { (films) in
            <#code#>
        }
    }
}
