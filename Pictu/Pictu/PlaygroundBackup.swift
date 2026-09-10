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

#Playground {
    let session = LanguageModelSession()
    
    print("Backup is running")
    
    do {
        let response = try await session.respond(
            to: "What is a human?"
        )
        print(response.content)
        print("Backup is working")
    } catch {
        let error = error
        print(error)
    }
}
