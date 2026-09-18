//
//  CardBig.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI


var foilLayer: some View {
    LinearGradient(
        colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct CardBig: View {
    var shownCard : TradingCard
    var cardImage : UIImage
    @State var isRevealing : Bool = false
    @Binding var isShowing : Bool
    
    @State private var dragOffset: CGSize = .zero
    @GestureState private var isDragging = false
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing:16){
                ZStack(alignment: .top){
                    Image(uiImage: cardImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:286, height:260)
                        .clipped()
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("WarmWhite"), lineWidth: 4)
                        )
                        .padding(.top, 10)
                    
                    HStack{
                        Text(shownCard.title.uppercased())
                            .font(.system(
                                size: 16,
                                weight: .bold,
                                design:.rounded))
                            .tracking(1)
                        Spacer()
                    }
                    .frame(width:265)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color("WarmWhite"))
                    .cornerRadius(.infinity)
                }
                .padding(.top, 20)
                VStack(alignment: .leading, spacing:4){
                    Text(shownCard.abilityName.uppercased())
                        .font(.system(
                            size: 14,
                            weight: .bold,
                            design:.rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .tracking(1)
                    Text(shownCard.abilityDescription)
                        .font(.system(
                            size: 12,
                            weight: .light,
                            design:.rounded))
                        .tracking(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                .padding(12)
                .frame(width:286, height:115)
                .background(Color("Cream"))
                .cornerRadius(8)
            }
            .padding(30)
            .background(Color("Beige"))
            .frame(width: 326, height: 460)
            .cornerRadius(20)
            .foregroundStyle(.warmBrown)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Cream"), lineWidth: 5)
            )
            UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: 16,
                bottomTrailingRadius: 16,
                topTrailingRadius: 0
            )
            .fill(Color("Cream"))
            .frame(width: 135, height:20)
            SealShape()
                .fill(Color(shownCard.type.typeColor))
                .frame(width: 82, height:82)
                .overlay(
                    Image(systemName: shownCard.type.symbolName)
                        .font(.system(size: 36))
                        .foregroundColor(Color(shownCard.type.symbolColor))
                        .rotationEffect(.degrees(15))
                )
                .offset(x:115, y:20)
            foilLayer
                .frame(width: 326 * 2.25, height: 460 * 2.25) // oversized so drag never reveals an edge
                .rotationEffect(.degrees(Double(dragOffset.width) / 8))
                .offset(x: dragOffset.width * 0.5, y: dragOffset.height * 0.5)
                .frame(width: 326, height: 460)   // fixed window — this stays put
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .blendMode(.hardLight)
                .opacity(shownCard.rarity != .common ? 0.15 : 0)
                .allowsHitTesting(false)
            Image("ShineHolo")
                .resizable(resizingMode: .tile)
                .frame(width: 326 * 4, height: 460 * 4) // oversized so drag never reveals an edge
                .scaleEffect(0.5)
                .frame(width: 326, height: 460)   // fixed window — this stays put
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .tint(.artifactText)
                .hueRotation(.degrees(Double(dragOffset.width + dragOffset.height) * 1.5))
                .blendMode(.hardLight)
                .opacity(shownCard.rarity == .prism ? 0.5 : 0.0)
                .allowsHitTesting(false)
        }
        .compositingGroup()
        .scaleEffect(isRevealing ? 1.0 : 0.0)
        .rotation3DEffect(
            .degrees(Double(dragOffset.width/10))
            ,axis: (x:0, y:1, z:0)
        )
        .rotation3DEffect(
            .degrees(Double(dragOffset.height/10))
            ,axis: (x:1, y:0, z:0),
            perspective: 0.5
        )
        .gesture(
            DragGesture()
                .onChanged{
                    value in
                    let maxOffset: CGFloat = 150
                    dragOffset = CGSize(
                        width: min(max(value.translation.width, -maxOffset), maxOffset),
                        height: min(max(value.translation.height, -maxOffset), maxOffset)
                    )
                }
                .onEnded {
                    _ in withAnimation(.spring(response: 0.5, dampingFraction: 0.6)){
                        dragOffset = .zero
                    }
            }
        )
        .onChange(of: isShowing) {
            if isShowing {
                withAnimation(.spring(duration: 0.3, bounce: 0.55).delay(0.3)) {
                    isRevealing = true
                }
            }
        }
    }
}
