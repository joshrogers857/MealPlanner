//
//  RecipeView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeView: View {
    @State var selectedType = "Recipes"
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("List Type", selection: $selectedType) {
                    Text("Recipes").tag("Recipes")
                    Text("Ingredients").tag("Ingredients")
                }
                .pickerStyle(.segmented)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                
                if(selectedType == "Recipes") {
                    RecipeListView()
                } else if(selectedType == "Ingredients") {
                    IngredientListView()
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
