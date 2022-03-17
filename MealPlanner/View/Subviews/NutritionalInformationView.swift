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
        Text("Calories: \(mealPlans[0].calories)")
        Text("Carbs: \(mealPlans[0].carbs)")
        Text("Fat: \(mealPlans[0].fat)")
        Text("Fibre: \(mealPlans[0].fibre)")
        Text("Protein: \(mealPlans[0].protein)")
        Text("Salt: \(mealPlans[0].salt)")
        Text("Saturates: \(mealPlans[0].saturates)")
        Text("Sugars: \(mealPlans[0].sugars)")
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
