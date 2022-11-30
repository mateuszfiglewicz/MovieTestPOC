//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import SwiftUI

struct MovieDetailsView: View {

    @EnvironmentObject var store: Store<AppState>

    let movie: Movie

    struct DetailsProps {
        let details: MovieDetail?
        let onLoadMovieDetails: (String) -> Void
    }

    struct StatisticsProps {
        let onAppear: () -> Void
        let onReset: () -> Void
    }

    private func map(state: MoviesState) -> DetailsProps {
        DetailsProps(details: state.selectedMovieDetail, onLoadMovieDetails: { imdbId in
            store.dispatch(action: FetchMovieDetails(imdbId: imdbId))
        })
    }

    private func map(state: StatisticsState) -> StatisticsProps {
        StatisticsProps {
            store.dispatch(action: IncrementAction())
        } onReset: {
            store.dispatch(action: ClearAction())
        }
    }

    var body: some View {
        VStack {
            let detailsProps = map(state: store.state.movies)
            let statisticsProps = map(state: store.state.statistics)

            Group {
                if let details = detailsProps.details {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Button("Reset statistics") {
                                statisticsProps.onReset()
                            }
                        }.padding()

                        HStack {
                            Spacer()
                            URLImage(url: details.poster)
                            Spacer()
                        }

                        Text(details.title).padding(5)
                            .font(.title)
                        Text(details.plot).padding(5)

                        HStack {
                            Text("Rating")
                            RatingView(rating: .constant(details.imdbRating.toInt()))
                        }.padding()

                        Spacer()
                    }.onAppear(perform:  {
                        statisticsProps.onAppear()
                    })
                } else {
                    Text("Loading...")
                }
            }

            .onAppear(perform: {
                detailsProps.onLoadMovieDetails(movie.imdbId)
            })

        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {

        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])

        return MovieDetailsView(movie: Movie(title: "Batman", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", imdbId: "tt4853102"))
            .environmentObject(store)
    }
}
