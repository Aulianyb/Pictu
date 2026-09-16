//
//  CardFlowManager.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 16/09/26.
//

import SwiftUI
enum CardFlowStage {
    case capturing
    case processing
    case revealed(TradingCard, IdentifiableImage)
    case failed(String)
}

struct CardFlowManager: View {
    @State private var stage: CardFlowStage = .capturing
    
    var body: some View {
        switch stage {
        case .capturing:
            CameraView(onCapture: handleCapture)
        case .processing:
            ProcessingView()
        case .revealed(let card, let image):
            RevealView(shownCard: card, item: image)
        case .failed(let message):
            FailedView(message : message)
        }
    }

    private func handleCapture(_ image: IdentifiableImage) {
        stage = .processing
        Task {
            do {
                let card = try await generateCard(from: image)
                stage = .revealed(card, image)
            } catch {
                stage = .failed("Something went wrong. Try again.")
            }
        }
    }
}
