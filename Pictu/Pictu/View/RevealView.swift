//
//  RevealView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct RevealView : View {
    var body: some View {
        Group {
            ZStack {
                CardBig()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement:.topBarLeading) {
                Button{
                    
                } label: {
                    Image(systemName: "xmark")
                }
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                NavigationLink(destination: GalleryView()){
                    Text("Collect")
                        .padding(8)
                }.buttonStyle(.glassProminent)
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack{
        RevealView()
    }
}
