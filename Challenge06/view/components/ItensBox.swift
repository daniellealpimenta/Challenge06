//
//  ItensBox.swift
//  Challenge06
//
//  Created by israel lacerda gomes santos on 27/06/25.
//

import SwiftUI

struct ItensBox: View {

    let firstColor: Color
    let SecondColor: Color
    let title: String
    let subtitle: String
    let icon: String
    let itens: [Int]

    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    LinearGradient(
                        colors: [firstColor,SecondColor],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            VStack(alignment: .center) {
                Text("Joguei")
                    .font(.title)
                    .foregroundStyle(.white)
                Text("Armazenado com Swift Data ")
                    .foregroundStyle(.white)
                    .padding(.bottom, 8)
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(itens, id: \.self) { item in
                        Text("(item)")
                    }
                }
                Image(systemName: icon)
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .padding(.top, 8)
            }.padding(.vertical,20)
        }.frame(width: 173, height: 400)
    }
}

#Preview {
    ItensBox(
        firstColor: Color("MainBlue"),
        SecondColor: Color("SecondSwiftData"),
        title: "Joguei",
        subtitle: "Armazenado com swift data",
        icon: "gamecontroller.fill",
        itens: [0,1,2,3,4,5,6,7,8,9,10]
    )
}
