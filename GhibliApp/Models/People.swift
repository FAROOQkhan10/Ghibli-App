//
//  People.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 17/10/26.
//

import Foundation

struct People : Decodable, Identifiable, Equatable{
    
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films : [String]
    let species : String
    let url : String
    
    enum CodingKeys : String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
    
}
