//
//  MealPlanStageRecipeList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 21/03/2022.
//

import SwiftUI

struct MealPlanStageRecipeList: View {
    @FetchRequest private var recipes: FetchedResults<Recipe>
    private var stage: MealPlanStage
    
    var body: some View {
        if(recipes.isEmpty) {
            Text("No recipes")
        } else {
            ForEach(recipes) {
                recipe in
                
                RecipeListItemView(recipe: recipe, scaledTo: Int(stage.numberEating))
            }
            .onDelete { offsets in
                for index in offsets {
                    stage.removeFromRecipes(recipes[index])
                    
                    PersistenceController.shared.save()
                }
            }
        }
    }
    
    init(stage: MealPlanStage) {
        _recipes = FetchRequest<Recipe>(
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
            ],
            predicate: NSPredicate(format: "%@ IN mealPlanStages", stage)
        )
        
        self.stage = stage
    }
}

struct MealPlanStageRecipeList_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanStageRecipeList(stage: MealPlanStage())
    }
}
