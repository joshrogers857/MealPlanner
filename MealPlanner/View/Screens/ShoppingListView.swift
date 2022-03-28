//
//  ShoppingListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 28/03/2022.
//

import SwiftUI
import CoreData

struct ShoppingListView: View {
    @FetchRequest private var mealPlans: FetchedResults<MealPlan>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init() {
        // Start
        // Code adapted from: https://stackoverflow.com/a/71482203/11821338
        // and https://www.reddit.com/r/swift/comments/7oqkbp/get_the_date_of_the_next_sunday/
        
        let calendar = Calendar.current
        
        let weekday = 1 // Sunday
        let sundayComponents = DateComponents(calendar: calendar, weekday: weekday)
        
        let startDate = calendar.startOfDay(for: Date.now)
        let endDate = calendar.nextDate(after: startDate, matching: sundayComponents, matchingPolicy: .nextTimePreservingSmallerComponents)!
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", argumentArray: [startDate, endDate])
        
        // End
        
        _mealPlans = FetchRequest<MealPlan>(
            sortDescriptors: [
                NSSortDescriptor(keyPath: \MealPlan.date, ascending: true)
            ],
            predicate: predicate
        )
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
