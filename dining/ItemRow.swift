//
//  ItemRow.swift
//  dining
//
//  Created by Mounika Reddy on 21/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors:[String:Color]=["D":.green,"V":.red,"S":.gray,"N":.purple,"G":.orange]
    var item:MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetails(item: item)){
                HStack{
                            Image(item.thumbnailImage)
                           .clipShape(Circle())
                           .overlay(Circle().stroke(Color.gray,lineWidth: 2) )
                       
                VStack(alignment:.leading){
                                Text(item.name)
                               .font(.headline)
                                Text("$\(item.price)")
                    }.layoutPriority(1)
                       
                Spacer()
                       
                ForEach(item.restrictions,id: \.self) { restriction in
                                Text(restriction)
                               .font(.caption)
                               .fontWeight(.black)
                               .padding(5)
                               .background(ItemRow.self.colors[restriction,default: .black])
                               .clipShape(Circle())
                               .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
        
    }
}
