//
//  NutritionListItemView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 28/03/2022.
//

import SwiftUI

struct NutritionListItemView: View {
    let primaryText: String
    let recommended: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(primaryText)
            Text("Recommended: \(recommended)/day")
                .font(.caption)
        }
    }
}

/*struct NutritionListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionListItemView()
    }
}*/
