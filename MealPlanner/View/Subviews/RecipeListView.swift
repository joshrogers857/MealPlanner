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
                    .onDelete(perform: deleteBreakfast)
                }
                
                Section("Lunch") {
                    ForEach(lunchRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: deleteLunch)
                }
                
                Section("Dinner") {
                    ForEach(dinnerRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: deleteDinner)
                }
                
                Section("Untagged") {
                    ForEach(untaggedRecipes, id: \.self) {
                        recipe in
                        
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                    }
                    .onDelete(perform: deleteUntagged)
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
    
    func deleteBreakfast(at offsets: IndexSet) {
        for index in offsets {
            for instruction in breakfastRecipes[index].instructionsArray {
                moc.delete(instruction)
            }
            
            for recipeIngredient in breakfastRecipes[index].recipeIngredientsArray {
                moc.delete(recipeIngredient)
            }
            
            moc.delete(breakfastRecipes[index])
            
            PersistenceController.shared.save()
        }
    }
    
    func deleteLunch(at offsets: IndexSet) {
        for index in offsets {
            for instruction in lunchRecipes[index].instructionsArray {
                moc.delete(instruction)
            }
            
            for recipeIngredient in lunchRecipes[index].recipeIngredientsArray {
                moc.delete(recipeIngredient)
            }
            
            moc.delete(lunchRecipes[index])
            
            PersistenceController.shared.save()
        }
    }
    
    func deleteDinner(at offsets: IndexSet) {
        for index in offsets {
            for instruction in dinnerRecipes[index].instructionsArray {
                moc.delete(instruction)
            }
            
            for recipeIngredient in dinnerRecipes[index].recipeIngredientsArray {
                moc.delete(recipeIngredient)
            }
            
            moc.delete(dinnerRecipes[index])
            
            PersistenceController.shared.save()
        }
    }
    
    func deleteUntagged(at offsets: IndexSet) {
        for index in offsets {
            for instruction in untaggedRecipes[index].instructionsArray {
                moc.delete(instruction)
            }
            
            for recipeIngredient in untaggedRecipes[index].recipeIngredientsArray {
                moc.delete(recipeIngredient)
            }
            
            moc.delete(untaggedRecipes[index])
            
            PersistenceController.shared.save()
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
