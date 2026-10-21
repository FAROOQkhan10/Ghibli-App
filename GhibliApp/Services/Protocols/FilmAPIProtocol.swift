//
//  FilmProtocol.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 19/10/26.
//

import Foundation

protocol FilmAPIProtocol {
    func loadFilms() async throws -> [Film]
    func searchFilm(searchItem: String) async throws -> [Film]
}
