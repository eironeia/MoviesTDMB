//
//  SearchBar+PopularFilmsVC.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 06/01/2018.
//  Copyright © 2018 Alex Cuello ortiz. All rights reserved.
//

import UIKit

extension PopularFilmsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            self.filteredDisplayFilms = self.displayFilms
            self.popularFilmsTableView.reloadData()
            return
        }
        self.filteredDisplayFilms = self.displayFilms.filter({ (film) -> Bool in
            film.title.lowercased().contains(searchText.lowercased())
        })
        self.popularFilmsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
