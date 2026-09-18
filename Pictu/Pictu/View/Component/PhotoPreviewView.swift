//
//  PhotoPreviewView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct PhotoPreviewView: View {
    let item: IdentifiableImage
    let onDismiss: () -> Void
    let onCapture: (IdentifiableImage) -> Void
    
    var body: some View {
        ZStack{
            Color("WarmWhite")
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Is this right?")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    .tracking(1)
                    .padding(8)
                    .foregroundStyle(Color("WarmBrown"))
                CardCameraPreview(cardImage : item.image)
                VStack (spacing: 8){
                    Button() {
                        onCapture(item)
                        onDismiss()
                    }
                    label: {
                        Text("Create my card!")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .tracking(1)
                            .padding(8)
                    }
                    .buttonStyle(.glassProminent)
                    Button() {
                        onDismiss()
                    }
                    label : {
                        Text("Nah, retake")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .tracking(1)
                            .padding(8)
                    }
                }
            }
            .tint(Color("WarmBrown"))
        }
        .onAppear{
            SoundManager.instance.playSound(name: "TurningPage")
        }
    }
}
