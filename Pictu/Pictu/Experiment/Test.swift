//
//  FoundationModelsTests.swift
//  Pictu
//
//  Quick smoke-test playground for FoundationModels.
//  Each block is independent — comment/uncomment to isolate what you're testing.
//

import FoundationModels
import Playgrounds

// MARK: - 1. Availability check
// Always check this first. If the model isn't available, everything below will throw.

#Playground {
    let model = SystemLanguageModel.default

    switch model.availability {
    case .available:
        print("✅ Model is available")
    case .unavailable(.deviceNotEligible):
        print("❌ Device not eligible for Apple Intelligence")
    case .unavailable(.appleIntelligenceNotEnabled):
        print("❌ Apple Intelligence not enabled in Settings")
    case .unavailable(.modelNotReady):
        print("⏳ Model not ready (likely still downloading)")
    case .unavailable(let other):
        print("❌ Unavailable: \(other)")
    }
}

// MARK: - 2. Bare-bones text response + timing
// Use this to isolate cold-start cost. Run it twice in the same session —
// the second call should be noticeably faster than the first.

#Playground {
    let session = LanguageModelSession()

    let clock = ContinuousClock()
    let start = clock.now

    let response = try await session.respond(to: "Say hello in one sentence.")

    let elapsed = clock.now - start
    print("⏱️ Elapsed: \(elapsed)")
    print("Response: \(response.content)")
}

// MARK: - 3. Prewarm test
// Compare this timing against block 2 — prewarming should shrink the
// "first response" latency since the model is already loaded into memory.

#Playground {
    let session = LanguageModelSession()

    let warmStart = ContinuousClock().now
    session.prewarm()
    print("Prewarm kicked off at \(warmStart)")

    // Simulate doing other app setup work while the model loads
    try await Task.sleep(for: .seconds(1))

    let clock = ContinuousClock()
    let start = clock.now
    let response = try await session.respond(to: "Say hello in one sentence.")
    let elapsed = clock.now - start

    print("⏱️ Elapsed after prewarm: \(elapsed)")
    print("Response: \(response.content)")
}

// MARK: - 4. Streaming test
// Confirms partial output arrives incrementally rather than all at once.

#Playground {
    let session = LanguageModelSession()

    let stream = session.streamResponse(to: "Write a two-sentence story about a lost cat.")

    for try await partial in stream {
        print("Partial: \(partial)")
    }
}

// MARK: - 5. Guided generation test (DummyData) + timing
// Sanity-checks structured output end to end, with timing so you can compare
// against the plain text call in block 2.

@Generable
struct DummyData {
    @Guide(description: "The name of the card, 2 words maximum")
    var cardName: String

    @Guide(description: "Power rating from 1 to 5", .range(1...5))
    var rating: Int

    @Guide(description: "A short, punchy name for the ability, 1-3 words")
    var abilityName: String

    @Guide(description: "A short description of the ability, no more than 20 words")
    var abilityDescription: String
}

#Playground {
    let session = LanguageModelSession(
        instructions: """
            You are a writer for a trading card game themed around medieval fantasy.
            Create a trading card based on the prompt.
            """
    )

    let clock = ContinuousClock()
    let start = clock.now

    let response = try await session.respond(
        to: "Cats",
        generating: DummyData.self
    )

    let elapsed = clock.now - start
    print("⏱️ Elapsed: \(elapsed)")
    print(response.content)
}

// MARK: - 6. Instructions vs. no-instructions comparison
// Quick way to eyeball how much your instructions are actually steering output.

#Playground {
    let plainSession = LanguageModelSession()
    let plainResponse = try await plainSession.respond(to: "Describe a knight.")
    print("No instructions:\n\(plainResponse.content)\n")

    let styledSession = LanguageModelSession(
        instructions: "You are a sarcastic medieval bard. Keep responses under 3 sentences."
    )
    let styledResponse = try await styledSession.respond(to: "Describe a knight.")
    print("With instructions:\n\(styledResponse.content)")
}
