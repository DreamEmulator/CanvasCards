//
//  CanvasCardsApp.swift
//  CanvasCards
//
//  Created by Sebastiaan Hols on 03/06/2023.
//

import SwiftUI

@main
struct CanvasCardsApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: CanvasCardsDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
