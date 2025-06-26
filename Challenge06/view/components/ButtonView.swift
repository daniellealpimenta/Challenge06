//
//  ButtonView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {}) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 28)
                    .foregroundStyle(
                        LinearGradient(colors: [Color("MainBlue"), Color("PurpleButton"), Color("MainPurple")], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 361, height: 60)
                
                Text("Ver Detalhes")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
            }
        }
        
    }
}

#Preview {
    ButtonView()
}
