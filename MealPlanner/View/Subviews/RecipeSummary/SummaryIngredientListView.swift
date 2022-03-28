//
//  SummaryIngredientListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct SummaryIngredientListView: View {
    let ingredients: [RecipeIngredient]
    let scaleToPercentage: Double?
    private let ingredientService = IngredientService()
    
    var body: some View {
        List {
            ForEach(ingredients) {
                recipeIngredient in
                
                if(recipeIngredient.ingredient!.quantity > 1) {
                    Text("\(ingredientService.scaledRecipeIngredientQuantity(quantity: recipeIngredient.quantity, percentage: scaleToPercentage))x \(recipeIngredient.ingredient!.quantity)\(recipeIngredient.ingredient!.wrappedUnit) \(recipeIngredient.ingredient!.wrappedName)")
                } else {
                    Text("\(ingredientService.scaledRecipeIngredientQuantity(quantity: recipeIngredient.quantity, percentage: scaleToPercentage))\(recipeIngredient.ingredient!.wrappedUnit) \(recipeIngredient.ingredient!.wrappedName)")
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
