//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by COMATOKI on 2024-04-20.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}
