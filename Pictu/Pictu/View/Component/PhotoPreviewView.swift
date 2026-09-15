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
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Retake") {
                    onDismiss()
                }
                .padding()
                
                Spacer()
                
                Button("Save") {
                    UIImageWriteToSavedPhotosAlbum(item.image, nil, nil, nil)
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
