//
//  FilmViewModel.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import Foundation
import Observation

@Observable
final class FilmViewModel {
    
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
    
    func fetchFilm() async {
        
        guard state == .idle else { return }
        
        state = .loading
       
        do{
            let films = try await filmService.loadFilms()
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
