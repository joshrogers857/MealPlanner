//
//  MealPlanViewModel.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import Foundation

class MealPlanViewModel: ObservableObject {
    @Published var mealPlan: MealPlan?
    
    func fetchMealPlan(date: Date) {
        self.mealPlan = MealPlans.plans.first(where: { plan in
            let calendar = Calendar.current
            
            let planComponents = calendar.dateComponents([.day, .month, .year], from: plan.date)
            let dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
            
            return planComponents == dateComponents
        })
    }
    
    func createMealPlan(with mealPlan: MealPlan) {
        if let i = MealPlans.plans.firstIndex(where: { plan in
            let calendar = Calendar.current
            
            let newPlanComponents = calendar.dateComponents([.day, .month, .year], from: mealPlan.date)
            let existingPlanComponents = calendar.dateComponents([.day, .month, .year], from: plan.date)
            
            return newPlanComponents == existingPlanComponents
        }) {
            MealPlans.plans[i] = mealPlan
        } else {
            MealPlans.plans.append(mealPlan)
        }
        
        fetchMealPlan(date: mealPlan.date)
    }
}
