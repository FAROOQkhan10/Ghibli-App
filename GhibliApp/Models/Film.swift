//
//  Film.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import Foundation

struct Film : Decodable, Identifiable, Equatable, Hashable{
    let id: String
    let title: String
    let image : String
    let bannerImage: String
    let description: String
    let director : String
    let producer : String
    
    let releaseYear : String
    let score : String
    let duration : String
    
    let people : [String]
    
    enum CodingKeys : String, CodingKey {
        case id, title, image, description, director, producer, people
        case releaseYear = "release_date"
        case bannerImage = "movie_banner"
        case score = "rt_score"
        case duration = "running_time"
    }
}
