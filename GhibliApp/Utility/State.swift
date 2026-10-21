//
//  State.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 19/10/26.
//

import Foundation

enum State : Equatable{
    case idle
    case loading
    case loaded([Film])
    case error(String)
}
