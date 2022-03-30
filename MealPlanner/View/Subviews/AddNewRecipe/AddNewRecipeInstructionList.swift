//
//  AddNewRecipeInstructionList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeInstructionList: View {
    @Binding var instructionBodies: [String]
    @State private var isShowing = false
    
    var body: some View {
        List {
            HStack {
                Spacer()
                
                Button {
                    isShowing = true
                } label: {
                    Label("Add instruction", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
            }
            
            if(instructionBodies.isEmpty) {
                Text("No instructions")
            } else {
                ForEach(instructionBodies, id: \.self) {
                    instructionBody in
                    
                    HStack {
                        Text(instructionBody)
                        
                        Spacer()
                        
                        Button {
                            instructionBodies.removeAll(where: { $0 == instructionBody })
                            
                            /*for (index, instruction) in instructions.enumerated() {
                                instruction.stepNumber = Int16((index + 1))
                            }*/
                        } label: {
                            Label("Delete ingredient", systemImage: "trash.fill")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                }
            }
        }
        .sheet(isPresented: $isShowing) {
            AddNewRecipeAddInstructionView(instructionBodies: $instructionBodies, isShowing: $isShowing)
        }
    }
}

/* struct AddNewRecipeInstructionList_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeInstructionList()
    }
} */
