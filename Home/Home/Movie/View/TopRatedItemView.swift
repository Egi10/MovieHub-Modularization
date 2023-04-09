//
//  TopRatedItemView.swift
//  Home
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Component

struct TopRatedItemView: View {
    var image: String
    var name: String
    var rating: Double
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: image))
                .resizable()
                .indicator(.activity)
                .frame(width: 200, height: 250)
                .cornerRadius(8)
            
            Text(name)
                .fontWeight(.semibold)
                .frame(width: 200)
                .lineLimit(1)
                .foregroundColor(.black)
            
            RatingView(to: rating)
        }
    }
}
