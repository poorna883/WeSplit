//
//  ContentView.swift
//  WeSplit
//
//  Created by Poorna Chandra Vemula on 13/01/20.
//  Copyright © 2020 Poorna Chandra Vemula. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
            
        return amountPerPerson
    }
    
    var totalAmountforCheck : Double{
        
        let totalAmount = totalPerPerson * (Double(numberOfPeople) ?? 1)
        return totalAmount
    }
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Amount",text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                TextField("Number of people", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
                
            }
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip percentage",selection: $tipPercentage){
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            
            Section(header: Text("Total amount for the check")){
                Text("$\(totalAmountforCheck, specifier: "%.2f")")
            }
            
        }
            .navigationBarTitle("WeSplit")
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
