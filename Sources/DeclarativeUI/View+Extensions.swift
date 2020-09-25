//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation
import SwiftUI

@available(OSX 10.15, *)
extension View {
    func anyView() -> AnyView {
        return AnyView(self)
    }
}
