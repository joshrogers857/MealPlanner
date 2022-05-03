//
//  EditRecipeAddIngredientView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 31/03/2022.
//
//  Uses the CodeScanner library, available here: https://github.com/twostraws/CodeScanner
//
//  MIT License
//
//  Copyright (c) 2021 Paul Hudson
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

import CodeScanner

struct EditRecipeAddIngredientView: View {
    @Environment(\.managedObjectContext) private var moc
    @FocusState private var keyboardIsFocused: Bool
    
    var recipe: Recipe
    @Binding var isShowing: Bool
    @State private var isShowingScanner = false
    
    @State private var quantity: Int16? = nil
    @State private var ingredient: Ingredient? = nil
    
    @FetchRequest(
        entity: Ingredient.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Ingredient.name, ascending: true)
        ]
    ) var ingredientList: FetchedResults<Ingredient>
    
    var body: some View {
        VStack {
            Text("Add Ingredient")
                .font(.largeTitle)
                .padding(.top, 8)
                .padding(.bottom, 4)
            
            Button {
                isShowingScanner = true
            } label: {
                Label("Scan barcode", systemImage: "camera")
            }
            
            Form {
                Section {
                    TextField("Quantity",
                              value: $quantity,
                              format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                }
                
                Section("Ingredients") {
                    List {
                        ForEach(ingredientList) {
                            ingredient in
                            
                            HStack {
                                if(ingredient.quantity > 1) {
                                    Text("\(ingredient.quantity)\(ingredient.wrappedUnit) \(ingredient.wrappedName)")
                                } else {
                                    Text(ingredient.wrappedName)
                                }
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .background(self.ingredient?.wrappedName == ingredient.wrappedName ? Color.gray : Color.white)
                            .onTapGesture {
                                if(self.ingredient?.wrappedName == ingredient.wrappedName) {
                                    self.ingredient = nil
                                } else {
                                    self.ingredient = ingredient
                                }
                            }
                        }
                    }
                }
                
                Section {
                    Button {
                        let recipeIngredient = RecipeIngredient(context: moc)
                        recipeIngredient.quantity = quantity!
                        recipeIngredient.ingredient = ingredient!
                        
                        recipe.addToRecipeIngredients(recipeIngredient)
                        
                        PersistenceController.shared.save()
                        
                        isShowing = false
                    } label: {
                        Text("Add Ingredient")
                    }
                    .disabled(quantity == nil || quantity == 0 || ingredient == nil)
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    keyboardIsFocused = false
                }
            }
        }
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(
                codeTypes: [.ean8, .ean13],
                showViewfinder: true
            ) {
                response in
                
                if case let .success(result) = response {
                    for ingredient in ingredientList {
                        if(ingredient.ean == result.string) {
                            self.ingredient = ingredient
                        }
                    }
                    
                    isShowingScanner = false
                }
            }
        }
    }
}

/*struct EditRecipeAddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeAddIngredientView()
    }
}*/
