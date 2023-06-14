//
//  ContentView.swift
//  CanvasCards
//
//  Created by Sebastiaan Hols on 03/06/2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Text("Tab 1")
        .tabItem {
          Image(systemName: "1.circle")
          Text("Tab 1")
        }

      Text("Tab 2")
        .tabItem {
          Image(systemName: "2.circle")
          Text("Tab 2")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
