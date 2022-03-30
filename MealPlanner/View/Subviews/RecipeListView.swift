//
//  RecipeListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 23/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.managedObjectContext) private var moc
    
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
                .onDelete { offsets in
                    for index in offsets {
                        for instruction in recipeList[index].instructionsArray {
                            moc.delete(instruction)
                        }
                        
                        for recipeIngredient in recipeList[index].recipeIngredientsArray {
                            moc.delete(recipeIngredient)
                        }
                        
                        moc.delete(recipeList[index])
                        
                        PersistenceController.shared.save()
                    }
                }
            }
        }
        .navigationTitle("Recipes")
        .toolbar {
            ToolbarItem {
                EditButton()
            }
            
            ToolbarItem(placement: .primaryAction) {
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
