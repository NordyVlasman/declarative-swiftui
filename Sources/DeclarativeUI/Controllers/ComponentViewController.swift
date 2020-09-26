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
            if item.type == Types.text {
                uiComponents.append(TextComponent(title: item.title))
            }
            else if item.type == Types.list {
                uiComponents.append(ListComponent(rows: item.listRows!))
            }
            else if item.type == Types.button {
                uiComponents.append(ButtonComponent(title: item.title))
            }
        }
    }
}
