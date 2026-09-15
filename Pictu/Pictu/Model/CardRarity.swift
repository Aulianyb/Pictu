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
