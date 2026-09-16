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
    let shownCard : TradingCard
    let item : IdentifiableImage
    
    var body: some View {
        ZStack {
            Color("WarmWhite")
            .ignoresSafeArea()
            CardBig(shownCard: shownCard)
//            VStack{
//                Image(uiImage : item.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200)
//                Text(shownCard.imageFileName)
//                Text(shownCard.title)
//                Text(shownCard.type.displayName)
//                Text(shownCard.rarity.displayName)
//                Text(shownCard.abilityName)
//                Text(shownCard.abilityDescription)
//            }
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
                .simultaneousGesture(TapGesture().onEnded {
                    print("I'm being triggered")
                    saveCard(context: context, image: item.image, fileName: shownCard.imageFileName, card: shownCard)
                })
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .buttonStyle(.glassProminent)
                .tint(Color("WarmBrown"))
                Spacer()
            }
        }
    }
}

#Preview {
    let card = TradingCard(
        title: "title here",
        type: .animal,
        rarity: .prism,
        abilityName: "abilityName here",
        abilityDescription: "abilityDescription here",
        imageFileName: "uhh uhh imageName"
    )
    
    // Safely unwrap using a standard SF Symbol as a fallback
    let safeImage = UIImage(systemName: "TestAnimal") ?? UIImage(systemName: "photo")!
    let imagePlaceholder = IdentifiableImage(image: safeImage)
    
    return NavigationStack {
        RevealView(shownCard: card, item: imagePlaceholder)
    }
}
