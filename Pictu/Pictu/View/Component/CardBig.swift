//
//  CardBig.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct CardBig: View {
    var shownCard : TradingCard
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing:16){
                ZStack(alignment: .top){
                    Image("TestAnimal")
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
                        Text("WHISKEY")
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
                    Text("WARM BREW")
                        .font(.system(
                            size: 14,
                            weight: .bold,
                            design:.rounded))
                        .tracking(1)
                    Text("Exhaust this Land to gain 1 Mana of any color. Friendly Creatures summoned this turn gain +1 Attack and +1 Speed as long as they remain on the battlefield.")
                        .font(.system(
                            size: 12,
                            weight: .light,
                            design:.rounded))
                        .tracking(1)
                }
                .padding(12)
                .background(Color("Cream"))
                .cornerRadius(8)
            }
            .padding()
            .background(Color("Beige"))
            .frame(width: 326)
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
            .frame(width: 135, height:15)
            //                .offset(y: -29)
            SealShape()
                .fill(Color.pink)
                .frame(width: 200, height: 200)
                .overlay(
                    Image(systemName: "house.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.pink.opacity(0.7))
                )
        }
    }
}
