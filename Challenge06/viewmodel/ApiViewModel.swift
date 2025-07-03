//
//  HomeViewModel.swift
//  Challenge06
//
//  Created by Joao pedro Leonel on 27/06/25.
//


import Foundation

class ApiViewModel: ObservableObject {
    @Published var games : ApiResponse?

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
                }

            } catch {
                print(error)
            }
        }
        game.resume()
    }
}

