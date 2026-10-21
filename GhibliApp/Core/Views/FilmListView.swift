//
//  FilmListView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import SwiftUI

struct FilmListView: View {
    
    let films : [Film]
    let favoriteModel : FavoritesViewModel
    
    var body: some View {
        
            List(films){ film in
                
                let isFavorite = favoriteModel.isfavorite(filmId: film.id)
                
                NavigationLink(value: film){
                    
                    HStack(alignment: .top){
                        
                        FilmImageView(url: film.image)
                            .frame(width: 100, height: 150)
                        
                        VStack(alignment: .leading){
                            HStack{
                                
                                Text(film.title)
                                    .bold()
                                
                                Spacer()
                                
                                Button{
                                    favoriteModel.toggleFavorite(filmId: film.id)
                                } label:{
                                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                                        .foregroundStyle(isFavorite ? Color.pink : Color.gray)
                                }
                                .buttonStyle(.plain)
                            }
                            
                            Text("Directed by \(film.director)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("Released: \(film.releaseYear)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                        }
                        .padding(.top)
                    }
                    
                }
            }
            .navigationDestination(for: Film.self){ film in
                PeopleListView(film: film)
            }
         
        }
}

//#Preview {
//    FilmListView(filmViewModel: FilmViewModel(filmService : FilmApiService()))
//}
