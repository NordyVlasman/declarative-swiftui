//
//  declarative_swiftuiApp.swift
//  declarative-swiftui
//
//  Created by Nordy Vlasman on 26/09/2020.
//

import SwiftUI
import DeclarativeUI

@main
struct declarative_swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(manager: DeclarativeUI(dataURL: URL(string: "http://localhost:4000/application")!))
        }
    }
}
