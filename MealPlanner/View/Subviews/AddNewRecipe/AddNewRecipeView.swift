//
//  AddNewRecipeView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @State private var name: String = ""
    @State private var preparationTime: Double? = nil
    @State private var cookingTime: Double? = nil
    @State private var serves: Int? = nil
    
    @State private var listType: String = "Ingredients"
    
    @State private var quantities = [Int16]()
    @State private var ingredients = [Ingredient]()
    @State private var instructionBodies = [String]()
    
    private var isFormIncomplete: Bool {
        return name.isEmpty || preparationTime == nil || preparationTime == 0.0 || cookingTime == nil || cookingTime == 0.0 || serves == nil || serves == 0 || ingredients.isEmpty || instructionBodies.isEmpty
    }
    
    @FocusState private var keyboardIsFocused: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    private let decimalFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .focused($keyboardIsFocused)
                
                TextField("Prep. time",
                          value: $preparationTime,
                          formatter: decimalFormatter)
                    .keyboardType(.decimalPad)
                    .focused($keyboardIsFocused)
                
                TextField("Cooking time",
                          value: $cookingTime,
                          formatter: decimalFormatter)
                    .keyboardType(.decimalPad)
                    .focused($keyboardIsFocused)
                
                TextField("Serves",
                          value: $serves,
                          format: .number)
                    .keyboardType(.decimalPad)
                    .focused($keyboardIsFocused)
                
                Picker("List type", selection: $listType) {
                    Text("Ingredients").tag("Ingredients")
                    Text("Instructions").tag("Instructions")
                }
                .pickerStyle(.segmented)
                
                if(listType == "Ingredients") {
                    AddNewRecipeIngredientList(quantities: $quantities, ingredients: $ingredients)
                } else {
                    AddNewRecipeInstructionList(instructionBodies: $instructionBodies)
                }
                
                Button("Add Recipe") {
                    let recipe = Recipe(context: moc)
                    
                    recipe.name = name
                    recipe.preparationTime = preparationTime! //Can assert nil as if nil we will not reach this code
                    recipe.cookingTime = cookingTime!
                    recipe.serves = Int16(serves!)
                    
                    for (index, _) in ingredients.enumerated() {
                        let recipeIngredient = RecipeIngredient(context: moc)
                        recipeIngredient.quantity = quantities[index]
                        recipeIngredient.ingredient = ingredients[index]
                        
                        recipe.addToRecipeIngredients(recipeIngredient)
                    }
                    
                    for (index, _) in instructionBodies.enumerated() {
                        let instruction = Instruction(context: moc)
                        instruction.body = instructionBodies[index]
                        instruction.stepNumber = Int16((index + 1))
                        
                        recipe.addToInstructions(instruction)
                    }
                    
                    PersistenceController.shared.save()
                    
                    self.mode.wrappedValue.dismiss()
                }
                .disabled(isFormIncomplete)
            }
        }
        .navigationTitle("Add New Recipe")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    keyboardIsFocused = false
                }
            }
        }
    }
}

/*struct AddNewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeView()
    }
}*/
