//
//  CoreDataController.swift
//  Challenge06
//
//  Created by Marcos Albuquerque on 30/06/25.
//

import CoreData
import Foundation
import SwiftUICore

class CoreDataController: ObservableObject {
    let container = NSPersistentContainer(name: "Games")
    @Published var games: [GamesEntity] = []
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Falha ao inicializar o Core Data: \(error.localizedDescription)")
            } else {
                self.fetchGames()
            }
        }
    }
    
    // MARK: - Funções para manipulação de jogos
    
    // Função para buscar jogos do Core Data e atualizar a lista de jogos
    func fetchGames() {
        let request = NSFetchRequest<GamesEntity>(entityName: "GamesEntity")
        do {
            games = try container.viewContext.fetch(request)
            print("Jogos carregados com sucesso: \(games)")
        } catch {
            print("Erro ao buscar jogos: \(error.localizedDescription)")
        }
    }
    
    // Função para adicionar um novo jogo ao Core Data
    func addGame(name: String, backgroundImage: String) {
        let novoGame = GamesEntity(context: container.viewContext)
        novoGame.name = name
        novoGame.backgroundImage = backgroundImage
        salvar()
    }
    
    // Deletar Jogo
    func deleteGame(at indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = games[index]
        container.viewContext.delete(entity)
        salvar()
    }
    
    func deleteAll() {
        for game in games {
            container.viewContext.delete(game)
        }
        salvar()
    }
    // Salvar
    private func salvar() {
        do {
            try container.viewContext.save()
            fetchGames()
        } catch {
            print("Erro ao salvar o contexto: \(error.localizedDescription)")
        }
    }
}
