//
//  ModalContent.swift
//  Challenge06
//
//  Created by Kenay on 26/06/25.
//

import Foundation

//Essa é a struct que vai estruturar todo o conteudo da tela. aqui vamos por tudo que vai ter de titulo, subtitulo, fotos e essas coisas ai
struct ConteudoModal {
    let title: String
    let description: String
    let icon: String
}

//Como ja esta estruturado em cima o que vai ter na pagina agora é so popular o que realmente de fato vai ter na tela
let conteudosModal: [ConteudoModal] = [
    ConteudoModal(
        title: "SwiftData",
        description: "aaaa swiftData",
        icon: "drop.triangle"
    ),
    ConteudoModal(
        title: "CoreData",
        description: "aaaa coreData",
        icon: "cross.case.fill"
    )
]
