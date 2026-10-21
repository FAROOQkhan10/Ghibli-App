//
//  FavoriteService.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import Foundation

struct FavoriteService : FavoriteProtocol {
    
    private let favoritesKey = "GhibliExplorer.FavoriteFilms"
   
    func load() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        return Set(array)
    }
    
    func save(favoritesIds: Set<String>) {
        UserDefaults.standard.set(Array(favoritesIds),forKey: favoritesKey)
    }
    
}
