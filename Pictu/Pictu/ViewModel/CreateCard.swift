//
//  CreateCard.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import UIKit
import SwiftData

func createCard(from image: UIImage, title: String, abilityName: String, abilityDescription: String, type: CardType, rarity: CardRarity, context: ModelContext) {
    let fileName = "card_\(UUID().uuidString).jpg"
    try? CardImageStore.save(image, fileName: fileName)

    let card = TradingCard(
        title: title,
        type: type,
        rarity: rarity,
        abilityName: abilityName,
        abilityDescription: abilityDescription,
        imageFileName: fileName
    )
    context.insert(card)
    try? context.save()
}
