//
//  RecipeListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        NavigationView {
            List {
                if(recipeListViewModel.recipeList.isEmpty) {
                    Text("No recipes found")
                } else {
                    ForEach(recipeListViewModel.recipeList) {
                        recipe in
                        RecipeListItemView(name: recipe.name)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeListViewModel())
    }
}
