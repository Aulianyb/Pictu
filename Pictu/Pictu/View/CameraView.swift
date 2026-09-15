//
//  CameraView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 13/09/26.
//

import SwiftUI
import AVFoundation
import AVKit

struct CameraView: View {
    @StateObject private var cameraManager = CameraManager()
    
    var body: some View {
//        VStack{
//            Text("this is the camera view")
//            Spacer()
//            //TEMPORARTY
//            NavigationLink(destination: RevealView()) {
//                Text("Take a picture")
//            }
//        }
        ZStack{
            if cameraManager.authorizationStatus == .authorized {
                CameraPreview(session: cameraManager.session, cameraManager: cameraManager)
                    .ignoresSafeArea()
            } else {
                // Permission not granted
                VStack(spacing: 20) {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.gray)
                    
                    Text("Camera Access Required")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    if cameraManager.authorizationStatus == .denied {
                        Text("Please enable camera access in Settings")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Button("Open Settings") {
                            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(settingsURL)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            
            VStack {
                Spacer()
                Button {
                    cameraManager.capturePhoto()
                } label: {
                    Circle()
                        .strokeBorder(.white, lineWidth: 3)
                        .frame(width: 70, height: 70)
                        .overlay {
                            Circle()
                                .fill(.white)
                                .frame(width: 60, height: 60)
                        }
                }
                .padding(.bottom, 40)
            }
            .sheet(item: $cameraManager.capturedImage) { image in
                // Wrap UIImage in Identifiable for sheet binding
                PhotoPreviewView(item: image, onDismiss: {
                    cameraManager.capturedImage = nil
                })
            }
        }
        .onAppear {
            cameraManager.checkAuthorization()
        }
    }
}

