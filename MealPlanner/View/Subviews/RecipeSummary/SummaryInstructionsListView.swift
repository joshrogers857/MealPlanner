//
//  SummaryInstructionsListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//

import SwiftUI

struct SummaryInstructionsListView: View {
    let instructions: [Instruction]
    
    var body: some View {
        List {
            ForEach(instructions) {
                instruction in
                
                Text("\(instruction.stepNumber). \(instruction.wrappedBody)")
            }
        }
    }
}

/*struct SummaryInstructionsListView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryInstructionsListView()
    }
}*/
