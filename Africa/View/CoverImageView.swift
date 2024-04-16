//
//  CoverImageView.swift
//  Africa
//
//  Created by COMATOKI on 2024-04-16.
//

import SwiftUI

struct CoverImageView: View {
    // Mark: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // Mark: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }// :Loop
        }//: Tab
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
