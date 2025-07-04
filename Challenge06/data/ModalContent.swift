//
//  ModalContent.swift
//  Challenge06
//
//  Created by Kenay on 26/06/25.
//

import Foundation
import SwiftUI

//Essa é a struct que vai estruturar todo o conteudo da tela. aqui vamos por tudo que vai ter de titulo, subtitulo, fotos e essas coisas ai
struct ConteudoModal {
    let title: String
    let howItWorks: Text
    let advantages: Text
    let usage: Text
    let stepByStep: [Step]
    let icon: String
}

struct Step: Identifiable {
    let id: UUID = UUID()
    let description: Text
    let image: Image
}

//Como ja esta estruturado em cima o que vai ter na pagina agora é so popular o que realmente de fato vai ter na tela
let conteudosModal: [ConteudoModal] = [
    ConteudoModal(
        title: "SwiftData",
        howItWorks: Text("""
                        Pense no SwiftData como um assistente inteligente e moderno que cuida de todo o trabalho pesado de armazenamento para você. Ele usa a mesma base poderosa do Core Data, mas esconde toda a complexidade por trás de uma API limpa e integrada à linguagem Swift.
                        
                        O fluxo é muito mais direto:
                        
                        1. __O Modelo é o seu Código__: Você não usa um editor visual. Apenas define uma classe Swift normal e a anota com a macro @Model. O SwiftData entende a estrutura a partir do seu próprio código.
                        
                        2. __A "Pilha" é Automática__: A configuração do banco de dados é feita com um único modificador de view no SwiftUI (.modelContainer()).
                        
                        3. __O Contexto é Injetado__: O acesso à "mesa de trabalho" (o ModelContext) é feito de forma declarativa, geralmente com o property wrapper @Environment.
                        
                        É como ter um carro automático: você só precisa se preocupar em dirigir (escrever a lógica do seu app), e o SwiftData cuida de passar as marchas (gerenciar o banco de dados).
                        """),
        advantages: Text("""
                        __Simplicidade e Menos Código__: Reduz drasticamente a quantidade de código necessário ("boilerplate") para configurar e usar a persistência de dados.
                        
                        __Integrado ao Swift__: Usa recursos modernos como macros (@Model) e property wrappers (@Query) para uma experiência de desenvolvimento fluida e natural.
                        
                        __Segurança de Tipos (Type Safety)__: Como tudo é código Swift, você tem mais segurança contra erros de digitação (ex: nomes de atributos) que poderiam ocorrer com o Core Data.
                        
                        __Feito para o SwiftUI__: O property wrapper @Query busca dados e automaticamente atualiza sua interface quando os dados mudam, sem nenhum código extra.
                        """),
        usage: Text("""
                    __Novos Aplicativos (iOS 17+)__: É a escolha padrão e recomendada pela Apple para qualquer novo aplicativo que tenha como alvo o iOS 17 ou superior.
                    
                    __Projetos com Foco em SwiftUI__: Se seu aplicativo é ou será primariamente construído em SwiftUI, a integração do SwiftData é incomparável.
                    
                    __Desenvolvimento Rápido__: A simplicidade e a redução de código permitem prototipar e desenvolver funcionalidades muito mais rapidamente.
                    """),
        stepByStep: [
            Step(description: Text("Crie um novo arquivo Swift chamado JogoSD.swift. Não há editor visual."), image: Image(.swiftData1)),
            Step(description: Text("A configuração é feita com uma única linha no arquivo principal do App."), image: Image(.swiftData2)),
            Step(description: Text("O SwiftData simplifica a busca e a adição de dados drasticamente."), image: Image(.swiftData3))
        ],
        icon: "drop.triangle"
    ),
    ConteudoModal(
        title: "CoreData",
        howItWorks: Text("""
                         Pense no Core Data como uma oficina completa para gerenciar os dados do seu aplicativo. Ele não é o banco de dados em si, mas um conjunto de ferramentas que gerencia como os dados são lidos, escritos e manipulados na memória.
                        
                         A 'pilha' (stack) do Core Data tem 4 componentes principais:
                        
                         1. __Modelo (NSManagedObjectModel)__: A planta do seu objeto. É um arquivo visual (.xcdatamodeld) onde você desenha suas tabelas (entidades) e colunas (atributos).
                        
                         2. __Contexto (NSManagedObjectContext)__: Sua mesa de trabalho. É um "rascunho" inteligente onde você manipula os objetos. O contexto acompanha cada alteração que você faz.
                        
                         3. __Coordenador (NSPersistentStoreCoordinator)__: O gerente da oficina. Ele faz a ponte entre a sua mesa de trabalho (Contexto) e o armazém (o arquivo no disco).
                        
                         4. __Armazenamento (NSPersistentStore)__: O armazém. É o arquivo físico onde os dados são salvos, geralmente um banco de dados SQLite.
                        
                         O seu trabalho é quase todo feito no Contexto. Quando você termina, pede para "salvar", e o resto da pilha cuida de persistir os dados corretamente.
                        """),
        advantages: Text("""
                        __Maturidade e Estabilidade__: Com quase 20 anos, é um dos frameworks mais testados e robustos da Apple.
                        
                        __Controle Total__: Permite um controle muito detalhado sobre o uso de memória, caching, validações e configurações complexas.
                        
                        __Gerenciamento de Desfazer/Refazer__: O suporte a "Undo/Redo" é uma funcionalidade nativa e poderosa, ideal para apps de edição.
                        
                        __Compatibilidade__: Funciona em versões muito antigas do iOS e macOS, garantindo suporte para um público mais amplo.
                        """),
        usage: Text("""
                    __Suporte a Sistemas Antigos__: É a única opção se seu aplicativo precisa rodar no iOS 16 ou anterior.
                    
                    __Projetos Legado__: Para dar manutenção ou adicionar funcionalidades a aplicativos que já foram construídos com Core Data.
                    
                    __Necessidades Avançadas__: Quando você precisa de recursos que o SwiftData ainda não oferece, como configurações de armazenamento customizadas, atributos derivados complexos ou integração profunda com UIKit (NSFetchedResultsController).
                    """),
        stepByStep: [
            Step(description: Text("Crie a Data Model"), image: Image(.coreData1)),
            Step(description: Text("Crie um novo arquivo Swift chamado PersistenceController.swift. Este arquivo vai configurar a pilha' do Core Data."), image: Image(.coreData2)),
            Step(description: Text("No seu arquivo ContentView.swift, vamos usar @FetchRequest para exibir os dados e um botão para adicionar novos jogos."), image: Image(.coreData3)),
            Step(description: Text("No arquivo principal do seu App (ex: CoreDataApp.swift), você precisa injetar o 'contexto' na ContentView."), image: Image(.coreData4)),
        ],
        icon: "cross.case.fill"
    )
]
