//
//  FavoritesViewModel.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import Foundation
import Observation

@Observable
final class FavoritesViewModel{
    
    private(set) var favoritesIds : Set<String> = []
    
    private let service : FavoriteProtocol
    
    init(service: FavoriteProtocol = FavoriteService()) {
        self.service = service
    }
    
    func load(){
        favoritesIds = service.load()
    }
    
    private func save(){
        service.save(favoritesIds: favoritesIds)
    }
    
    func toggleFavorite(filmId: String){
        if favoritesIds.contains(filmId){
            favoritesIds.remove(filmId)
        }
        else{
            favoritesIds.insert(filmId)
        }
        
        save()
    }
    
    func isfavorite(filmId: String) -> Bool {
         favoritesIds.contains(filmId)
    }
    
}
