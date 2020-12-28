//
//  AppView.swift
//  dining
//
//  Created by Mounika Reddy on 21/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Menu")
                    
            }
            OrderView()
                .tabItem{
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
