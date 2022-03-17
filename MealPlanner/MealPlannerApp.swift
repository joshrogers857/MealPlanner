//
//  MealPlannerApp.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/02/2022.
//

import SwiftUI

@main
struct MealPlannerApp: App {
    private let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
