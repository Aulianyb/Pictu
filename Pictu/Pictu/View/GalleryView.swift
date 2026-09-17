//
//  GalleryView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 10/09/26.
//

import SwiftUI
import SwiftData

struct GalleryView : View {
    @Query(sort: \TradingCard.title) private var cards: [TradingCard]
    let columns = [GridItem(.fixed(175)), GridItem(.fixed(175))]
    
    var body: some View {
        ZStack{
            Color("WarmWhite")
                .ignoresSafeArea()
            if cards.isEmpty {
                Text("You don’t have any card yet,\npull a card!")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .tracking(1)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Cream"))
            } else {
                ScrollView(.vertical){
                    LazyVGrid(columns: columns){
                        ForEach(cards) { card in
                            CardPreview(shownCard: card)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("☆*:.｡ PICTU ｡.:*☆")
                    .tracking(1)
                    .font(.system(size: 30, weight: .black, design: .rounded))
                    .foregroundStyle(Color("WarmBrown"))
                    .padding(.top)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                NavigationLink(destination: CardFlowManager().tint(Color("WarmBrown"))){
                    Text("Pull a card")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .tracking(1)
                        .padding(8)
                }
                .buttonStyle(.glassProminent)
                .tint(Color("WarmBrown"))
                .simultaneousGesture(TapGesture().onEnded {
                    SoundManager.instance.playSound(name : "UIBloop")
                })
//                NavigationLink(destination: TestView().tint(Color("WarmBrown"))){
//                    Text("Testing page")
//                        .font(.system(size: 17, weight: .medium, design: .rounded))
//                        .tracking(1)
//                        .padding(8)
//                }
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
