//
//  TestView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 15/09/26.
//

import SwiftUI
import FoundationModels
import UIKit

@Generable
enum cardTypes {
    case human
    case animal
    case object
    case location
    case unknown
}

struct ImageClassification {
    var description: String
    var label: CardType
}

func testClassification(imageName : String) async throws -> String {
    // Replace "test_card" with the exact name of your asset
    guard let uiImage = UIImage(named: imageName),
          let cgImage = uiImage.cgImage else {
        print("Error: Could not load image from Asset Catalog.")
        return "Error: Could not load image from Asset Catalog."
    }

    do {
        let result = try await classifyImage(cgImage)
        print("Test success")
        return result
    } catch {
        return "Classification failed with error: \(error)"
    }
}

func classifyImage(_ image: CGImage) async throws -> String {
    let session = LanguageModelSession(
    instructions:
    """
    You are an expert image analyst and trading card creator.
    Analyze images thoroughly and accurately and then create a trading card based on that image.
    """
    )
    let response = try await session.respond(
        generating: cardTypes.self,
        options: GenerationOptions(samplingMode: .greedy)
    ) {
         """
            Classify photos by their primary subject using these exact definitions:
            - human: one or more people are the focus (selfies, portraits, group photos)
            - animal: an animal is the focus
            - object: a single inanimate item or product is the focus
            - location: a place, room, building, or landscape is shown, with no single person/object as the focus
            - unknown: none of the above clearly applies
            Always pick the label that matches the image's actual main subject.
        """
        
        if #available(iOS 27.0, *) {
            Attachment(image)
        } else {
            // Fallback on earlier versions
        }
    }
    print(response.content)
    
    let response2 = try await session.respond {
           """
            A detailed, verbose description of the image — at least 4-5 sentences. \
            Cover the main subject, setting/background, notable colors or details, \
            and explicitly mention whether a person, animal, object, or place is the focus.
            """
           
            if #available(iOS 27.0, *) {
                Attachment(image)
            } else {
                // Fallback on earlier versions
            }
       }
    
    print(response2.content)
    
    return(
        "\(response.content)\n\(response2.content)"
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


