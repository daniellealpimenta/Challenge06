//
//  SwiftDataViewModel.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 30/06/25.
//

import Foundation
import SwiftData

class SwiftDataViewModel: ObservableObject {
    @Published var games: [ApiModelClass] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService){
        self.dataSource = dataSource
        
        // Add dummy expenses to the SwiftData to see if fetching data is works
//        let dummyGames = ApiModelClass.dummyGames
//        for game in dummyGames {
//            dataSource.addGame(game)
//        }
//
//        game = dataSource.fetchGames()
    }
    
    func addGame(_ gameFromApi: ApiModel) {
        let game = ApiModelClass(gameFromApi)
        
        if (games.contains(where: { $0.name == game.name })) {
            print("Jogo já existe no SwiftData: \(game.name)")
            return
        }
        dataSource.addGame(game)
        self.games = dataSource.fetchGames()
        print("fecthgames \(dataSource.fetchGames())")
        print("selfgames \(self.games)")

    }
    
    func fetchGames() {
        self.games = dataSource.fetchGames()
    }
    
    func deleteAll() {
        dataSource.deleteGames()
        fetchGames()
    }
    
    func deleteGame(_ gameFromApi: ApiModel) {
        if let gameToDelete = games.first(where: { $0.name == gameFromApi.name }) {
            dataSource.deleteGame(gameToDelete)
            fetchGames()
        } else {
            print("Jogo não encontrado para deletar: \(gameFromApi.name)")
        }
    }

}
