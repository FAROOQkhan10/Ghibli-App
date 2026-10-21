//
//  FilmView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import SwiftUI

struct FilmView: View {
    
    let filmViewModel : FilmViewModel
    let favoriteModel : FavoritesViewModel
    
    var body: some View {
        NavigationStack{
            Group{
                switch filmViewModel.state {
                case .idle:
                    Text("No Films Yet")
                    
                case .loading:
                    ProgressView{
                        Text("Loading...")
                    }
                    
                case .loaded(let films):
                    FilmListView(films : films, favoriteModel: favoriteModel)
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.pink)
                    
                }
                
            }
            .navigationTitle("Ghibli Movies")
        }
             .task{
                 await filmViewModel.fetchFilm()
             }
       }
       
}

//#Preview {
//    FilmView(filmViewModel: FilmViewModel(filmService: FilmApiService()))
//}
