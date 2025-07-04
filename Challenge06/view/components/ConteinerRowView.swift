//
//  HomeSwiftData.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI

struct ConteinerRowView: View {
    
    // MARK: - Properties
    
    // Colocar entre Swift Data e Core Data
    // Cores:
    // - Swift Data = SwiftDataBackGround
    // - Core Data = CoreDataBackGround
    
    
    let Title: String
    let description: String
    let color: String  // Pode ser "SwiftDataBackGround" ou "CoreDataBackGround"
        
    // Lógica para definir se é Swift Data ou Core Data
    var textColor: Color {
        // Definir a cor do texto com base na cor de fundo
        switch color {
        case "SwiftDataBackGround":
            return Color("SwiftDataTitle")
        case "CoreDataBackground":
            return Color("CoreDataTitle")
        default:
            return Color.primary
        }
    }
        
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(textColor))
                
    
            Text(description)
                .multilineTextAlignment(.leading)
               
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(color))
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        
    }

}

//struct ConteinerRowView_Preview: PreviewProvider {
//    static var previews: some View {
//        return ConteinerRowView(Title: "SwiftData", description: "lorem daohsd hasidu haiosudh oaisudh apisudhsudh aipsudh oaiuhsd", color: "SwiftDataBackGround")
//            .previewLayout(.sizeThatFits)
//    }
//}
