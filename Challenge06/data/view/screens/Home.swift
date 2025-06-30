//
//  Home.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI

struct Home: View {
    @State var shouldNavigate: Bool = false
    @StateObject var viewModel = ApiViewModel()

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    Spacer()
                    TitleHomeView()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            if let results = viewModel.games?.results {
                                ForEach(results, id: \.id) { game in
                                    VStack(spacing: 10) {
                                        AsyncImage(url: URL(string: game.background_image)) { image in
                                            image
                                                .image?
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 200, height: 120)
                                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                        }
                                        Text(game.name)
                                            .font(.caption)
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
                            itens: [0,1,2,3,4,5,6,7,8,9,10] // trocar para os itens
                        )
                        ItensBox(
                            firstColor: Color("MainPurple"),
                            SecondColor: Color("SecondCoreData"),
                            title: "Nunca Joguei",
                            subtitle: "Armazenado com Core Data",
                            icon: "circle.grid.cross.left.filled",
                            itens: [0,1,2,3,4,5,6,7,8,9,10]
                        )

                    }


                    Spacer()

                    ButtonView(shouldNavigate: $shouldNavigate)

                    Spacer()


                }.navigationDestination(isPresented: $shouldNavigate) {
                    DetailsView()
                }
                .onAppear{
                    viewModel.fetch()
                }
            }
        }
    }
}
