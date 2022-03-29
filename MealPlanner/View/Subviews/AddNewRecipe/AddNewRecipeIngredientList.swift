//
//  AddNewRecipeIngredientList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeIngredientList: View {
    @Environment(\.managedObjectContext) private var moc
    
    @Binding var ingredients: [RecipeIngredient]
    @State private var isShowing = false
    
    var body: some View {
        List {
            HStack {
                Spacer()
                
                Button {
                    isShowing = true
                } label: {
                    Label("Add ingredient", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
            }
            
            if(ingredients.isEmpty) {
                Text("No ingredients")
            } else {
                ForEach(ingredients) {
                    ingredient in
                    
                    HStack {
                        if(ingredient.ingredient!.quantity > 1) {
                            Text("\(ingredient.quantity)x \(ingredient.ingredient!.quantity)\(ingredient.ingredient!.wrappedUnit) \(ingredient.ingredient!.wrappedName)")
                        } else {
                            Text("\(ingredient.quantity)\(ingredient.ingredient!.wrappedUnit) \(ingredient.ingredient!.wrappedName)")
                        }
                        
                        Spacer()
                        
                        Button {
                            ingredients.removeAll(where: { $0 == ingredient })
                            
                            moc.delete(ingredient)
                        } label: {
                            Label("Delete ingredient", systemImage: "trash.fill")
                                .labelStyle(.iconOnly)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowing) {
            AddNewRecipeAddIngredientView(ingredients: $ingredients, isShowing: $isShowing)
        }
    }
}

/* struct AddNewRecipeIngredientList_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeIngredientList()
    }
} */
