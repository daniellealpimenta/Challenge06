//
//  SwiftDataService.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 30/06/25.
//

import Foundation
import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        // Change isStoredInMemoryOnly to false if you would like to see the data persistance after kill/exit the app
        self.modelContainer = try! ModelContainer(for: ApiModelClass.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchGames() -> [ApiModelClass] {
        do{
            return try modelContext.fetch(FetchDescriptor<ApiModelClass>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addGame(_ game: ApiModelClass) {
        modelContext.insert(game)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
