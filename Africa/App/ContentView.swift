//
//  ContentView.swift
//  Africa
//
//  Created by COMATOKI on 2024-04-16.
//

import SwiftUI

struct ContentView: View {
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  
  
  func gridSwitch() {
      withAnimation(.easeIn) {
          gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
          gridColumn = gridLayout.count
          print("Grid Number: \(gridColumn)")
      }
    
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }

  var body: some View {

    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              } //: LINK
            } //: LOOP
            
            CreditsView()
              .modifier(CenterModifier())
          } //: LIST
          .listStyle(.plain)
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                } //: LINK
              } //: LOOP
            } //: GRID
            .padding(10)
//            .animation(.easeIn, value: gridLayout)
//            .animation(.easeIn)
          } //: SCROLL
        } //: CONDITION
      } //: GROUP
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // LIST
            Button(action: {
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            
            // GRID
            Button(action: {
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }) {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
          } //: HSTACK
        } //: BUTTONS
      } //: TOOLBAR
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 13")
  }
}
