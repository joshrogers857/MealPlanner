//
//  ServesView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct ServesView: View {
    let serves: Int
    let scaledTo: Int?
    
    var body: some View {
        Text("Serves: \(serves) people\(scaledTo != nil ? " (scaled to \(scaledTo!))" : "")")
    }
}

/*struct ServesView_Previews: PreviewProvider {
    static var previews: some View {
        ServesView()
    }
}*/
