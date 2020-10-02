//
//  ListType.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

public struct ListType: Decodable, HasAction {
    let title: String
    var action: Action? = nil
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActionCodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        action = try decodeAction(from: container)
    }
}
