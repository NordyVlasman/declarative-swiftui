//
//  ComponentViewController.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

class ComponentViewController: ObservableObject {
    @Published var uiComponents: [UIComponent] = []
    
    func getComponents(for row: [Row]) {
        uiComponents = []
        row.forEach { item in
            if item.type == "text" {
                uiComponents.append(TextComponent(title: item.title))
            }
            else if item.type == "list" {
                uiComponents.append(ListComponent(rows: item.listRows!))
            }
            else if item.type == "button" {
                uiComponents.append(ButtonComponent(title: item.title))
            }
        }
    }
}
