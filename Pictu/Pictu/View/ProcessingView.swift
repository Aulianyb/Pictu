//
//  ProcessingView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 16/09/26.
//

import SwiftUI

struct ProcessingView : View {
    @State private var isRotating = false
    var body: some View {
        ZStack {
            Color("WarmWhite")
                .ignoresSafeArea()
            VStack(spacing:8){
                Image(systemName: "star.fill")
                    .font(.system(size: 50))
                    .rotationEffect(.degrees(isRotating ? 360 : 0))
                    .animation(
                        .linear(duration: 0.8).repeatForever(autoreverses: false),
                        value: isRotating
                    )
                    .onAppear {
                        isRotating = true
                    }
                Text("MAKING YOUR CARD...")
                    .tracking(1)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(.top)
                Text("Tip : this is a work in progress,\nthere will be a better loading screen later")
                    .multilineTextAlignment(.center)
                    .tracking(1)
                    .font(.system(size: 17, weight: .light, design: .rounded))
            }
        }
        .foregroundStyle(Color("WarmBrown"))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProcessingView()
}
