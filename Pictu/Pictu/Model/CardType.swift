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
    
    var typeColor: String {
        switch self {
            case .human: return "Person"
            case .location: return "Land"
            case .object: return "Artifact"
            case .animal: return "Creature"
            case .unknown: return "WarmBrown"
        }
    }
    
    var symbolColor: String {
        switch self {
            case .human: return "PersonText"
            case .location: return "LandText"
            case .object: return "ArtifactText"
            case .animal: return "CreatureText"
            case .unknown: return "WarmWhite"
        }
    }
    
    var symbolName: String {
        switch self {
            case .human: return "figure.fencing"
            case .location: return "house.fill"
            case .object: return "shippingbox.fill"
            case .animal: return "pawprint.fill"
            case .unknown: return "questionmark"
        }
    }
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
