//
//  EditRecipeView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 31/03/2022.
//

import SwiftUI

struct EditRecipeView: View {
    
    @FocusState private var keyboardIsFocused: Bool
    @Environment(\.isPresented) var isPresented
    
    private var recipe: Recipe
    
    @State private var name: String
    @State private var preparationTime: Double
    @State private var cookingTime: Double
    @State private var serves: Int16
    @State private var listType: String = "Ingredients"
    
    var body: some View {
            Form {
                Section("Name") {
                    TextField("Name", text: $name)
                        .focused($keyboardIsFocused)
                }
                
                Section("Prep. time") {
                    TextField("Prep. time",
                              value: $preparationTime,
                              format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                }
                
                Section("Cooking time") {
                    TextField("Cooking time",
                              value: $cookingTime,
                              format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                }
                
                Section("Serves") {
                    TextField("Serves",
                              value: $serves,
                              format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                }
                
                /* Section("Tag") {
                    Picker("Tag", selection: $recipe.tag) {
                        ForEach(RecipeTag.allCases, id: \.self) {
                            value in
                            
                            Text(value.localizedName).tag(value)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Picker("List type", selection: $listType) {
                    Text("Ingredients").tag("Ingredients")
                    Text("Instructions").tag("Instructions")
                }
                .pickerStyle(.segmented)*/
            }
        .navigationTitle("Edit \(recipe.wrappedName)")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    keyboardIsFocused = false
                }
            }
        }
        .onChange(of: isPresented) {
            newValue in
            
            if(newValue == false) {
                recipe.name = name
                recipe.preparationTime = preparationTime
                recipe.cookingTime = cookingTime
                recipe.serves = serves
                
                PersistenceController.shared.save()
            }
            
        }
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
        
        name = recipe.name ?? ""
        preparationTime = recipe.preparationTime
        cookingTime = recipe.cookingTime
        serves = recipe.serves
    }
}

/* struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeView()
    }
} */
