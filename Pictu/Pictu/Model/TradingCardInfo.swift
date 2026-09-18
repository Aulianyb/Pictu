//
//  TradingCardInfo.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 16/09/26.
//

import FoundationModels
import UIKit

@Generable
struct TradingCardInfo {
    @Guide(description: """
    Classify photos by their primary subject using these exact definitions:
    - human: one or more people are the focus (selfies, portraits, group photos)
    - animal: an animal is the focus
    - object: a single inanimate item or product is the focus
    - location: a place, room, building, or landscape is shown, with no single person/object as the focus
    - unknown: none of the above clearly applies
    Always pick the label that matches the image's actual main subject.
        
    """)
    var type: CardType

    @Guide(description: """
    A critical assessment of this photo's visual composition and craft — NOT the \
    subject's inherent interest. Note framing, pose/silhouette, lighting, and whether \
    the shot feels curated versus a random snapshot. 1-2 sentences.
    """)
    var compositionAssessment: String

    @Guide(description: """
    The card's rarity, based strictly on compositionAssessment above, judged by criteria \
    specific to type:
    - human: strong pose, expression, framing, lighting → higher. Awkward/flat/blurry → common.
    - animal: distinct silhouette or action pose, engaging eye contact or motion, \
    clean separation from background, well-exposed lighting → higher rarity
    - object: deliberate angle, lighting, sense of scale → higher. Flat tabletop shot → common.
    - location: strong depth/leading lines, notable light, clear focal point → higher.
    Scale: common (unremarkable snapshot) < rainbow (clearly intentional) < prism (exceptional).
    Default to common unless compositionAssessment clearly shows rainbow/prism-level craft.
    """)
    var rarity: CardRarity

    @Guide(description: "A short, evocative title for the trading card, 1-2 words and all capital.")
    var title: String

    @Guide(description: "A punchy name for the card's special ability, 1-3 words and all capital.")
    var abilityName: String

    @Guide(description: """
    A vivid, game-flavor description of the ability, 1 sentence. Tie its power to \
    rarity — common abilities feel modest, prism abilities feel powerful. \
    Example 1 : Deal one extra hit, if your turn, may initiate a battle. \
    Example 2 : Remove up to three of your warriors fromt he map and place them in any clearing \
    Example 3 : Heal 30 health points and feel refreshed next turn \
    Avoid using too abstract descriptions and word it like an actual trading card game description
    """)
    var abilityDescription: String
}


// TEMPORARY FUNCTION
//func testClassification(imageName : String) async throws -> String {
//    // Replace "test_card" with the exact name of your asset
//    guard let uiImage = UIImage(named: imageName),
//          let cgImage = uiImage.cgImage else {
//        print("Error: Could not load image from Asset Catalog.")
//        return "Error: Could not load image from Asset Catalog."
//    }
//
//    do {
//        let result = try await generateCard(from: UIImage(named: imageName), imageFileName: "testAnimal")
//        print("Test success")
//        return "\(result.title)\n\(result.abilityName)\n\(result.abilityDescription)\n\(result.rarity)\n\(result.type)\n"
//    } catch {
//        return "Classification failed with error: \(error)"
//    }
//}

enum CardGenerationError: Error {
    case invalidImage
}

func generateCard(from item: IdentifiableImage) async throws -> TradingCard {
    let session = LanguageModelSession(
        instructions: """
        You are an expert image analyst and trading card creator. \
        Analyze images thoroughly and accurately, then create a trading card based on the image.
        """
    )
    
    let response = try await session.respond(
        generating: TradingCardInfo.self,
        options: GenerationOptions(samplingMode: .greedy)
    ) {
        "Create trading card details for this image."
        if #available(iOS 27.0, *) {
            Attachment(item.image)
        }
    }

    let info = response.content
    
    let fileName = "card_\(UUID().uuidString).jpg"
    
    return TradingCard(
        title: info.title,
        type: info.type,
        rarity: info.rarity,
        abilityName: info.abilityName,
        abilityDescription: info.abilityDescription,
        imageFileName: fileName
    )
}
