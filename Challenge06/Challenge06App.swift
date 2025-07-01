 //
//  Challenge06App.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import SwiftUI
import CoreData

@main
struct Challenge06App: App {
    @StateObject private var coreDataController = CoreDataController()
    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, coreDataController.container.viewContext)
        }
    }
}
