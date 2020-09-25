//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

public struct Row: Decodable, HasAction {
    let title: String
    var type: String?
    var listRows: [ListType]? = nil
    var action: Action? = nil
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActionCodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        listRows = try container.decode([ListType]?.self, forKey: .list)
        action = try decodeAction(from: container)
    }
}

