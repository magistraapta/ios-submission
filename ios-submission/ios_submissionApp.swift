//
//  ios_submissionApp.swift
//  ios-submission
//
//  Created by Magistra Apta on 24/01/24.
//

import SwiftUI
import Game

@main
struct ios_submissionApp: App {
    
    let homePresenter = HomePresenter(homeUseCase: GameInjection.init().provideHome())
    let favoritePresenter = FavoritePresenter(favoriteUseCase: GameInjection.init().provideFavorite())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
