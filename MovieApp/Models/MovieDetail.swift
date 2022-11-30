//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let plot: String
    let imdbRating: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
    }
}
