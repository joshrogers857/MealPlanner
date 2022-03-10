//
//  MealPlanViewModel.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import Foundation

class MealPlanViewModel: ObservableObject {
    @Published var mealPlan: MealPlan?
    var date: Date
    
    init(date: Date) {
        self.date = date
        
        self.mealPlan = MealPlans.plans.first(where: { plan in
            let calendar = Calendar.current
            
            let planComponents = calendar.dateComponents([.day, .month, .year], from: plan.date)
            let dateComponents = calendar.dateComponents([.day, .month, .year], from: self.date)
            
            return planComponents == dateComponents
        })
    }
}
