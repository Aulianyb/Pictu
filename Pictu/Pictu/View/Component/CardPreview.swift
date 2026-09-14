//
//  CardPreview.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 13/09/26.
//

import SwiftUI

struct CardPreview: View {
    var body: some View {
        NavigationLink(destination: DetailView()) {
            Image("TestCard")
                .resizable()
                .scaledToFit()
                .frame(width: 175, height: 242)
        }
    }
}
