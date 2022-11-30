//
//  Constants.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import Foundation

struct Constants {

    struct ApiKeys {
        static let omdbIdKey = "b0f21211"
    }

    struct Urls {
        static func urlBySearch(search: String) -> String {
            "http://www.omdbapi.com/?s=\(search)&page=1&apikey=\(ApiKeys.omdbIdKey)"
        }

        static func urlForMovieDetailsByImdbId(imdbId: String) -> String {
            "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(ApiKeys.omdbIdKey)"
        }
    }
}
