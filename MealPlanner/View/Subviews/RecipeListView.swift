//
//  RecipeListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 23/03/2022.
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
        List {
            if(recipeList.isEmpty) {
                Text("No recipes found")
            } else {
                ForEach(recipeList, id: \.self) {
                    recipe in
                    RecipeListItemView(recipe: recipe, scaledTo: nil)
                }
            }
        }
        .navigationTitle("Recipes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddNewRecipeView()) {
                    Label("Add New Recipe", systemImage: "plus")
                }
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
