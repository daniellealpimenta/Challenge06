//
//  DetailsView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 27/06/25.
//

import SwiftUI

struct DetailsView: View {
    @State var shouldModalView: Bool = false
    
    @State var conteudoModalLocal = conteudosModal[0]
    
    
    var body: some View {
        ZStack{
            VStack(){
                Spacer()
                
                VStack(alignment: .leading, spacing: 16){
                    ConteinerRowView(Title: "SwiftData", description: "lorem daohsd hasidu haiosudh oaisudh apisudhsudh aipsudh oaiuhsd", color: "SwiftDataBackGround").onTapGesture {
                        conteudoModalLocal = conteudosModal[0]
                        shouldModalView.toggle()
                    }
                    ConteinerRowView(Title: "CoreData", description: "lorem daohsd hasidu haiosudh oaisudh apisudhsudh aipsudh oaiuhsd", color:
                                        "CoreDataBackground").onTapGesture {
                        conteudoModalLocal = conteudosModal[1]
                        shouldModalView.toggle()
                    }
                }
                
                
                Spacer()
                
                ExecutionTime()
                
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.darkBackGround))
            .sheet(isPresented: $shouldModalView){
                ModalView(conteudo: $conteudoModalLocal)
            }
            
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    DetailsView()
}
