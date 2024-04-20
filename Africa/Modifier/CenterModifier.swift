//
//  CenterModifier.swift
//  Africa
//
//  Created by COMATOKI on 2024-04-20.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
