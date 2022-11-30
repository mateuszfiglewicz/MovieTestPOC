//
//  ContentView.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var store: Store<AppState>
    @State private var search: String = ""

    struct MovieProps {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }

    struct StatisticsProps {
        let counter: Int
    }

    private func map(state: MoviesState) -> MovieProps {
        MovieProps(movies: state.movies, onSearch: { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        })
    }

    private func map(state: StatisticsState) -> StatisticsProps {
        StatisticsProps(counter: state.counter)
    }

    var body: some View {

        let movieProps = map(state: store.state.movies)
        let statisticsProps = map(state: store.state.statistics)

        VStack {

            TextField("Search", text: $search, onEditingChanged: { _ in }, onCommit: {
                movieProps.onSearch(search)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            HStack {
                Text("Details counter:")
                Text("\(statisticsProps.counter)")
                Spacer()
            }.padding()

            List(movieProps.movies, id: \.imdbId) { movie in
                NavigationLink(
                    destination: MovieDetailsView(movie: movie),
                    label: {
                        MovieCell(movie: movie)
                    })
            }.listStyle(PlainListStyle())
        }
        .navigationTitle("Movies")
        .embedInNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
        return ContentView().environmentObject(store)
    }
}

struct MovieCell: View {

    let movie: Movie

    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            Text(movie.title)
        }
    }
}
