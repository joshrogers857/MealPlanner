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
        
        //Add breakfast, lunch, and dinner stages automatically
        let breakfast = MealPlanStage(context: moc)
        breakfast.name = "Breakfast"
        breakfast.listPosition = 0
        breakfast.numberEating = 1
        
        let lunch = MealPlanStage(context: moc)
        lunch.name = "Lunch"
        lunch.listPosition = 1
        lunch.numberEating = 1
        
        let dinner = MealPlanStage(context: moc)
        dinner.name = "Dinner"
        dinner.listPosition = 2
        dinner.numberEating = 1
        
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
