//
//  TradingCard.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftData
import SwiftUI

@Model
final class TradingCard {
    var id : UUID
    var title : String
    var type : CardType
    var rarity : CardRarity
    var abilityName : String
    var abilityDescription : String
    var imageFileName: String
    
    init(id: UUID = UUID(), title: String, type: CardType, rarity: CardRarity, abilityName: String, abilityDescription: String, imageFileName: String) {
        self.id = UUID()
        self.title = title
        self.type = type
        self.rarity = rarity
        self.abilityName = abilityName
        self.abilityDescription = abilityDescription
        self.imageFileName = imageFileName
    }
}
