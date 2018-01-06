//
//  PopularFilmsRouter.swift
//  Movies
//
//  Created by Alex Cuello ortiz on 06/01/2018.
//  Copyright (c) 2018 Alex Cuello ortiz. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol PopularFilmsRouterInput {
    
}

protocol PopularFilmsRouterDataSource: class {
    
}

protocol PopularFilmsRouterDataDestination: class {
    
}

class PopularFilmsRouter: PopularFilmsRouterInput {
    
    weak var viewController: PopularFilmsViewController!
    weak private var dataSource: PopularFilmsRouterDataSource!
    weak var dataDestination: PopularFilmsRouterDataDestination!
    
    init(viewController: PopularFilmsViewController, dataSource: PopularFilmsRouterDataSource, dataDestination: PopularFilmsRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}
