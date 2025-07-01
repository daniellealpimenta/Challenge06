//
//  Home.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI

struct Home: View {
    @State var shouldNavigate: Bool = false
    @FetchRequest(entity: GamesEntity.entity(), sortDescriptors: []) var games: FetchedResults<GamesEntity>
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                var gamesCoreData: [String] {
                    games.compactMap { $0.name }
                }
                
                TitleHomeView()
                
                Spacer()
                            
                HStack {
                    ItensBox(
                        firstColor: Color("MainBlue"),
                        SecondColor: Color("SecondSwiftData"),
                        title: "Joguei",
                        subtitle: "Armazenado com swift data",
                        icon: "gamecontroller.fill",
                        itens: gamesCoreData// trocar por SwiftData
                    )
                    ItensBox(
                        firstColor: Color("MainPurple"),
                        SecondColor: Color("SecondCoreData"),
                        title: "Nunca Joguei",
                        subtitle: "Armazenado com Core Data",
                        icon: "circle.grid.cross.left.filled",
                        itens: gamesCoreData
                    )
                    
                }
                
                
                Spacer()
                
                ButtonView(shouldNavigate: $shouldNavigate)
                
                Spacer()
                
                
            }            .navigationDestination(isPresented: $shouldNavigate) {
                DetailsView()
            }
        }
        
    }
}

#Preview {
    Home()
}
