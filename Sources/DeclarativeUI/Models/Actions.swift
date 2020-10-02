//
//  Action.swift
//  
//
//  Created by Nordy Vlasman on 25/09/2020.
//

import Foundation

protocol HasAction { }

protocol Action: Decodable {
    var presentsNewScreen: Bool { get }
}

struct ShowScreenAction: Action {
    let id: String
    
    var presentsNewScreen: Bool {
        return true
    }
}

extension HasAction {
    func decodeAction(from container: KeyedDecodingContainer<ActionCodingKeys>) throws -> Action? {
        if let actionType = try container.decodeIfPresent(String.self, forKey: .actionType) {
            switch actionType {
            case "showScreen":
                return try container.decode(ShowScreenAction.self, forKey: .action)
            default:
                fatalError("Unknown type")
            }
        } else {
            return nil
        }
    }
}

enum ActionCodingKeys: String, CodingKey {
    case title
    case type
    case actionType
    case action
    case list
}
