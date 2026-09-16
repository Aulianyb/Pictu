//
//  DetailView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            Color("WarmWhite")
            .ignoresSafeArea()
            Image("TestCard")
                .resizable()
                .scaledToFit()
                .frame(width: 326, height: 452)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .tint(Color("WarmBrown"))
            }
        }
    }
}

#Preview {
    NavigationStack{
        DetailView()
    }
}
