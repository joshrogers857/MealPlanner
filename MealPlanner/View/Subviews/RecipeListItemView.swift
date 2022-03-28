//
//  RecipeListItemView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeListItemView: View {
    let recipe: Recipe
    let scaledTo: Int?
    
    var body: some View {
        NavigationLink(destination: RecipeSummaryView(recipe: recipe, scaledTo: scaledTo)) {
            HStack {
                ZStack {
                    Color.black
                        .frame(width: 102, height: 62, alignment: .leading)
                
                    Image(decorative: recipe.wrappedName)
                        .resizable()
                        .frame(width: 100, height: 60, alignment: .leading)
                }
                
                Text(recipe.wrappedName)
                    .tag(recipe.wrappedName)
                    .padding()
            }
        }
    }
}

/*struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListItemView()
    }
}*/
