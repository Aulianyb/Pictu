//
//  SaveCard.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import UIKit
import SwiftData

func saveCard(context: ModelContext, image: UIImage, fileName: String, card: TradingCard) {
    print("Save card is being called right now.")
    do {
        try CardImageStore.save(image, fileName: fileName)
        print("✅ Successfully saved image at: \(fileName)")
    } catch {
        print("❌ Failed to save image: \(error.localizedDescription)")
    }
    context.insert(card)
    do {
        try context.save()
        print("✅ \(card.title) saved to SwiftData")
    } catch {
        print("❌ context.save() failed: \(error)")
    }
}
