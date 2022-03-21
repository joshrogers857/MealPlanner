//
//  MealPlanStageList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 21/03/2022.
//

import SwiftUI

struct MealPlanStageList: View {
    @FetchRequest private var stages: FetchedResults<MealPlanStage>
    private var mealPlan: MealPlan
    
    var body: some View {
        if(stages.isEmpty) {
            Spacer()
            
            Text("No stages")
            
            Spacer()
        } else {
            List {
                ForEach(stages) {
                    stage in
                    
                    Section(header: StageHeaderView(
                        stage: stage
                    )) {
                        MealPlanStageRecipeList(stage: stage)
                    }
                }
            }
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

struct MealPlanStageList_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanStageList(mealPlan: MealPlan())
    }
}
