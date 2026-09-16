//
//  CardType.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//
import FoundationModels

@Generable
enum CardType: String, Codable, CaseIterable {
    case human
    case location
    case object
    case animal
    case unknown
}

extension CardType {
    var displayName: String {
        switch self {
        case .human: return "Human"
        case .animal: return "Animal"
        case .object: return "Object"
        case .location: return "Location"
        case .unknown: return "Unknown"
        }
    }
}
