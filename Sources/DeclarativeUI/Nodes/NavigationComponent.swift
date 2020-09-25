//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation
import SwiftUI

protocol NavigationParams {
    var title: String { get set }
    var rows: [Row] { get set }
}

class NavigationComponent: UIComponent, NavigationParams {
    var title: String
    var rows: [Row]
    
    var uniqueID: UUID = UUID()
    
    init(title: String, rows: [Row]) {
        self.title = title
        self.rows = rows
        
        print("Hello world")
    }
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        return NavigationViewComponent(title: title, rows: rows).anyView()
    }
}

struct NavigationViewComponent: View, NavigationParams, UIDelegate {
    @ObservedObject var controller = ComponentViewController()
    
    var title: String
    var rows: [Row]
    
    init(title: String, rows: [Row]) {
        print("Test")
        self.title = title
        self.rows = rows
    }
    
    var body: some View {
        NavigationView {
            renderPage(ui: controller.uiComponents, uiDelegate: self)
                .onAppear {
                    controller.getComponents(for: rows)
                }
                .navigationBarTitle(title)
        }
    }
}
