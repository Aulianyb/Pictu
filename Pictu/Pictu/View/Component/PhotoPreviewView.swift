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
        VStack(spacing: 0) {
            HStack {
                Button("Retake") {
                    onDismiss()
                }
                .padding()
                
                Spacer()
                
                Button("Create Card") {
                    onCapture(item)
                    onDismiss()
                }
                .padding()
            }
            .background(.ultraThinMaterial)
            
            Image(uiImage: item.image)
                .resizable()
                .scaledToFit()
            
            Spacer()
        }
    }
}
