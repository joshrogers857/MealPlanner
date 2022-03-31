//
//  RecipeSummaryView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct RecipeSummaryView: View {
    @FetchRequest private var recipe: FetchedResults<Recipe>
    private let scaledTo: Int?
    private var scalePercentage: Double? {
        if(scaledTo != nil) {
            return Double(scaledTo!) / Double(recipe[0].serves) //Assert not nil because of if statement
        } else {
            return nil
        }
    }
    
    var body: some View {
        VStack {
            Text("\(recipe[0].wrappedTag) recipe")
                .font(.caption)
            
            Spacer()
            
            TimingsView(
                preparationTime: recipe[0].preparationTime,
                cookingTime: recipe[0].cookingTime
            )
            
            ImageView(name: recipe[0].wrappedName)
            
            ServesView(serves: Int(recipe[0].serves), scaledTo: scaledTo)
            
            IngredientInstructionListView(
                ingredients: recipe[0].recipeIngredientsArray,
                instructions: recipe[0].instructionsArray,
                scaleToPercentage: scalePercentage
            )
        }
        .navigationTitle(recipe[0].wrappedName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink(destination: EditRecipeView(recipe: recipe[0])) {
                    Text("Edit")
                }
            }
        }
    }
    
    init(recipe: Recipe, scaledTo: Int?) {
        _recipe = FetchRequest<Recipe>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "self == %@", recipe)
        )
        
        self.scaledTo = scaledTo
    }
}

/*struct RecipeSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSummaryView()
    }
}*/
