//
//  MealPlannerApp.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/02/2022.
//

import SwiftUI

@main
struct MealPlannerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
