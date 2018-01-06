//
//  TableView+PopularFilmsVC.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 06/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import Foundation
import UIKit

extension PopularFilmsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableViewOnLoad() {
        popularFilmsTableView.register(UINib(nibName: "PopularFilmCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.popularFilmCell)
        popularFilmsTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedPopularFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let displayedFilm = displayedPopularFilms[indexPath.row]
        
        if let popularFilmCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.popularFilmCell) as? PopularFilmCell {
            popularFilmCell.set(film: displayedFilm)
            return popularFilmCell
        }
        
        return UITableViewCell()
    }
    
    
}
