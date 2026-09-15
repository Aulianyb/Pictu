//
//  TestView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 15/09/26.
//

import SwiftUI
import FoundationModels
import UIKit

//var id : UUID
//var title : String
//var type : CardType
//var rarity : CardRarity
//var abilityName : String
//var abilityDescription : String
//var imageFileName: String

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

    @Guide(description: "A short, evocative title for the trading card, 2-4 words.")
    var title: String

    @Guide(description: "A punchy name for the card's special ability, 1-3 words.")
    var abilityName: String

    @Guide(description: """
    A vivid, game-flavor description of the ability, 1-2 sentences. Tie its power to \
    rarity — common abilities feel modest, prism abilities feel powerful.
    """)
    var abilityDescription: String
}

func testClassification(imageName : String) async throws -> String {
    // Replace "test_card" with the exact name of your asset
    guard let uiImage = UIImage(named: imageName),
          let cgImage = uiImage.cgImage else {
        print("Error: Could not load image from Asset Catalog.")
        return "Error: Could not load image from Asset Catalog."
    }

    do {
        let result = try await generateCard(from: cgImage, imageFileName: "testAnimal")
        print("Test success")
        return "\(result.title)\n\(result.abilityName)\n\(result.abilityDescription)\n\(result.rarity)\n\(result.type)\n"
    } catch {
        return "Classification failed with error: \(error)"
    }
}

func generateCard(from image: CGImage, imageFileName: String) async throws -> TradingCard {
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
            Attachment(image)
        }
    }

    let info = response.content

    return TradingCard(
        title: info.title,
        type: info.type,
        rarity: info.rarity,
        abilityName: info.abilityName,
        abilityDescription: info.abilityDescription,
        imageFileName: imageFileName
    )
}

struct TestView : View {
    @State private var resultText: String = "Classifying..."
    @State private var displayedImage : String = "TestAnimal"
    var body: some View {
        VStack{
            Text(displayedImage)
            Image(displayedImage)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text(resultText)
                .padding()
                .task(id: displayedImage) {
                    resultText = "Classifying..."   // reset while the new call runs
                    do {
                        resultText = try await testClassification(imageName: displayedImage)
                    } catch {
                        resultText = "Error: \(error)"
                    }
                }
            Button("Animal"){
                displayedImage = "TestAnimal"
            }.buttonStyle(.bordered)
            Button("Person"){
                displayedImage = "TestPerson"
            }.buttonStyle(.bordered)
            Button("Land"){
                displayedImage = "TestLand"
            }.buttonStyle(.bordered)
            Button("Object"){
                displayedImage = "TestObject"
            }.buttonStyle(.bordered)
            Button("Blur"){
                displayedImage = "TestBlur"
            }.buttonStyle(.bordered)
        }
    }
}

#Preview {
    TestView()
}


