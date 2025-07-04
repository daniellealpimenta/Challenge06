//
//  HomeViewModel.swift
//  Challenge06
//
//  Created by Joao pedro Leonel on 27/06/25.
//


import Foundation
import SwiftUI

class ApiViewModel: ObservableObject {
    @Published var games : ApiResponse?
    @Published var gameList: [ApiModel] = []
    
    @ObservedObject var swiftDataViewModel: SwiftDataViewModel
    @ObservedObject var coreDataController: CoreDataController
    
    init(swiftDataViewModel: SwiftDataViewModel, coreDataController: CoreDataController) {
        self.swiftDataViewModel = swiftDataViewModel
        self.coreDataController = coreDataController
    }

    func fetch () {
        guard let url = URL(string: "https://api.rawg.io/api/games?key=04e139f54ad64c8da513bbec4c03e8ba") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let game = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Failed to fetch data")
                return
            }

            do {
                let parsed = try JSONDecoder().decode(ApiResponse.self, from: data)

                DispatchQueue.main.async {
                    self.games = parsed
                    self.gameList = parsed.results
                    
                    self.swiftDataViewModel.fetchGames()
                    
                    for gameParsed in parsed.results {
                        for game in self.gameList {
                            if gameParsed.name == game.name {
                                self.gameList.removeAll { $0.name == game.name }
                                self.gameList.insert(game, at: 0)
                            }
                        }
                    }
                    self.gameList = self.gameList.filter { game in
                        !self.swiftDataViewModel.games.contains(where: { $0.name == game.name })
                        && !self.coreDataController.games.contains(where: { $0.name == game.name })
                    }
                    print("GameList: \(self.swiftDataViewModel.games)")
                    print("GameList: \(self.coreDataController.games)")
                }

            } catch {
                print(error)
            }
        }
        game.resume()
    
    }
}

