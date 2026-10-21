//
//  FavoritesView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import SwiftUI

struct FavoritesView: View {
    
    let filmViewModel : FilmViewModel
    let favoriteModel : FavoritesViewModel
    
    var films: [Film]{
        let favorites = favoriteModel.favoritesIds
        switch filmViewModel.state{
        case .loaded(let film):
            return film.filter{
                favorites.contains($0.id)
            }
        default: return []
        }
    }
    
    var body: some View {
        NavigationStack{
            Group{
                if films.isEmpty {
                    ContentUnavailableView("No favorites yet", systemImage: "heart")
                }
                else{
                    FilmListView(films: films, favoriteModel: favoriteModel)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView(filmViewModel: FilmViewModel(filmService: FilmApiService()), favoriteModel: FavoritesViewModel(service: FavoriteService()))
}
