//
//  GalleryView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

import SwiftUI

struct GalleryView : View {
    var isCardEmpty : Bool = false
    let columns = [GridItem(.fixed(175)), GridItem(.fixed(175))]
    
    var body: some View {
        Group{
            if isCardEmpty {
                Text("Card Empty")
            } else {
                    ScrollView(.vertical){
                        LazyVGrid(columns: columns){
                            ForEach(0...4, id: \.self) {_ in
                                CardPreview()
                                
                            }
                        }
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("PICTU")
                    .font(Font.largeTitle.bold())  
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                NavigationLink(destination: CameraView()){
                    Text("Pull a card")
                        .padding(8)
                }.buttonStyle(.glassProminent)
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack{
        GalleryView()
    }
}
