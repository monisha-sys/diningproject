//
//  OrderView.swift
//  dining
//
//  Created by Mounika Reddy on 21/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                        
                    }.onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink(destination: checkOutView()) {
                        Text("Place Order")
                    }.disabled(order.items.isEmpty)
                    
                }
            }
            .navigationBarTitle("Order",displayMode: .inline)
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }


    }
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets:offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
