//
//  CardCameraPreview.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 17/09/26.
//

import SwiftUI

struct CardCameraPreview: View {
    var cardImage : UIImage
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
                        Text("")
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
                    Text("")
                        .font(.system(
                            size: 14,
                            weight: .bold,
                            design:.rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .tracking(1)
                    Text("")
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
                .fill(Color("WarmBrown"))
                .frame(width: 82, height:82)
                .overlay(
                    Image(systemName: "questionmark")
                        .font(.system(size: 36))
                        .foregroundColor(Color("WarmWhite"))
                        .rotationEffect(.degrees(15))
                )
                .offset(x:115, y:20)
        }
    }
}
