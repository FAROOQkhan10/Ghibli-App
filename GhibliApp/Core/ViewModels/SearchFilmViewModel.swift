//
//  SearchFilmViewModel.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import Foundation
import Observation

@Observable
final class SearchFilmViewModel{
    
    enum State : Equatable{
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    
    private let filmService: FilmAPIProtocol
    
    init(filmService: FilmAPIProtocol = FilmApiService()) {
        self.filmService = filmService
    }
    
    var state : State = .idle
    
    func fetch(searchText : String) async {
        
        guard !searchText.isEmpty else{
            return
        }
        
        state = .loading
       
        do{
            let films = try await filmService.searchFilm(searchItem: searchText)
            self.state = .loaded(films)
        }
        catch let error as APIError{
            self.state = .error(error.errorDescription ?? "Unkknown Error")
        }
        catch{
            self.state = .error("Unknown Error")
        }
        
    }
    
}
