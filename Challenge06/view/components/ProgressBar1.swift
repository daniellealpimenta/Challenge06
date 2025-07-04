//
//  ProgressBar.swift
//  Challenge06
//
//  Created by Joao pedro Leonel on 02/07/25.
//

import SwiftUI

struct ProgressBar1: View {
    @State var percentual: Double = 0
    
    var width: CGFloat = 200
    var heitht: CGFloat = 20
    var percent: CGFloat = 69
    var color1: Color = .mainBlue
    var color2: Color = .secondSwiftData
    var color3: Color = .swiftDataProgressBar
    
    var body: some View {
        let multiplier: CGFloat = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: heitht, style: .continuous)
                .frame(width: width, height: heitht)
                .foregroundColor(Color.gray.opacity(0.1))
            
            RoundedRectangle(cornerRadius: heitht, style: .continuous)
                .frame(width: percent * multiplier, height: heitht)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [color1, color2, color3]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: heitht, style: .continuous))
        }
//        .onAppear{
//            withAnimation(.easeInOut(duration: 1.5)) {
//                percentual = 85
//            }
//        }

    }
    
}

#Preview {
    ProgressBar1()
}
