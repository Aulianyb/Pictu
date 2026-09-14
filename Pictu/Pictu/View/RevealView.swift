//
//  RevealView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct RevealView : View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("WarmWhite")
            .ignoresSafeArea()
            CardBig()
        }
        .background(Color("WarmWhite"))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement:.topBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(Color("WarmBrown"))
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                NavigationLink(destination: GalleryView()){
                    Text("Collect")
                        .padding(8)
                }
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .buttonStyle(.glassProminent)
                .tint(Color("WarmBrown"))
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
