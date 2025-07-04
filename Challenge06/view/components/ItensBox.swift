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
    let itensSwift: [ApiModelClass]?
    let itensCore: [ApiModel]?

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
            VStack(alignment: .center, spacing: 8) {
                Text(title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.white)
                Text(subtitle)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                ScrollView(.vertical, showsIndicators: false){
                    if firstColor == Color("MainBlue"){
                       if let itensSwift = self.itensSwift{
                           ForEach(itensSwift, id: \.self) { item in
                               ApiCardItemBox(game: item.toApiModel())
                                   .draggable(item.toApiModel())
                           }

                       }
               } else {
                    if let itensCore = self.itensCore{
                        ForEach(itensCore, id: \.self) { item in
                            ApiCardItemBox(game: item)
                                .draggable(item)
                        }
                   }
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

//#Preview {
//    ItensBox(
//        firstColor: Color("MainBlue"),
//        SecondColor: Color("SecondSwiftData"),
//        title: "Joguei",
//        subtitle: "Armazenado com swift data",
//        icon: "gamecontroller.fill",
//        itens: [0,1,2,3,4,5,6,7,8,9,10]
//    )
//}
