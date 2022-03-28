//
//  TimingsView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct TimingsView: View {
    private let preparationTime: String
    private let cookingTime: String
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Preparation time: \(preparationTime) min")
                    .font(.headline)
                Text("Cooking time: \(cookingTime) min")
                    .font(.headline)
            }
            
            Spacer()
            Spacer()
            Spacer()
        }
    }
    
    init(preparationTime: Double, cookingTime: Double) {
        let formatter = DateComponentsFormatter()
        
        self.preparationTime = formatter.string(from: preparationTime) ?? "Unknown"
        self.cookingTime = formatter.string(from: cookingTime) ?? "Unknown"
    }
}

/*struct TimingsView_Previews: PreviewProvider {
    static var previews: some View {
        TimingsView()
    }
}*/
