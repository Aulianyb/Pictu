////
////  TestView.swift
////  Pictu
////
////  Created by Aulia Nadhirah Yasmin Badrulkamal on 15/09/26.
////
//
//import SwiftUI
//
//struct TestView : View {
//    @State private var resultText: String = "Classifying..."
//    @State private var displayedImage : String = "TestAnimal"
//    var body: some View {
//        VStack{
//            Text(displayedImage)
//            Image(displayedImage)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200)
//            Text(resultText)
//                .padding()
//                .task(id: displayedImage) {
//                    resultText = "Classifying..."   // reset while the new call runs
//                    do {
//                        resultText = try await testClassification(imageName: displayedImage)
//                    } catch {
//                        resultText = "Error: \(error)"
//                    }
//                }
//            Button("Animal"){
//                displayedImage = "TestAnimal"
//            }.buttonStyle(.bordered)
//            Button("Person"){
//                displayedImage = "TestPerson"
//            }.buttonStyle(.bordered)
//            Button("Land"){
//                displayedImage = "TestLand"
//            }.buttonStyle(.bordered)
//            Button("Object"){
//                displayedImage = "TestObject"
//            }.buttonStyle(.bordered)
//            Button("Blur"){
//                displayedImage = "TestBlur"
//            }.buttonStyle(.bordered)
//        }
//    }
//}
//
//#Preview {
//    TestView()
//}
//
//
