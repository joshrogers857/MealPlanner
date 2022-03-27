//
//  IngredientInstructionListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct IngredientInstructionListView: View {
    let ingredients: [RecipeIngredient]
    let instructions: [Instruction]
    @State private var choice = "Ingredients"
    
    var body: some View {
        Picker("List type", selection: $choice) {
            Text("Ingredients").tag("Ingredients")
            Text("Instructions").tag("Instructions")
        }
        .pickerStyle(.segmented)
        .padding(.leading, 8)
        .padding(.trailing, 8)
        
        if(choice == "Ingredients") {
            SummaryIngredientListView(ingredients: ingredients)
        } else {
            SummaryInstructionsListView(instructions: instructions)
        }
    }
}

/*struct IngredientInstructionListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientInstructionListView()
    }
}*/
