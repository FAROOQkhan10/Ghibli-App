//
//  PeopleViewModel.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import Foundation
import Observation

@Observable
final class PeopleViewModel{
    
    enum State: Equatable{
        case idle
        case loading
        case loaded([People])
        case error(String)
    }

    
    private let peopleService : PeopleAPIProtocol
    var people : [People] = []
    var state: State = .idle
    
    init(peopleService: PeopleAPIProtocol = PeopleApiService()) {
        self.peopleService = peopleService
    }
    
    func fetchPeople(for film: Film) async {
        
        guard state != .loading else { return }
        
        state = .loading
        
        do{
            
            try await withThrowingTaskGroup(of: People.self){ group in
                for personInfoURL in film.people {
                    group.addTask{
                        try await self.peopleService.loadPeople(from: personInfoURL)
                    }
                }
                
                for try await person in group {
                    people.append(person)
                }
                
            }
            
            self.state = .loaded(people)
        }
        catch let error as APIError{
            self.state = .error(error.errorDescription ?? "Unkknown Error")
        }
        catch{
            self.state = .error("Unknown Error")
        }
        
    }
    
}
