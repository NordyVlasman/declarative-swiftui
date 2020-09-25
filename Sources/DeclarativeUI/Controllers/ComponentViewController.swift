//
//  ComponentViewController.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

@available(OSX 10.15, *)
class ComponentViewController: ObservableObject {
    @Published var uiComponents: [UIComponent] = []
    
    func getComponents(for row: [Row]) {
        uiComponents = []
        row.forEach { item in
            if item.type == "text" {
                uiComponents.append(TextComponent(title: item.title))
            }
        }
    }
}
