//
//  AppReducer.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {

    var state = state
    state.movies = moviesReducer(state.movies, action)
    state.statistics = statisticsReducer(state.statistics, action)
    return state
}
