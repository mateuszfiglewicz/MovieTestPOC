//
//  WebserviceCombine.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import Foundation
import Combine

class WebserviceCombine {

    func getMoviesBy(search: String) -> AnyPublisher<[Movie], Never> {
        let moviesURL = URL(string: Constants.Urls.urlBySearch(search: search))!

        return URLSession.shared.dataTaskPublisher(for: moviesURL)
          .map(\.data)
          .decode(type: MovieResponse.self, decoder: JSONDecoder())
          .map(\.movies)
          .replaceError(with: [Movie]())
          .eraseToAnyPublisher()
    }

    func getMovieDetailsBy(imdbId: String) -> AnyPublisher<MovieDetail, Error> {
        let moviesURL = URL(string: Constants.Urls.urlForMovieDetailsByImdbId(imdbId: imdbId))!

        return URLSession.shared.dataTaskPublisher(for: moviesURL)
          .map(\.data)
          .decode(type: MovieDetail.self, decoder: JSONDecoder())
          .eraseToAnyPublisher()
    }
}
