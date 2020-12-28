//
//  ContentView.swift
//  dining
//
//  Created by Mounika Reddy on 21/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menu) { section in
                    Section(header:Text(section.name)){
                    ForEach(section.items) { item in
                        ItemRow(item: item)
                        
                        }
                    }
                }
            }
            .navigationBarTitle("Menu",displayMode: .inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
