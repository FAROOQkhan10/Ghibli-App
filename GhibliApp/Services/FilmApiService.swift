//
//  GhibliAPI.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import Foundation

struct FilmApiService : FilmAPIProtocol {
    
    private let apiURL = "https://ghibliapi.vercel.app/films"
    
    func loadFilms() async throws -> [Film] {
       
        do{
            guard let url = URL(string: apiURL) else{
                throw APIError.invalidURL
            }
            
            let (data, response)  = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else{
                throw APIError.invalidResponse
            }
            
            return try JSONDecoder().decode([Film].self, from: data)
        }
        catch let error as DecodingError{
            throw APIError.decodingError(error)
        }
        catch let error as URLError{
            throw APIError.networkError(error)
        }
    }
    
    func searchFilm(searchItem: String) async throws -> [Film] {
        let allFilms = try await loadFilms()
        
        return allFilms.filter{ filter in
            filter.title.localizedStandardContains(searchItem)
        }
        
    }
    
    
}
