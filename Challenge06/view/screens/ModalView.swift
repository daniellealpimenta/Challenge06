//
//  ModalView.swift
//  Challenge06
//
//  Created by Kenay on 26/06/25.
//

import SwiftUI

struct ModalView: View {
    let conteudo: ConteudoModal // aqui é o varivel de paramentro da view que vai receber as informaçoes da tela de acordo com a posicao do vetor.

    var body: some View {
        //a navigationStack vai ser onde vai ter todo o conteudo da modal
        NavigationStack {
            VStack( alignment: .leading ,spacing: 20) {
                Text(conteudo.description)
                    .font(.system(size: 19.30, weight: .semibold))
                
                
            }
            .navigationTitle(conteudo.title) // 👈 define o título no topo da modal
            .navigationBarTitleDisplayMode(.inline) // opcional, para deixar centralizado
            .frame(maxWidth: .infinity, alignment: .leading) //frame para ele ocupar todo o espaço disponivel e alinhar o texto corretamente na esquerda
            
        }
        .padding(.horizontal, 16)
        
    }
        
}

#Preview {
    //O conteudo da tela vai aparecer de acordo com a posicao do vetor
    ModalView(conteudo: conteudosModal[0])
}
