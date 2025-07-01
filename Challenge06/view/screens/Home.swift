//
//  Home.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI
import CoreData

struct Home: View {
    @State var shouldNavigate: Bool = false
    @StateObject var viewModel = ApiViewModel()
    
    @StateObject var swiftDataViewModel: SwiftDataViewModel =  SwiftDataViewModel(dataSource: .shared)
    @StateObject var coreDataController: CoreDataController = CoreDataController()
    
    @Environment(\.managedObjectContext) var moc
    
    @State var selectedGame: ApiModel?
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    Spacer()
                    var gamesCoreData: [String] {
                        coreDataController.games.compactMap { $0.name }
                    }
                    
                    TitleHomeView()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            if let results = viewModel.games?.results {
                                ForEach(results, id: \.id) { game in
                                    
                                    let isSelected = (game.id == selectedGame?.id)
                                    
                                    ApiCardView(game: game, isSelected: isSelected)
                                    .animation(.easeInOut(duration: 0.2), value: selectedGame)
                                    .onTapGesture {
                                        if isSelected{
                                            selectedGame = nil
                                        }else {
                                            selectedGame = game
                                        }
                                    }
                                }
                            } else {
                                ProgressView()
                                    .offset(x: (geometry.size.width / 2.35), y: 0)
                            }
                        }
                    }.padding(.horizontal, 20)
                    HStack {
                        ItensBox(
                            firstColor: Color("MainBlue"),
                            SecondColor: Color("SecondSwiftData"),
                            title: "Joguei",
                            subtitle: "Armazenado com swift data",
                            icon: "gamecontroller.fill",
                            itensSwift: swiftDataViewModel.games,
                            itensCore: []
                        ).onTapGesture {
                            if let selectedGame = selectedGame {
                                swiftDataViewModel.addGame(selectedGame)
                            }
                        }
                        ItensBox(
                            firstColor: Color("MainPurple"),
                            SecondColor: Color("SecondCoreData"),
                            title: "Nunca Joguei",
                            subtitle: "Armazenado com Core Data",
                            icon: "circle.grid.cross.left.filled",
                            itensSwift: nil,
                            itensCore: gamesCoreData
                        ).onTapGesture {
                            if let selectedGame = selectedGame {
                                coreDataController.addGame(name: selectedGame.name, backgroundImage: selectedGame.background_image)
                            }
                        }

                    }


                    Spacer()

                    ButtonView(shouldNavigate: $shouldNavigate)
                    Button(action: {
                        coreDataController.deleteAll()
                    }) {
                        Text("Teste")
                    }
                    Spacer()


                }.navigationDestination(isPresented: $shouldNavigate) {
                    DetailsView()
                }
                .onAppear{
                    viewModel.fetch()
                    coreDataController.fetchGames()
                }
            }
        }
    }
}
