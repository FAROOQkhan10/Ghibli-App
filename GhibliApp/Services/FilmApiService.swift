//
//  GhibliAPI.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import Foundation

struct GhibliApiService {
    
    private let apiURL = "https://ghibliapi.vercel.app/films"
    
    func loadData() async throws -> [Film] {
       
        guard let url = URL(string: apiURL) else{
            throw URLError(.badURL)
        }
        
       let (data, response)  = try await URLSession.shared.data(from: url)
       
        guard let httpResponse = response as? HTTPURLResponse else{
            throw URLError(.badServerResponse)
        }
        
        guard (200..<300).contains(httpResponse) else{
            throw URLError(.badServerResponse)
        }
    }
    
       
    
}
