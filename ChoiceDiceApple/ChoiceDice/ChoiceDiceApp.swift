//
//  ChoiceDiceApp.swift
//  ChoiceDice
//
//  Created by Sergio Daniel on 3/07/23.
//

import SwiftUI

@main
struct ChoiceDiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
