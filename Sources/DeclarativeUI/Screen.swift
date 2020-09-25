//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

public struct Application: Decodable {
    let screens: [Screen]
}

public struct Screen: Decodable {
    let id: String
    let title: String
    let type: String
    let rows: [Row]
}

public struct Row: Decodable, HasAction {
    let title: String
    var type: String?
    var action: Action? = nil
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActionCodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        action = try decodeAction(from: container)
    }
}
