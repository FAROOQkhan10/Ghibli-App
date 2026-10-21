//
//  PersonAPIProtocol.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 19/10/26.
//

import Foundation

protocol PeopleAPIProtocol: Sendable {
    func loadPeople(from URLString: String) async throws -> People
}
