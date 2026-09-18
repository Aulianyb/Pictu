//
//  CardPreview.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 13/09/26.
//

import SwiftUI

struct CardPreview: View {
    @State private var hueRotationAngle: Double = 0
    
    var shownCard : TradingCard
    var body: some View {
        NavigationLink(destination: DetailView(shownCard: shownCard)) {
            ZStack(alignment: .top){
                VStack(spacing:16){
                    ZStack(alignment: .bottom){
                        Image(uiImage: CardImageStore.load(fileName: shownCard.imageFileName) ?? UIImage(systemName: "photo")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:175, height:250)
                            .clipped()
                            .cornerRadius(8)
                            .padding(.top, 10)
                        HStack{
                            Text(shownCard.title.uppercased())
                                .font(.system(
                                    size: 12,
                                    design:.rounded))
                                .tracking(1)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color("WarmWhite"))
                        .cornerRadius(.infinity)
                        .padding(.bottom, 20)
                    }
                }
                .padding(30)
                .background(Color("Beige"))
                .frame(width: 175, height: 243)
                .cornerRadius(20)
                .foregroundStyle(.warmBrown)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("Cream"), lineWidth: 3)
                )
                UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 16,
                    bottomTrailingRadius: 16,
                    topTrailingRadius: 0
                )
                .fill(Color("Cream"))
                .frame(width: 72, height:14)
                SealShape()
                    .fill(Color(shownCard.type.typeColor))
                    .frame(width: 55, height:55)
                    .overlay(
                        Image(systemName: shownCard.type.symbolName)
                            .font(.system(size: 26))
                            .foregroundColor(Color(shownCard.type.symbolColor))
                            .rotationEffect(.degrees(15))
                    )
                    .offset(x:55, y:10)
            }
            .compositingGroup()
            .overlay{
                foilLayer
                    .frame(width: 175, height: 243)
                    .cornerRadius(20)
                    .hueRotation(.degrees(hueRotationAngle))
                    .blendMode(.softLight)
                    .opacity(shownCard.rarity == .common ? 0.0 : 0.7)
                Image("ShineHolo")
                    .resizable(resizingMode: .tile)
                    .frame(width: 175 * 2, height: 243 * 2)
                    .scaleEffect(0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .tint(.artifactText)
                    .hueRotation(.degrees(hueRotationAngle) * 1.5)
                    .blendMode(.hardLight)
                    .opacity(shownCard.rarity == .prism ? 0.5 : 0.0)
                    .allowsHitTesting(false)
            }
        }
        .simultaneousGesture(TapGesture().onEnded {
            SoundManager.instance.playSound(name : "UIBloop")
        })
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
    
    
    CardPreview(shownCard: card)
}
