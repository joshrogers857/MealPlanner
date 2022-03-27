//
//  RecipeSummaryView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct RecipeSummaryView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Spacer()
            
            TimingsView(
                preparationTime: recipe.preparationTime,
                cookingTime: recipe.cookingTime
            )
            
            ImageView(name: recipe.wrappedName)
            
            //ServesView(serves: Int(recipe.serves), scaledTo: scaledTo)
            
            IngredientInstructionListView(
                ingredients: recipe.recipeIngredientsArray,
                instructions: recipe.instructionsArray
            )
        }
        .navigationTitle(recipe.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*struct RecipeSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSummaryView()
    }
}*/
