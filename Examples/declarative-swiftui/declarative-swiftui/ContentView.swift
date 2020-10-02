//
//  ContentView.swift
//  declarative-swiftui
//
//  Created by Nordy Vlasman on 26/09/2020.
//

import SwiftUI
import DeclarativeUI

struct ContentView: View, UIDelegate {
    @ObservedObject var manager: DeclarativeUI
    
    var body: some View {
        renderPage(ui: manager.uiComponents, uiDelegate: self)
            .onAppear {
                manager.fetchData { screen in
                    manager.loadScreen(screen: screen)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: DeclarativeUI(dataURL: URL(string: "http://localhost:4000/application")!))
    }
}
