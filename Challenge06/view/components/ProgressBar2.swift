//
//  ProgressBar.swift
//  Challenge06
//
//  Created by Joao pedro Leonel on 02/07/25.
//

import SwiftUI

struct ProgressBar2: View {
    @State var percentual2: Double = 0
    
    var percent: CGFloat = 69
    var width: CGFloat = 200
    var heitht: CGFloat = 20
    var color4: Color = .mainPurple
    var color5: Color = .secondCoreData
    var color6: Color = .coreDataProgressBar
    
    var body: some View {
        let multiplier: CGFloat = width / 100
        
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: heitht, style: .continuous)
                    .frame(width: width, height: heitht)
                    .foregroundColor(Color.gray.opacity(0.1))
                
                RoundedRectangle(cornerRadius: heitht, style: .continuous)
                    .frame(width: percent * multiplier, height: heitht)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [color4, color5, color6]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: heitht, style: .continuous))
                
                
                
            }
            
//            .onAppear{
//                withAnimation(.easeInOut(duration: 1.5)) {
//                    percentual2 = 65
//                }
//            }
        }
        
    }
    
}

#Preview {
    ProgressBar2()
}
