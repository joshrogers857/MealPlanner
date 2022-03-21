//
//  MealPlanList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 21/03/2022.
//

import SwiftUI

struct MealPlanList: View {
    @EnvironmentObject private var selectedDate: SelectedDate
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest var mealPlan: FetchedResults<MealPlan>
    
    var body: some View {
        if(mealPlan.isEmpty) {
            Button {
                try? MealPlanService.createMealPlan(date: selectedDate.date, moc: moc)
            } label: {
                Label("Create Meal Plan", systemImage: "plus")
            }
        } else {
            MealPlanStageList(mealPlan: mealPlan[0])
        }
    }
    
    init(selectedDate: Date) {
        // Start
        // Code from: https://stackoverflow.com/a/71482203/11821338
        
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: selectedDate)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", argumentArray: [startDate, endDate])
        
        // End
        
        _mealPlan = FetchRequest<MealPlan>(
            sortDescriptors: [],
            predicate: predicate
        )
    }
}

struct MealPlanList_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanList(selectedDate: Date.now)
            .environmentObject(SelectedDate())
    }
}
