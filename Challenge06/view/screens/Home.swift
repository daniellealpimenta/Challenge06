//
//  Home.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            
            
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
            
            
        }
    }
}

#Preview {
    Home()
}
