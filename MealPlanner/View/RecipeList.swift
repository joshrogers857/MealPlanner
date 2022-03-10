//
//  RecipeList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeList: View {
    @EnvironmentObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        NavigationView {
            List {
                if(recipeListViewModel.recipeList.isEmpty) {
                    Text("No recipes found")
                } else {
                    ForEach(recipeListViewModel.recipeList) {
                        recipe in
                        Text(recipe.name).tag(recipe.name)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList().environmentObject(RecipeListViewModel())
    }
}
