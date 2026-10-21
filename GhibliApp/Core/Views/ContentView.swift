//
//  ContentView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import SwiftUI

struct ContentView: View {
           
      @State private var filmViewModel = FilmViewModel()
      @State private var favoriteViewModel = FavoritesViewModel()
    
        var body: some View {
            TabView {
                Tab("Movies", systemImage: "movieclapper") {
                    FilmView(filmViewModel : filmViewModel,
                             favoriteModel : favoriteViewModel
                    )
                }

                Tab("Favorites", systemImage: "heart") {
                    FavoritesView(filmViewModel : filmViewModel,favoriteModel : favoriteViewModel)
                }

                Tab(role: .search) {
                        SearchView(favoriteModel: favoriteViewModel)
                }
            }
            .task {
                favoriteViewModel.load()
            }
            .tabViewSearchActivation(.searchTabSelection)
    }
}

#Preview {
    ContentView()
}
