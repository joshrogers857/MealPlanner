//
//  RecipeListViewModel.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 08/03/2022.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var recipeList: [Recipe]
    
    init() {
        recipeList = RecipeList.recipes
    }
}