//
//  checkOutView.swift
//  dining
//
//  Created by Mounika Reddy on 21/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import SwiftUI

struct checkOutView: View {
    
    @EnvironmentObject var order:Order
    static let paymentMethods = ["Cash","CreditCard","GooglePay","DebitCard"]
    @State private var paymentMethod = 0
    static let tipPercentages = [10,15,20,25,30]
    @State private var tipPercentage = 1
    @State private var confirmOrderAlert = false
    static let pickUpTimes = ["Now","ToNight","Tomorrow Morning"]
    @State private var pickUpTime = 0
    
    var totalPrice:Double{
        var total = Double(order.total)
        var tips = total / 100 * Double(checkOutView.self.tipPercentages[tipPercentage])
        
        return total + tips
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How Do You Want pay",selection: $paymentMethod) {
                    ForEach(0..<checkOutView.self.paymentMethods.count) {
                        Text(checkOutView.self.paymentMethods[$0])
                        
                    }
                    
                }
            }
            Section(header:Text("Select Your Tip Percentage")){
                Picker(" Percentage :",selection: $tipPercentage){
                    ForEach(0..<checkOutView.self.tipPercentages.count){
                        Text("\(checkOutView.self.tipPercentages[$0])%")
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:Text("At What Time You Want to Pick The Order")){
                Picker("Pickup time",selection: $pickUpTime){
                    ForEach(0..<checkOutView.self.pickUpTimes.count){
                        Text("\(checkOutView.self.pickUpTimes[$0])")
                        
                    }

                }.pickerStyle(SegmentedPickerStyle())
                
            }
            Section(header:Text("Total Bill : \(totalPrice,specifier: "%.2f")")
                .font(.largeTitle)
            ){
                Button("Confirm Order"){
                    self.confirmOrderAlert.toggle()
                    
                }
            }
        }

        .navigationBarTitle("Payment",displayMode: .inline)
        .alert(isPresented: $confirmOrderAlert){
            Alert(title: Text("Order Confirmed"), message: Text("Your Total Was $\(totalPrice,specifier: "%.2f") - ThankYou!"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct checkOutView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        checkOutView().environmentObject(order)
    }
}
