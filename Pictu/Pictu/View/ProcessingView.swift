//
//  ProcessingView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 16/09/26.
//

import SwiftUI

struct ProcessingView : View {
    @State private var isShaking = false
    var body: some View {
        ZStack {
            Color("WarmWhite")
                .ignoresSafeArea()
            ParticleShakeView()
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 326, height: 460)
                .scaleEffect(0.3)
                .rotationEffect(.degrees(isShaking ? 4 : -4))
                .offset(x: isShaking ? 3 : -3)
                .animation(
                    .spring(duration: 0.1, bounce: 0.1)
                    .repeatForever(autoreverses: true),
                    value: isShaking
                )
                .onAppear {
                    isShaking = true
                }
//                .border(.landText)
            VStack(spacing:8){
                Text("MAKING YOUR CARD...")
                    .tracking(1)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(.top)
                Text("Tip : this is a work in progress,\nthere will be a better loading screen later")
                    .multilineTextAlignment(.center)
                    .tracking(1)
                    .font(.system(size: 17, weight: .light, design: .rounded))
            }
            .offset(y:200)
        }
        .foregroundStyle(Color("Cream"))
        .navigationBarBackButtonHidden(true)
        .onAppear{
            SoundManager.instance.playSound(name : "Shimmering")
        }
    }
}

#Preview {
    ProcessingView()
}
