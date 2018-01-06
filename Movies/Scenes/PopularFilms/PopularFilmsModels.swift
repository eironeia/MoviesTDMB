//
//  PopularFilmsModels.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 06/01/2018.
//  Copyright (c) 2018 Alex Cuello ortiz. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

struct PopularFilmsScene {
    
    struct PopularFilmsList {
        
        struct Request {
            var page: Int
        }
        
        struct Response {
            var films: [Film]
        }
        
        struct ViewModel {
            var displayedFilms: [PopularFilmsList.DisplayedFilm]
        }
        
        struct DisplayedFilm {
            var title: String
            var year: String
            var overview: String
            var pictureURL: String
        }
    }
    
}