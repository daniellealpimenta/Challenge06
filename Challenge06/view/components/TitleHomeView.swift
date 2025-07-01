//
//  TitleHomeView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI

struct TitleHomeView: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Image(systemName: "shippingbox")
                    .font(.system(size: 30, weight: .semibold))
                
                Text("Swift Data vs Core Data")
                    .font(.system(size: 28, weight: .semibold))
                    
            }.foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: [Color("MainBlue"), Color("MainPurple")]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            Text("Arraste os jogos para uma das caixas")
                .font(.system(size: 16, weight: .semibold))
        }
    }
}

#Preview {
    TitleHomeView()
}
