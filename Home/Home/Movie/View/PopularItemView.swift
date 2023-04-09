//
//  PopularItemView.swift
//  Home
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Component

struct PopularItemView: View {
    var image: String
    var name: String
    var rating: Double
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: image))
                .resizable()
                .indicator(.activity)
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(.black)
                
                RatingView(to: rating)
            }.padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
    }
}
