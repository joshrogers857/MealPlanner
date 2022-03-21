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
        
        let stage = MealPlanStage(context: moc)
        stage.name = "Stage1"
        stage.listPosition = 1
        
        mealPlan.addToStages(stage)
        
        do {
            try moc.save()
        } catch {
            throw error
        }
    }
}
