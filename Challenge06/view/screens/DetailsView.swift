//
//  DetailsView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 27/06/25.
//

import SwiftUI

struct DetailsView: View {
    @State var shouldModalView: Bool = false
    
    @State var num: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(){
                Spacer()
                
                VStack(alignment: .leading, spacing: 16){
                    ConteinerRowView(Title: "SwiftData", description: "lorem daohsd hasidu haiosudh oaisudh apisudhsudh aipsudh oaiuhsd", color: "SwiftDataBackGround").onTapGesture {
                        num = 0
                        shouldModalView.toggle()
                    }
                    
                    ConteinerRowView(Title: "CoreData", description: "lorem daohsd hasidu haiosudh oaisudh apisudhsudh aipsudh oaiuhsd", color:
                                        "CoreDataBackground").onTapGesture {
                        num = 1
                        shouldModalView.toggle()
                    }
                }
                
                
                Spacer()
                
                ExecutionTime()
                
                Spacer()
            }.sheet(isPresented: $shouldModalView){
                ModalView(conteudo: conteudosModal[num])
            }
        }
    }
}

#Preview {
    DetailsView()
}
