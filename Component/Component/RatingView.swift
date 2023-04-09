//
//  RatingView.swift
//  Component
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import SwiftUI

public struct RatingView: View {
    private var rating: Double = 0.0
    
    public init(to rating: Double) {
        self.rating = rating
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text("\(rating, specifier: "%.2f")")
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(1)
                .foregroundColor(.gray)
        }.padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
    }
}
