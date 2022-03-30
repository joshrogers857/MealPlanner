//
//  EditMealPlanStageView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 30/03/2022.
//

import SwiftUI

struct EditMealPlanStageView: View {
    private var mealPlanStage: MealPlanStage
    @State private var name: String
    @State private var numberEating: Int16
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $name)
            }
            
            Section("Number eating") {
                TextField("Number eating",
                          value: $numberEating,
                          format: .number)
                    .keyboardType(.decimalPad)
            }
        }
        .navigationTitle("Edit Stage")
        .onChange(of: name) {
            newValue in
            
            if(!newValue.isEmpty) {
                mealPlanStage.name = newValue
                PersistenceController.shared.save()
            }
        }
        .onChange(of: numberEating) {
            newValue in
            
            if(newValue > 0) {
                mealPlanStage.numberEating = newValue
                PersistenceController.shared.save()
            }
        }
    }
    
    init(mealPlanStage: MealPlanStage) {
        self.mealPlanStage = mealPlanStage
        name = mealPlanStage.name ?? ""
        numberEating = mealPlanStage.numberEating
    }
}

/* struct EditMealPlanStageView_Previews: PreviewProvider {
    static var previews: some View {
        EditMealPlanStageView()
    }
} */
