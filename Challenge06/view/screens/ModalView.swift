//
//  ModalView.swift
//  Challenge06
//
//  Created by Kenay on 26/06/25.
//

import SwiftUI

struct ModalView: View {
    @Binding var conteudo: ConteudoModal // aqui é o varivel de paramentro da view que vai receber as informaçoes da tela de acordo com a posicao do vetor.

    var body: some View {
        //a navigationStack vai ser onde vai ter todo o conteudo da modal
        NavigationStack {
            ScrollView {
                VStack( alignment: .leading ,spacing: 20) {
                    Text("Como Funciona")
                        .font(.system(size: 20, weight: .semibold))
                    VStack{
                        conteudo.howItWorks
                            .multilineTextAlignment(.leading)
                            .padding(10)
                            
                    }.background(.blocoTempoExecucao)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text("Vantagens")
                        .font(.system(size: 20, weight: .semibold))
                    VStack{
                        conteudo.advantages
                            .multilineTextAlignment(.leading)
                            .padding(10)
                            
                    }.background(.blocoTempoExecucao)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text("Quando Usar")
                        .font(.system(size: 20, weight: .semibold))
                    VStack{
                        conteudo.howItWorks
                            .multilineTextAlignment(.leading)
                            .padding(10)
                            
                    }.background(.blocoTempoExecucao)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text("Passo a Passo")
                        .font(.system(size: 20, weight: .semibold))
                    
                    VStack(spacing: 15){
                        ForEach(conteudo.stepByStep) { step in
                            VStack(alignment: .leading, spacing: 15){
                                step.description
                                    .font(.system(size: 18, weight: .regular))
                                
                                step.image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(8)
                            }
                            
                        }
                    }
                }
                .navigationTitle(conteudo.title) // 👈 define o título no topo da modal
                .navigationBarTitleDisplayMode(.inline) // opcional, para deixar centralizado
                .frame(maxWidth: .infinity, alignment: .leading) //frame para ele ocupar todo o espaço disponivel e alinhar o texto corretamente na esquerda
            }
            
        }
        .padding(.horizontal, 16)
        
    }
        
}

#Preview {
    //O conteudo da tela vai aparecer de acordo com a posicao do vetor
    ModalView(conteudo: .constant(conteudosModal[1]))
}
