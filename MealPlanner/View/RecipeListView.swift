//
//  RecipeListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @FetchRequest(
        entity: Recipe.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
        ]
    ) var recipeList: FetchedResults<Recipe>
    
    var body: some View {
        NavigationView {
            List {
                if(recipeList.isEmpty) {
                    Text("No recipes found")
                } else {
                    ForEach(recipeList, id: \.self) {
                        recipe in
                        RecipeListItemView(name: recipe.wrappedName)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
