//
//  TempoExecucao.swift
//  Challenge06
//
//  Created by Joao pedro Leonel on 26/06/25.
//

import SwiftUI

struct ExecutionTime: View {
    @State var percentual: Double = 0
    @State var percentual2: Double = 0
    
    var body: some View {
        HStack(){
            Text("Tempo de Excução ")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 10)
            Spacer()
        }
        
            
        // MARK - retangulos
        
        VStack(spacing: 20){
            Rectangle()
            .fill(Color("BlocoTempoExecucao"))
            .cornerRadius(20)
            .frame(maxWidth: .infinity, minHeight: 187 )
            .overlay(
                HStack{
                    VStack(alignment: .leading) {
                        Text("Resultado baseado em um teste de desempenho com 10.000 itens, realizando todas as operações CRUD completas em ambos os frameworks.")
                            .font(.system(size: 15, weight: .regular))

                        VStack{
                            HStack{
                                Text("SwiftData")
                                    .font(.system(size: 15, weight: .medium))

                                ProgressBar1(width: 200, heitht: 15, percent: percentual, color1: .mainBlue, color2: .secondSwiftData, color3: .swiftDataProgressBar)
                                    
                            }
                            HStack{
                                Text("CoreData")
                                    .font(.system(size: 15, weight: .medium))
                                ProgressBar2(percent: percentual2, width: 200, heitht: 15, color4: .mainPurple, color5: .secondCoreData, color6: .coreDataProgressBar)
                            }
                            
                        }
                        .padding(.top, 20)
                        
                        
                    }
                    
                    
                }

                )
            
        }
        
        HStack {
            Text("Linhas de Código")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .multilineTextAlignment(.leading)

            Spacer()
        }
        //MARK - Dupla de retangulos
        HStack{
            VStack(spacing: 20){
                Rectangle()
                .fill(Color("SwiftDataBackGround"))
                .cornerRadius(20)
                .frame(maxWidth: .infinity, minHeight: 106 )
                .overlay(
                    HStack(alignment: .top) {
                        VStack(alignment: .leading){
                            Text("SwiftData")
                                .foregroundStyle(Color("SwiftDataTitle"))
                                .font(.system(size: 18, weight: .bold))
                            VStack{
                                Text("~7")
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            Spacer()
                        }
                        .padding(.trailing)
                        .padding()
                        Spacer()
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
            
            VStack(spacing: 20){
                Rectangle()
                .fill(Color("CoreDataBackground"))
                .cornerRadius(20)
                .frame(maxWidth: .infinity, minHeight: 106 )
                .overlay(
                    HStack (alignment: .top){
                        VStack(alignment: .leading){
                            Text("CoreData")
                                .foregroundStyle(Color("CoreDataTitle"))
                                .font(.system(size: 18, weight: .bold))
                            VStack{
                                Text("~29")
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            Spacer()
                            
                        }
                        .padding(.trailing)
                        .padding()
                        Spacer()
                            
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
            
        }
        
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5)) {
                percentual = 85
                percentual2 = 65
            }
        }
           
            
    }
        
    
}
#Preview {
    ExecutionTime()
}
