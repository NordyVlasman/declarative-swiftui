//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation
import SwiftUI

protocol ButtonParams {
    var text: String { get set }
}

class ButtonComponent: UIComponent, ButtonParams {
    var text: String
    
    var uniqueID: UUID = UUID()
    
    init(title: String) {
        self.text = title
    }
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        return ButtonViewComponent(text: text).anyView()
    }
}

struct ButtonViewComponent: View, ButtonParams {
    var text: String
    
    var body: some View {
        Button(action: {
            print(text)
        }, label: {
            Text(text)
        })
    }
}
