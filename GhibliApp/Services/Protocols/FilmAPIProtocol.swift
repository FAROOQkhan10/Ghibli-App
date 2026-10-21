//
//  FilmProtocol.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 19/10/26.
//

import Foundation

protocol GhibliProtocol {
    func loadFilms() async throws -> [Film]
    func loadPeople(from URLString: String) async throws -> People
}
