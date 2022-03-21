//
//  StagesView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 21/03/2022.
//

import SwiftUI

struct StagesView: View {
    @FetchRequest private var stages: FetchedResults<MealPlanStage>
    private var mealPlan: MealPlan
    
    @State private var isShowing = false
    
    var body: some View {
        Group {
            if(stages.isEmpty) {
                Spacer()
                
                Text("No stages")
                
                Spacer()
            } else {
                List {
                    ForEach(stages) {
                        stage in
                        
                        Text("\(stage.listPosition): \(stage.wrappedName)")
                    }
                    .onDelete { offsets in
                        for index in offsets {
                            mealPlan.removeFromStages(stages[index])
                            
                            PersistenceController.shared.save()
                        }
                    }
                }
            }
        }
        .navigationTitle("Edit Stages")
        .toolbar {
            ToolbarItem {
                EditButton()
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isShowing = true
                } label: {
                    Label("Add stage", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $isShowing) {
            AddNewStageView(isShowing: $isShowing, mealPlan: mealPlan, stages: stages)
        }
    }
    
    init(mealPlan: MealPlan) {
        _stages = FetchRequest<MealPlanStage>(
            sortDescriptors: [
                NSSortDescriptor(keyPath: \MealPlanStage.listPosition, ascending: true)
            ],
            predicate: NSPredicate(format: "origin == %@", mealPlan)
        )
        
        self.mealPlan = mealPlan
    }
}

struct StagesView_Previews: PreviewProvider {
    static var previews: some View {
        StagesView(mealPlan: MealPlan())
    }
}
