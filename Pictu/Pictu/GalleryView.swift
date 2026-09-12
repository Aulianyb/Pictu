//
//  GalleryView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

import SwiftUI

struct GalleryView : View {
    var body: some View {
        ScrollView(.vertical){
            ForEach(2...5, id: \.self) {_ in 
                cardItem
            }
        }
    }
    
    private var cardItem : some View {
        Rectangle()
            .frame(width: 150, height: 220)
    }
}

#Preview {
    GalleryView()
}
