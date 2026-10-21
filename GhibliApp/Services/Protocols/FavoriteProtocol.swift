//
//  FavoriteProtocol.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import Foundation

protocol FavoriteProtocol {
    func load() -> Set<String>
    func save(favoritesIds : Set<String>)
}
