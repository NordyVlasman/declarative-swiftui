//
//  ListComponent.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation
import SwiftUI

protocol ListParams {
    var rows: [ListType] { get set }
}

class ListComponent: UIComponent, ListParams {
    var rows: [ListType]
    
    var uniqueID: UUID = UUID()
    
    init(rows: [ListType]) {
        self.rows = rows
    }
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        return ListViewComponent(rows: rows).anyView()
    }
}

struct ListViewComponent: View, ListParams {
    var rows: [ListType]
    
    var body: some View {
        List(rows, id: \.title) { row in
            Text(row.title)
        }
    }
}
