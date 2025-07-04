//
//  DetailsView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 27/06/25.
//

import SwiftUI

struct DetailsView: View {
    @State var shouldModalView: Bool = false
    @State var conteudos: [ConteudoModal] = conteudosModal
    
    @State var num: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 10){
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16){
                        ConteinerRowView(Title: "SwiftData", description: "A forma moderna de persistir dados, com código mínimo e integração 'mágica' ao SwiftUI.", color: "SwiftDataBackGround").onTapGesture {
                            num = 0
                            shouldModalView.toggle()
                        }
                        
                        ConteinerRowView(Title: "CoreData", description: "O framework da Apple para controle total, performance e gerenciamento de dados complexos.", color:
                                            "CoreDataBackground").onTapGesture {
                            num = 1
                            shouldModalView.toggle()
                        }
                    }
                    Spacer()
                    
                    ExecutionTime()
                    
                    Spacer()
                }.sheet(isPresented: $shouldModalView){
                    ModalView(conteudos: $conteudos, num: $num)
                }
            }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.darkBackGround)
        }
    }
}

#Preview {
    DetailsView()
}
