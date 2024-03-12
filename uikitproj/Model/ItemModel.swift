//
//  ItemModel.swift
//  uikitproj
//
//  Created by Furkan ic on 12.03.2024.
//

import Foundation

import Foundation

// MARK: - Welcome
struct ResponseDTO: Decodable {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info: Decodable  {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Result: Decodable  {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Decodable  {
    let name: String?
    let url: String?
}
