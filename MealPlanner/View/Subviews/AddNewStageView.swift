//
//  AddNewStageView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 21/03/2022.
//

import SwiftUI

struct AddNewStageView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @State private var newStageName = ""
    @State private var numberEating: Int?
    @Binding var isShowing: Bool
    
    var mealPlan: MealPlan
    var stages: FetchedResults<MealPlanStage>
    
    var body: some View {
        VStack {
            Text("Add New Stage")
                .font(.largeTitle)
                .padding(.top, 16)
            
            Form {
                TextField("Name", text: $newStageName)
                TextField("Number eating",
                          value: $numberEating,
                          format: .number)
                    .keyboardType(.decimalPad)
                
                Button("Add New Stage") {
                    let stage = MealPlanStage(context: moc)
                    stage.name = newStageName
                    stage.listPosition = 0
                    stage.numberEating = Int16(numberEating!) //Assert not nil as the button is only enabled when the value is valid
                    
                    for (index, stage) in stages.enumerated() {
                        stage.listPosition = Int16((index + 1))
                    }
                    
                    mealPlan.addToStages(stage)
                    PersistenceController.shared.save()
                    
                    isShowing = false
                }
                .disabled(newStageName.isEmpty || numberEating == nil || numberEating ?? 0 <= 0)
            }
        }
    }
}

/* struct AddNewStageView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewStageView()
    }
} */
