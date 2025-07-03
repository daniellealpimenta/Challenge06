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
        
        dataSource.addGame(game)
        self.games = dataSource.fetchGames()
    }
    
    func fetchGames() {
        self.games = dataSource.fetchGames()
    }
    
    func deleteAll() {
        dataSource.deleteGames()
        fetchGames()
    }
}
