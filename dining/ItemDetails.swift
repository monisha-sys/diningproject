//
//  ItemDetails.swift
//  dining
//
//  Created by Mounika Reddy on 21/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    
    @EnvironmentObject var order:Order
    
    var item :MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo:\(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5 )

            }
            Text(item.description)
            .padding()
            
            Button("Order This"){
                self.order.add(item: self.item)
                
            }
            .font(.largeTitle)
            .clipShape(Rectangle())
            .background(Color.blue)
            .foregroundColor(.black)
            .cornerRadius(5.0)

            Spacer()
            
        }.navigationBarTitle(item.name)
//            .navigationBarItems(
//                trailing: Button("Favourites"){
//                    // show favourites
//                    
//                }
//        )

    }
}

struct ItemDetails_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        
        ItemDetails(item: MenuItem.example).environmentObject(order)
    
  }
}
