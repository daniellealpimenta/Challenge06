//
//  ModalView.swift
//  Challenge06
//
//  Created by Kenay on 26/06/25.
//

import SwiftUI

struct ModalView: View {
    @Binding var conteudos: [ConteudoModal]// aqui é o varivel de paramentro da view que vai receber as informaçoes da tela de acordo com a posicao do vetor.
    @Binding var num: Int
    @State var showImage: Bool = false
    @State var selectedImage: Image?

    var body: some View {
        //a navigationStack vai ser onde vai ter todo o conteudo da modal
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack( alignment: .leading ,spacing: 20) {
                        Text("Como Funciona")
                            .font(.system(size: 20, weight: .semibold))
                        VStack{
                            conteudos[num].howItWorks
                                .multilineTextAlignment(.leading)
                                .padding(10)
                            
                        }.background(.blocoTempoExecucao)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Text("Vantagens")
                            .font(.system(size: 20, weight: .semibold))
                        VStack{
                            conteudos[num].advantages
                                .multilineTextAlignment(.leading)
                                .padding(10)
                            
                        }.background(.blocoTempoExecucao)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Text("Quando Usar")
                            .font(.system(size: 20, weight: .semibold))
                        VStack{
                            conteudos[num].howItWorks
                                .multilineTextAlignment(.leading)
                                .padding(10)
                            
                        }.background(.blocoTempoExecucao)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Text("Passo a Passo")
                            .font(.system(size: 20, weight: .semibold))
                        
                        VStack(spacing: 15){
                            ForEach(conteudos[num].stepByStep) { step in
                                VStack(alignment: .leading, spacing: 15){
                                    step.description
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    step.image
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            self.showImage.toggle()
                                            self.selectedImage = step.image
                                        }
                                    
                                    
                                }
                                
                            }
                        }
                    }
                    .navigationTitle(conteudos[num].title) // 👈 define o título no topo da modal
                    .navigationBarTitleDisplayMode(.inline) // opcional, para deixar centralizado
                    .frame(maxWidth: .infinity, alignment: .leading) //frame para ele ocupar todo o espaço disponivel e alinhar o texto corretamente na esquerda
                    
                    
                    
                }
                
            }
            .padding(.horizontal, 16)
            
            if showImage {
                if let image = selectedImage {
                    ZoomView(image: image, isPresented: $showImage)
                }
            }
        }
    }
        
}

//#Preview {
//    //O conteudo da tela vai aparecer de acordo com a posicao do vetor
//    ModalView(conteudo: .constant(conteudos[1]))
//}
