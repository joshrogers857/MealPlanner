//
//  RecipeSummaryView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct RecipeSummaryView: View {
    let recipe: Recipe
    let scaledTo: Int?
    var scalePercentage: Double? {
        if(scaledTo != nil) {
            return Double(scaledTo!) / Double(recipe.serves) //Assert not nil because of if statement
        } else {
            return nil
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            TimingsView(
                preparationTime: recipe.preparationTime,
                cookingTime: recipe.cookingTime
            )
            
            ImageView(name: recipe.wrappedName)
            
            ServesView(serves: Int(recipe.serves), scaledTo: scaledTo)
            
            IngredientInstructionListView(
                ingredients: recipe.recipeIngredientsArray,
                instructions: recipe.instructionsArray,
                scaleToPercentage: scalePercentage
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
