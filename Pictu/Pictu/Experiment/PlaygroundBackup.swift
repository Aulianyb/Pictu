//
//  PlaygroundBakcup.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

//
//  Playground.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

import FoundationModels
import Playgrounds
import CoreGraphics

@Generable
enum cardTypes {
    case human
    case animal
    case object
    case location
}

#Playground {
    let session = LanguageModelSession()
// I HAVE TO WAIT UNTIL 2 DAYS LEFT!!!!!!
//    func classifyImage(_ image: CGImage) async throws -> cardTypes {
//        let response = try await session.respond(
//            generating: cardTypes.self,
//            options: GenerationOptions(sampling: .greedy)
//        ) {
//            "Choose the label that best represents the following image:"
//            
//            Attachment(image)
//        }
//        return response.conten
//    }
    
    print("Backup is running")
    
    let result = try await session.respond(to: "Give me the top 4 largest country in the world?")
    print(result.content)
    print("Backup is finished")
}
