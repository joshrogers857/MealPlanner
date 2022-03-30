//
//  RecipeListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 23/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest private var recipeList: FetchedResults<Recipe>
    @FetchRequest private var breakfastRecipes: FetchedResults<Recipe>
    @FetchRequest private var lunchRecipes: FetchedResults<Recipe>
    @FetchRequest private var dinnerRecipes: FetchedResults<Recipe>
    @FetchRequest private var untaggedRecipes: FetchedResults<Recipe>
    
    var body: some View {
        List {
            if(recipeList.isEmpty) {
                Text("No recipes found")
            } else {
                Section("Breakfast") {
                    ForEach(breakfastRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: delete)
                }
                
                Section("Lunch") {
                    ForEach(lunchRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: delete)
                }
                
                Section("Dinner") {
                    ForEach(dinnerRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: delete)
                }
                
                Section("Untagged") {
                    ForEach(untaggedRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: delete)
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
    
    init() {
        _recipeList = FetchRequest(
            entity: Recipe.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
            ]
        )
        
        _breakfastRecipes = FetchRequest(
            entity: Recipe.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
            ],
            predicate: NSPredicate(format: "tag == %@", "Breakfast")
        )
        
        _lunchRecipes = FetchRequest(
            entity: Recipe.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
            ],
            predicate: NSPredicate(format: "tag == %@", "Lunch")
        )
        
        _dinnerRecipes = FetchRequest(
            entity: Recipe.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
            ],
            predicate: NSPredicate(format: "tag == %@", "Dinner")
        )
        
        _untaggedRecipes = FetchRequest(
            entity: Recipe.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
            ],
            predicate: NSPredicate(format: "tag == %@", "Untagged")
        )
    }
    
    func delete(at offsets: IndexSet) {
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

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
