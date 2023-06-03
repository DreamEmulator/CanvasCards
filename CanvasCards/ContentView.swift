//
//  ContentView.swift
//  CanvasCards
//
//  Created by Sebastiaan Hols on 03/06/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: CanvasCardsDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(CanvasCardsDocument()))
    }
}
