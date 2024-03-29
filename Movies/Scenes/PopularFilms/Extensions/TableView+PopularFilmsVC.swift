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
        popularFilmsTableView.keyboardDismissMode = .interactive
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredDisplayFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let displayedFilm = filteredDisplayFilms[indexPath.row]
        
        if let popularFilmCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.popularFilmCell) as? PopularFilmCell {
            popularFilmCell.set(film: displayedFilm)
            return popularFilmCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let searchBarText = self.popularFilmsSearchBar.text else {
            if indexPath.row == (self.filteredDisplayFilms.count - 1) {
                self.requestGetPopularFilms()
            }
            return
        }
        if indexPath.row == (self.filteredDisplayFilms.count - 1) && searchBarText.isEmpty {
            self.requestGetPopularFilms()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.popularFilmsSearchBar.resignFirstResponder()
    }
    
}
