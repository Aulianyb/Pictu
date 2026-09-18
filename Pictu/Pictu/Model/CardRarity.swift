//
//  CardRarity.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//
import FoundationModels

@Generable
enum CardRarity: String, Codable, CaseIterable {
    case common
    case rainbow
    case prism
}

extension CardRarity {
    var displayName: String {
        switch self {
        case .common: return "Common"
        case .rainbow: return "Rainbow"
        case .prism: return "Prism"
        }
    }
}
