//
//  SummaryIngredientListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct SummaryIngredientListView: View {
    let ingredients: [RecipeIngredient]
    
    var body: some View {
        List {
            ForEach(ingredients) {
                recipeIngredient in
                
                if(recipeIngredient.ingredient!.quantity > 1) {
                    Text("\(recipeIngredient.quantity)x \(recipeIngredient.ingredient!.quantity)\(recipeIngredient.ingredient!.wrappedUnit) \(recipeIngredient.ingredient!.wrappedName)")
                } else {
                    Text("\(recipeIngredient.quantity)\(recipeIngredient.ingredient!.wrappedUnit) \(recipeIngredient.ingredient!.wrappedName)")
                }
            }
        }
    }
}

/*struct SummaryIngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryIngredientListView()
    }
}*/
