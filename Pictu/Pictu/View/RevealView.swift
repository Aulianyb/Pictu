//
//  RevealView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI
import SwiftData

struct RevealView : View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var isShowing : Bool = false
    let shownCard : TradingCard
    let item : IdentifiableImage
    
    var body: some View {
        ZStack {
            Color("WarmWhite")
            .ignoresSafeArea()
            RevealCard(isShowing: $isShowing)
            CardBig(shownCard: shownCard, cardImage: item.image, isShowing: $isShowing)
                .shadow(color: Color("WarmBrown").opacity(0.2), radius: 10, x: 0, y: 0)
            Text("TAP TO REVEAL")
                .font(.system(size: 24, design: .rounded))
                .tracking(2)
                .foregroundStyle(Color("Cream"))
                .offset(y:200)
                .opacity(isShowing ? 0 : 1)
        }
        .onTapGesture {
            isShowing = true
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
                .disabled(!isShowing)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                NavigationLink(destination: GalleryView()){
                    Text("Collect")
                        .padding(8)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    saveCard(context: context, image: item.image, fileName: shownCard.imageFileName, card: shownCard)
                })
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .buttonStyle(.glassProminent)
                .tint(Color("WarmBrown"))
                .disabled(!isShowing)
                Spacer()
            }
        }
    }
}

#Preview {
    let card = TradingCard(
        title: "title here",
        type: .object,
        rarity: .prism,
        abilityName: "abilityName here",
        abilityDescription: "Exhaust this Land to gain 1 Mana of any color. Friendly Creatures summoned this turn gain +1 Attack and +1 Speed as long as they remain on the battlefield.",
        imageFileName: "uhh uhh imageName"
    )
    
    // Safely unwrap using a standard SF Symbol as a fallback
    let safeImage = UIImage(systemName: "TestAnimal") ?? UIImage(systemName: "photo")!
    let imagePlaceholder = IdentifiableImage(image: safeImage)
    
    return NavigationStack {
        RevealView(shownCard: card, item: imagePlaceholder)
    }
}
