//
//  CameraView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 13/09/26.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        VStack{
            Text("this is the camera view")
            Spacer()
            //TEMPORARTY
            NavigationLink(destination: RevealView()) {
                Text("Take a picture")
            }
        }
    }
}

