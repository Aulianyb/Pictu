//
//  CardBig.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 14/09/26.
//

import SwiftUI

struct CardBig: View {
    var body: some View {
        Image("TestCard")
            .resizable()
            .scaledToFit()
            .frame(width: 326, height: 452)
    }
}
