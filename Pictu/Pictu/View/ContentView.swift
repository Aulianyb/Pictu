//
//  ContentView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack {
            GalleryView()
        }
        .tint(Color("Brown"))
    }
}

#Preview {
    ContentView()
}
