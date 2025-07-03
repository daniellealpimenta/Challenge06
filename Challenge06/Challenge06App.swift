 //
//  Challenge06App.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI
import SwiftData
import CoreData

@main
struct Challenge06App: App {
    @StateObject private var coreDataController = CoreDataController()
    var body: some Scene {
        
            WindowGroup {
                Home()
                    .environmentObject(coreDataController)
                    .environment(\.managedObjectContext, coreDataController.container.viewContext)
                    
                    
            }
            .modelContainer(for: ApiModelClass.self)
        
        
    }
}
