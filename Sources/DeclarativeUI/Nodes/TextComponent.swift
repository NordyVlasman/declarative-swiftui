//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation
import SwiftUI

protocol TextParams {
    var text: String { get set }
}

@available(OSX 10.15, *)
class TextComponent: UIComponent, TextParams {
    var text: String
    
    var uniqueID: UUID = UUID()
    
    init(title: String) {
        self.text = title
    }
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        return TextViewComponent(text: text).anyView()
    }
}

@available(OSX 10.15, *)
struct TextViewComponent: View, TextParams {
    var text: String
    
    var body: some View {
        Text(text)
    }
}
