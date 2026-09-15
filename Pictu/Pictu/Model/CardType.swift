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
