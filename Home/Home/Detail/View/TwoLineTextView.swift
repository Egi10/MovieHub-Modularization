//
//  TwoLineTextView.swift
//  Home
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import SwiftUI

struct TwoLineTextView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Text(subtitle)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .foregroundColor(.black)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.gray)
                .padding(.top, -5)
        }
    }
}
