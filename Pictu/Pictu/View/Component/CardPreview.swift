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
            Rectangle()
                .foregroundStyle(Color(.systemBlue))
                .frame(width: 175, height: 242)
                .cornerRadius(20)
        }
    }
}
