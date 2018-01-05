//
//  ViewController.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 03/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

