//
//  StagesView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 21/03/2022.
//

import SwiftUI

struct StagesView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest private var stages: FetchedResults<MealPlanStage>
    private var mealPlan: MealPlan
    
    @State private var isShowingAddStage = false
    
    @Environment(\.editMode) private var editMode
    
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
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(stage.listPosition): \(stage.wrappedName)")
                                Text("Number eating: \(stage.numberEating)")
                                    .font(.caption)
                            }
                            
                            if(editMode?.wrappedValue != .active) {
                                NavigationLink(destination: EditMealPlanStageView(mealPlanStage: stage)) {}
                            }
                        }
                    }
                    .onDelete { offsets in
                        for index in offsets {
                            moc.delete(stages[index])
                            
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
                    isShowingAddStage = true
                } label: {
                    Label("Add stage", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $isShowingAddStage) {
            AddNewStageView(isShowing: $isShowingAddStage, mealPlan: mealPlan, stages: stages)
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
