//
//  StatisticsReducer.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 30/11/2022.
//

import Foundation

func statisticsReducer(_ state: StatisticsState, _ action: Action) -> StatisticsState {

    var state = state

    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as ClearAction:
        state.counter = 0
    default:
        break
    }

    return state
}
