//
//  AddNewRecipeIngredientList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeIngredientList: View {
    @Binding var quantities: [Int16]
    @Binding var ingredients: [Ingredient]
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
                ForEach(ingredients.indices, id: \.self) {
                    index in
                    
                    HStack {
                        if(ingredients[index].quantity > 1) {
                            Text("\(quantities[index])x \(ingredients[index].quantity)\(ingredients[index].wrappedUnit) \(ingredients[index].wrappedName)")
                        } else {
                            Text("\(quantities[index])\(ingredients[index].wrappedUnit) \(ingredients[index].wrappedName)")
                        }
                        
                        Spacer()
                        
                        Button {
                            ingredients.remove(at: index)
                            quantities.remove(at: index)
                        } label: {
                            Label("Delete ingredient", systemImage: "trash.fill")
                                .labelStyle(.iconOnly)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowing) {
            AddNewRecipeAddIngredientView(quantities: $quantities, ingredients: $ingredients, isShowing: $isShowing)
        }
    }
}

/* struct AddNewRecipeIngredientList_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeIngredientList()
    }
} */
