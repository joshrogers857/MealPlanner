//
//  RecipeListItemView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct RecipeListItemView: View {
    let name: String
    
    var body: some View {
        HStack {
            ZStack {
                Color.black
                    .frame(width: 102, height: 62, alignment: .leading)
            
                Image(decorative: name)
                    .resizable()
                    .frame(width: 100, height: 60, alignment: .leading)
            }
            
            Text(name)
                .tag(name)
                .padding()
        }
    }
}

struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListItemView(name: "Shakshuka")
    }
}
