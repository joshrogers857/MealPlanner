//
//  RecipeListViewModel.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 08/03/2022.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var recipeList: [Recipe]
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
        let request = Recipe.fetchRequest()
        
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
        ]
        
        viewContext.perform {
            let results = try! request.execute()
            
            recipeList = results
        }
    }
}
