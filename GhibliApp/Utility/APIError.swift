//
//  Error.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 19/10/26.
//

import Foundation

enum APIError : LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        
        switch self {
            case .invalidURL:
                return "The URL is invalid"
            case .invalidResponse:
                return "Invalid response from server"
            case .decodingError(let error):
                return "Failed to decode response: \(error.localizedDescription)"
            case .networkError(let error):
                return "Network error: \(error.localizedDescription)"
        }
        
        
    }
    
}
