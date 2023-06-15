//
//  OpeningTransition.swift
//  CanvasCards
//
//  Created by Sebastiaan Hols on 15/06/2023.
//

import SwiftUI

struct OpeningTransition: View {
  @State private var splash = true
  
  var body: some View {
    VStack {
      if splash {
        KishimisuView()
          .transition(.fadeTransition)
      } else {
        TondorContentView()
          .transition(.fadeTransition)
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation {
          splash.toggle()
        }
      }
    }
  }
}

struct OpeningTransition_Previews: PreviewProvider {
    static var previews: some View {
        OpeningTransition()
    }
}
