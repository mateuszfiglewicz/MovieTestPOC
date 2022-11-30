//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])

        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
