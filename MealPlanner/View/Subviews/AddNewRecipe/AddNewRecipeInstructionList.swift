//
//  AddNewRecipeInstructionList.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeInstructionList: View {
    @Environment(\.managedObjectContext) private var moc
    
    @Binding var instructions: [Instruction]
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
            
            if(instructions.isEmpty) {
                Text("No instructions")
            } else {
                ForEach(instructions) {
                    instruction in
                    
                    HStack {
                        Text("\(instruction.stepNumber). \(instruction.wrappedBody)")
                        
                        Spacer()
                        
                        Button {
                            instructions.removeAll(where: { $0 == instruction })
                            
                            moc.delete(instruction)
                            
                            for (index, instruction) in instructions.enumerated() {
                                instruction.stepNumber = Int16((index + 1))
                            }
                        } label: {
                            Label("Delete ingredient", systemImage: "trash.fill")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                }
            }
        }
        .sheet(isPresented: $isShowing) {
            AddNewRecipeAddInstructionView(instructions: $instructions, isShowing: $isShowing)
        }
    }
}

/* struct AddNewRecipeInstructionList_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeInstructionList()
    }
} */
