//
//  SearachView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import SwiftUI

struct SearchView: View {
    
    @State private var viewModel = SearchFilmViewModel()
    @State private var text: String = ""
    let favoriteModel : FavoritesViewModel
    
    var body: some View {
        NavigationStack{
            Group{
                switch viewModel.state {
                case .idle:
                    Text("Search here")
                    
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
            .searchable(text: $text)
            .task(id: text){
                
                try? await Task.sleep(for: .milliseconds(500))
                guard !Task.isCancelled else {return}
                await viewModel.fetch(searchText: text)
            }
        }
    }
}

//#Preview {
//    SearchView()
//}
