//
//  FavoriteView.swift
//  ios-submission
//
//  Created by Magistra Apta on 24/01/24.
//

import SwiftUI
import Game

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter = .init(favoriteUseCase: GameInjection.init().provideFavorite())
    var body: some View {
        VStack{
            Text("Favorite List")
                .font(.title)
                .bold()
            if presenter.favoriteGame.isEmpty {
                Spacer()
                VStack {
                    
                    Text("No data")
                        .foregroundColor(.secondary)
                }
                Spacer()
                
            } else {
                List{
                    ForEach(presenter.favoriteGame) { item in
                        presenter.linkBuilder(for: item) {
                            GameRow(game: item)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            presenter.getFavorite()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
