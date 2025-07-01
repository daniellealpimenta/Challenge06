//
//  TempoExecucao.swift
//  Challenge06
//
//  Created by Joao pedro Leonel on 26/06/25.
//

import SwiftUI

struct ExecutionTime: View {
    var body: some View {
        Text("Tempo de Excução ")
        .font(.title)
            .fontWeight(.bold)
        
        // MARK - retangulos
        
        VStack(spacing: 20){
            Rectangle()
            .fill(Color("BlocoTempoExecucao"))
            .cornerRadius(20)
            .frame(maxWidth: .infinity, maxHeight: 187 )
            .overlay(
                
                VStack(alignment: .leading) {
                    Text("Swift Data tende a ser mais rápido para operações comuns por ser uma API mais leve.")
                        .font(.system(size: 15, weight: .regular))
                        .padding(EdgeInsets(top: -30, leading: 10, bottom: 30, trailing: 6))  //Formatação das esscritas dentro do retangulo
                    
                    Text("SwiftData")
                        .font(.system(size: 15, weight: .medium))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 0))//Formatação das esscritas dentro do retangulo
                    Text("CoreData")
                        .font(.system(size: 15, weight: .medium))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 0))//Formatação das esscritas dentro do retangulo
                }
                )
            
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
        //MARK - Dupla de retangulos
        HStack{
            VStack(spacing: 20){
                Rectangle()
                .fill(Color("SwiftDataBackGround"))
                .cornerRadius(20)
                .frame(maxWidth: .infinity, maxHeight: 150 )
                .overlay(
                    VStack(){
                        Text("SwiftData")
                            .foregroundStyle(Color("SwiftDataTitle"))
                            .font(.system(size: 18, weight: .bold))
                    }
                )
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 5))
            
            VStack(spacing: 20){
                Rectangle()
                .fill(Color("CoreDataBackground"))
                .cornerRadius(20)
                .frame(maxWidth: .infinity, maxHeight: 150 )
                .overlay(
                    VStack{
                        Text("CoreData")
                            .foregroundStyle(Color("CoreDataTitle"))
                            .font(.system(size: 18, weight: .bold))
                    }
                )
            }
            .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 20))
            
        }
        
           
            
    }
}
#Preview {
    ExecutionTime()
}
