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
    @StateObject var viewModel = ApiViewModel(
        swiftDataViewModel: SwiftDataViewModel(dataSource: .shared),
        coreDataController: CoreDataController()
    )
    
    @StateObject var swiftDataViewModel: SwiftDataViewModel =  SwiftDataViewModel(dataSource: .shared)
    @StateObject var coreDataController: CoreDataController = CoreDataController()
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    Spacer()
                    TitleHomeView()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            if (viewModel.games?.results) != nil {
                                ForEach(viewModel.gameList, id: \.name) { game in
                                    ApiCardView(game: game)
                                        .draggable(game)
                                }
                            } else {
                                ProgressView()
                                    .offset(x: (geometry.size.width / 2.35), y: 0)
                            }
                        }
                        .dropDestination(for: ApiModel.self) { droppedItems, location in
                            if (!viewModel.gameList.contains(droppedItems.first!)) {
                                
                                viewModel.gameList.insert(droppedItems.first!, at: 0)
                                if swiftDataViewModel.games.contains(where: { $0.name == droppedItems.first!.name }) {
                                    swiftDataViewModel.deleteGame(droppedItems.first!)
                                }
                                
                                if coreDataController.games.contains(where: {$0.name == droppedItems.first!.name}) {
                                    if let droppedItem = droppedItems.first,
                                       let index = coreDataController.games.firstIndex(where: { $0.name == droppedItem.name }) {
                                        
                                        coreDataController.deleteGame(at: IndexSet(integer: index))
                                    }
                                }
                                return true
                            }
                            return false
                        }
                    }.padding(.horizontal, 20)
                    HStack {
                        ItensBox(
                            firstColor: Color("MainBlue"),
                            SecondColor: Color("SecondSwiftData"),
                            title: "Joguei",
                            subtitle: "Armazenado com Swift Data",
                            icon: "gamecontroller.fill",
                            itensSwift: swiftDataViewModel.games,
                            itensCore: []
                        )
                        .dropDestination(for: ApiModel.self) { droppedItems, location in
                            swiftDataViewModel.addGame(droppedItems.first!)
                            viewModel.gameList.removeAll(where: { $0.name == droppedItems.first!.name })
                            if let droppedItem = droppedItems.first,
                               let index = coreDataController.games.firstIndex(where: { $0.name == droppedItem.name }) {
                                
                                coreDataController.deleteGame(at: IndexSet(integer: index))
                            }
                            return true;
                        }
                        ItensBox(
                            firstColor: Color("MainPurple"),
                            SecondColor: Color("SecondCoreData"),
                            title: "Nunca Joguei",
                            subtitle: "Armazenado com Core Data",
                            icon: "circle.grid.cross.left.filled",
                            itensSwift: nil,
                            itensCore: coreDataController.games
                        )
                        .dropDestination(for: ApiModel.self) { droppedItems, location in
                            coreDataController.addGame(game: droppedItems.first!)
                            viewModel.gameList.removeAll(where: { $0.name == droppedItems.first!.name })
                            swiftDataViewModel.deleteGame(droppedItems.first!)
                            
                            
                            return true;
                        }
                        
                    }
                    
                    
                    Spacer()
                    
                    HStack{
                        Button(action: {
                            coreDataController.deleteAll()
                            swiftDataViewModel.deleteAll()
                            viewModel.gameList = viewModel.games?.results ?? []
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 28)
                                    .fill(Color.red)
                                    .frame(width: 180.5, height: 60)
                                HStack{
                                    Image(systemName: "trash.fill")
                                        .foregroundStyle(.white)
                                    Text("Limpar")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                }
                                
                            }
                            
                            
                        }
                        
                        ButtonView(shouldNavigate: $shouldNavigate)
                    }
                    
                    Spacer()
                    
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .background(Color.darkBackGround)
                    
                }.navigationDestination(isPresented: $shouldNavigate) {
                    DetailsView()
                
                }
                .onAppear{
                    viewModel.fetch()
                    swiftDataViewModel.fetchGames()
                    coreDataController.fetchGames()
                    
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.darkBackGround)
            }
        }
    }
}
