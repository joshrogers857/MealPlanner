//
//  IngredientListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 23/03/2022.
//

import SwiftUI

struct IngredientListView: View {
    
    @FetchRequest(
        entity: Ingredient.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Ingredient.name, ascending: true)
        ]
    ) var ingredientList: FetchedResults<Ingredient>
    
    var body: some View {
        List {
            if(ingredientList.isEmpty) {
                Text("No ingredients found")
            } else {
                ForEach(ingredientList, id: \.self) {
                    ingredient in
                    
                    Text(ingredient.wrappedName)
                }
            }
        }
        .navigationTitle("Ingredients")
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
