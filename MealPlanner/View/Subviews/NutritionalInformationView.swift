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
        Text("Carbs: \(mealPlans.reduce(0) { $0 + $1.carbs})g")
        Text("Fat: \(mealPlans.reduce(0) { $0 + $1.fat})g")
        Text("Fibre: \(mealPlans.reduce(0) { $0 + $1.fibre})g")
        Text("Protein: \(mealPlans.reduce(0) { $0 + $1.protein})g")
        Text("Salt: \(mealPlans.reduce(0) { $0 + $1.salt})g")
        Text("Saturates: \(mealPlans.reduce(0) { $0 + $1.saturates})g")
        Text("Sugars: \(mealPlans.reduce(0) { $0 + $1.sugars})g")
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
