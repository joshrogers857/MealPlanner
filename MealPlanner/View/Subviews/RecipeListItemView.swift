//
//  RecipeListItemView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeListItemView: View {
    @FetchRequest private var recipe: FetchedResults<Recipe>
    let scaledTo: Int?
    
    var body: some View {
        if(recipe.first != nil) {
            NavigationLink(destination: RecipeSummaryView(recipe: recipe[0], scaledTo: scaledTo)) {
                HStack {
                    ZStack {
                        Color.black
                            .frame(width: 102, height: 62, alignment: .leading)
                    
                        Image(decorative: recipe[0].wrappedName)
                            .resizable()
                            .frame(width: 100, height: 60, alignment: .leading)
                    }
                    
                    Text(recipe[0].wrappedName)
                        .tag(recipe[0].wrappedName)
                        .padding()
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

/*struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListItemView()
    }
}*/
