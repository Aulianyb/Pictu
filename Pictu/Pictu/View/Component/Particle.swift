//
//  Particle.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 17/09/26.
//

import SwiftUI
import Combine

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var scale: CGFloat
    var opacity: Double
    var color : String
}

struct ParticleShakeView: View {
    @State private var particles: [Particle] = []
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let colorChoices = ["Artifact", "Land", "Creature", "Person"]
    
    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Image(systemName: "sparkle")
                    .foregroundStyle(Color(particle.color))
                    .frame(width: 4, height: 4)
                    .scaleEffect(particle.scale)
                    .opacity(particle.opacity)
                    .offset(x: particle.x, y: particle.y)
            }
        }
        .onReceive(timer) { _ in
            spawnParticle()
        }
    }

    func spawnParticle() {
        let angle = Double.random(in: 0..<360)
        let radius: CGFloat = 200
        let radians = angle * .pi / 180

        var particle = Particle(
            x: 0,
            y: 0,
            scale: 1.4,
            opacity: 1,
            color: colorChoices.randomElement() ?? "Hero"
        )

        particles.append(particle)

        withAnimation(.easeOut(duration: 3)) {
            if let index = particles.firstIndex(where: { $0.id == particle.id }) {
                particles[index].x = cos(radians) * radius
                particles[index].y = sin(radians) * radius
                particles[index].opacity = 0
                particles[index].scale = 0.7
            }
        }

        // cleanup after animation finishes
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            particles.removeAll { $0.id == particle.id }
        }
    }
}
