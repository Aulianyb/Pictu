//
//  FailedView.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 16/09/26.
//

import SwiftUI

struct FailedView : View {
    let message : String
    var body: some View {
        ZStack {
            Color("WarmWhite")
                .ignoresSafeArea()
            Text(message)
        }
        .navigationBarBackButtonHidden(true)
    }
}
