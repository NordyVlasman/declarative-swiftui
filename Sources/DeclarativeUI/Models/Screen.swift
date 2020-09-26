//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

public struct Screen: Decodable {
    let id: String
    let title: String
    let type: Types
    let rows: [Row]
}
