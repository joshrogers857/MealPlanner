//
//  AddRecipePickerView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct AddRecipePickerView: View {
    @Binding var isDone: Bool
    @Environment(\.managedObjectContext) private var moc
    var stage: MealPlanStage
    
    @FetchRequest(
        entity: Recipe.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Recipe.name, ascending: true)
        ]
    ) var recipeList: FetchedResults<Recipe>
    
    var body: some View {
        VStack {
            Text("Choose a Recipe")
                .font(.largeTitle)
                .padding(.top, 16)
            
            List {
                if(recipeList.isEmpty) {
                    Text("No recipes found")
                } else {
                    ForEach(recipeList, id: \.self) {
                        recipe in
                        RecipeListItemView(recipe: recipe, scaledTo: nil)
                            .onTapGesture {
                                stage.addToRecipes(recipe)
                                PersistenceController.shared.save()
                                
                                isDone = false
                            }
                    }
                }
            }
        }
    }
}

/*struct AddRecipePickerView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipePickerView()
    }
}*/
