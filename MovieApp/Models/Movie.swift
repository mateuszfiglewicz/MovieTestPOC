//
//  Movie.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let title: String
    let poster: String
    let imdbId: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}
