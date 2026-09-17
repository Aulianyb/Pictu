//
//  RevealCard.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 17/09/26.
//

import SwiftUI

struct RevealCard : View {
    @State private var isShaking = false
    @State private var isRevealing = false
    @State private var dragOffset: CGSize = .zero
    @State private var hueRotationAngle: Double = 0
    @State private var isExiting = false
    
    @Binding var isShowing : Bool
    
    var body: some View {
        ZStack{
            ParticleShakeView()
                .opacity(isExiting ? 0 : 1)
                .animation(.easeOut(duration: 0.3), value: isExiting)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 326, height: 460)
                    .scaleEffect(isExiting ? 0.0 : (isRevealing ? 0.2 : 0.3))
                    .overlay{
                        foilLayer
                            .frame(width: 326, height: 460)
                            .scaleEffect(isExiting ? 0.0 : (isRevealing ? 0.2 : 0.3))
                            .hueRotation(.degrees(hueRotationAngle))
                            .blendMode(.softLight)
                            .opacity(isExiting ? 0.0 : (isRevealing ? 1 : 0))
                    }
                    .onAppear {
                        isShaking = true
                        withAnimation(.spring(duration: 0.5, bounce: 0.4)){
                            isRevealing = true
                        }
                        withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: false)) {
                            hueRotationAngle = 360
                        }
                    }
                    .foregroundStyle(Color("Beige"))
            }
            .offset(x: isShaking ? 3 : -3)
            .animation(
                .spring(duration: 0.05, bounce: 0.1)
                .repeatForever(),
                value: isShaking
            )
            .onChange(of: isShowing) {
                if isShowing {
                    isShaking = false
                    withAnimation(.easeIn(duration: 0.3)) {
                        isExiting = true
                    }
                }
            }
        }
    }
}

//#Preview {
//    ZStack{
//        Color("WarmWhite")
//        RevealCard()
//    }
//}
