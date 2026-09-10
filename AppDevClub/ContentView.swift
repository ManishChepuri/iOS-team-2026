//
//  ContentView.swift
//  AppDevClub
//
//  Created by Manish Chepuri on 9/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("iOS Team")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                // Manish()
                // One Line per member
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    ContentView()
}
