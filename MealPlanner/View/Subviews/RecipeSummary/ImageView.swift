//
//  ImageView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct ImageView: View {
    let name: String
    
    var body: some View {
        ZStack {
            Color.black
                .frame(width: 302, height: 182, alignment: .leading)
            
            Image(name)
                .resizable()
                .frame(width: 300, height: 180, alignment: .leading)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(name: "Shakshuka")
    }
}
