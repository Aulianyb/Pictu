//
//  DetailView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var shownCard : TradingCard
    @State private var isShowing : Bool = true
    
    var body: some View {
        ZStack{
            Color("WarmWhite")
            .ignoresSafeArea()
            CardStatic(shownCard: shownCard, cardImage: CardImageStore.load(fileName: shownCard.imageFileName) ?? UIImage(systemName: "photo")!)
                .shadow(color: Color("WarmBrown").opacity(0.2), radius: 10, x: 0, y: 0)
                .padding(.bottom,40)
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
    
//    NavigationStack{
        DetailView(shownCard: card)
//    }
}
