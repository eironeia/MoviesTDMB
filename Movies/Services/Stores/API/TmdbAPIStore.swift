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

enum TmdbStoreResult<U> {
    case success(result: U)
    case failure(error: TmdbStoreError)
}

enum TmdbStoreError: Equatable, Error {
    case cannotGet(String)
}

func ==(lhs: TmdbStoreError, rhs: TmdbStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.cannotGet(let a), .cannotGet(let b)) where a == b: return true
    default:
        return false
    }
}

class TmdbAPIStore {
    
    typealias PopularFilmsDescCompletion = (TmdbStoreResult<[Film]>) -> Void
    
    func getPopularFilmsDesc(page: Int, completion: @escaping PopularFilmsDescCompletion) {
        Alamofire.request(ConstantsURLs.TMDB.popularFilmsDesc).responseJSON { response in
            if let result = response.result.value {
                let filmsDictionary = result as! NSDictionary
                let filmsJSON = JSON(filmsDictionary)
                if let films = Film.collection(fromJSON: filmsJSON) as? [Film] {
                    completion(TmdbStoreResult<[Film]>.success(result: films))
                }
                else {
                    completion(TmdbStoreResult<[Film]>.failure(error: TmdbStoreError.cannotGet("ERROR: parsing films from JSON")))
                }
            }
            else {
                completion(TmdbStoreResult<[Film]>.failure(error: TmdbStoreError.cannotGet("ERROR: Getting TMDB popular films in desc order")))
            }
        }
    }
}
