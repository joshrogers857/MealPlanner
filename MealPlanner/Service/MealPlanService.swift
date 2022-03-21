//
//  MealPlanService.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//

import Foundation
import CoreData

struct MealPlanService {
    func createMealPlan(date: Date, moc: NSManagedObjectContext) throws {
        let mealPlan = MealPlan(context: moc)
        mealPlan.date = date
        
        let breakfast = MealPlanStage(context: moc)
        breakfast.name = "Breakfast"
        breakfast.listPosition = 1
        
        let lunch = MealPlanStage(context: moc)
        lunch.name = "Lunch"
        lunch.listPosition = 2
        
        let dinner = MealPlanStage(context: moc)
        dinner.name = "Dinner"
        dinner.listPosition = 3
        
        mealPlan.addToStages(breakfast)
        mealPlan.addToStages(lunch)
        mealPlan.addToStages(dinner)
        
        do {
            try moc.save()
        } catch {
            throw error
        }
    }
}
