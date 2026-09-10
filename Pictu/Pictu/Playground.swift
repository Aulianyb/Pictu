
//
//  Playground.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

import FoundationModels
import Playgrounds


@Generable
struct CardData {
    @Guide(description: "The name of the card, 2 words maximum")
    var cardName : String
    
    @Guide(
         description: """
         Power rating from 1 to 5
        """,
         .range(1...5)
     )
    var rating : Int
    
    @Guide(description: "A short, punchy name for the ability, 1-3 words")
    var abilityName : String
    
    @Guide(
        description: "A short description of the ability, no more than 20 words",
        .pattern(/.{1,120}/)
    )
    var abilityDescription : String
}

#Playground {
    let session = LanguageModelSession(
        instructions: """
            You are writer for a trading card game, the game is themed around medieval fantasy.
            Your job is to create an trading cards based on the prompt.
            """
    )
    
    print("Real is running")
    
    let response = try await session.respond(
        to: "Cats",
        generating: CardData.self
    )
    print("Real is Done")
    
    print(response.content)
}
