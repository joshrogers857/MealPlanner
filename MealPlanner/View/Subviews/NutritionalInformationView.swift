//
//  NutritionalInformationView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 17/03/2022.
//

import SwiftUI

struct NutritionalInformationView: View {
    @FetchRequest var mealPlans: FetchedResults<MealPlan>
    
    var body: some View {
        Text("Calories: \(mealPlans.reduce(0) { $0 + $1.calories})")
        Text("Carbs: \(mealPlans.reduce(0) { $0 + $1.carbs})")
        Text("Fat: \(mealPlans.reduce(0) { $0 + $1.fat})")
        Text("Fibre: \(mealPlans.reduce(0) { $0 + $1.fibre})")
        Text("Protein: \(mealPlans.reduce(0) { $0 + $1.protein})")
        Text("Salt: \(mealPlans.reduce(0) { $0 + $1.salt})")
        Text("Saturates: \(mealPlans.reduce(0) { $0 + $1.saturates})")
        Text("Sugars: \(mealPlans.reduce(0) { $0 + $1.sugars})")
    }
    
    init(startDate: Date, endDate: Date) {
        _mealPlans = FetchRequest<MealPlan>(
            sortDescriptors: [],
            predicate: NSPredicate(
                format: "date >= %@ AND date < %@",
                argumentArray: [startDate, endDate]
            )
        )
    }
}

/*struct NutritionalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionalInformationView()
    }
}*/
