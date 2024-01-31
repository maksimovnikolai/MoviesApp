//
//  HomeViewModel.swift
//  Movies
//
//  Created by Nikolai Maksimov on 30.01.2024.
//

import Foundation

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTV = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

protocol HomeViewModelProtocol {
    
    func numberOfSections() -> Int
    func fetch() -> NetworkManagerProtocol
    //    init(networkManager: NetworkManagerProtocol)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top Rated"]
    private let networkManager: NetworkManagerProtocol = NetworkManager()
    
    //    init(networkManager: NetworkManagerProtocol) {
    //        self.networkManager = networkManager
    //    }
    
    func numberOfSections() -> Int {
        sectionTitles.count
    }
    
    func fetch() -> NetworkManagerProtocol {
        networkManager
    }
}
