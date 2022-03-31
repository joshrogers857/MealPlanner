//
//  EditRecipeIngredientListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 31/03/2022.
//

import SwiftUI

struct EditRecipeIngredientListView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @Binding var ingredients: [RecipeIngredient]
    
    var body: some View {
        List {
            if(ingredients.isEmpty) {
                Text("No ingredients")
            } else {
                ForEach(ingredients.indices, id: \.self) {
                    index in
                    
                    HStack {
                        if(ingredients[index].ingredient?.quantity ?? 0 > 1) {
                            Text("\(ingredients[index].quantity)x \(ingredients[index].ingredient?.quantity ?? 0)\(ingredients[index].ingredient?.wrappedUnit ?? "Unknown") \(ingredients[index].ingredient?.wrappedName ?? "Unknown")")
                        } else {
                            Text("\(ingredients[index].quantity)\(ingredients[index].ingredient?.wrappedUnit ?? "Unknown") \(ingredients[index].ingredient?.wrappedName ?? "Unknown")")
                        }
                        
                        Spacer()
                        
                        Button {
                            moc.delete(ingredients[index])
                            
                            PersistenceController.shared.save()
                        } label: {
                            Label("Delete ingredient", systemImage: "trash.fill")
                                .labelStyle(.iconOnly)
                        }
                    }
                }
            }
        }
    }
}

/*struct EditRecipeIngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeIngredientListView()
    }
}*/
