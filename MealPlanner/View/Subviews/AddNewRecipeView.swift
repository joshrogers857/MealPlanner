//
//  AddNewRecipeView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeView: View {
    @State private var name: String = ""
    @State private var preparationTime: Double? = nil
    @State private var cookingTime: Double? = nil
    @State private var serves: Int? = nil
    
    private var isFormIncomplete: Bool {
        return name.isEmpty || preparationTime == nil || preparationTime == 0.0 || cookingTime == nil || cookingTime == 0.0 || serves == nil || serves == 0
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
                
                Button("Add Recipe") {
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
