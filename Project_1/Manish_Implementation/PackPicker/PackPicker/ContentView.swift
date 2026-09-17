//
//  ContentView.swift
//  PackPicker
//
//  Created by Manish Chepuri on 9/17/26.
//

import SwiftUI

struct ContentView: View {
    @State private var pick: Option? = nil
//    let food: [String] = ["Talley Market", "Fountain", "Clark", "Chipotle",
//                "Gym Tacos", "Raising Canes", "Chex Wings"]
    let food: [Option] = [
        Option("Talley Market"),
        Option("Cookout", emoji: "🍔", note: "Open past midnight"),
        Option("Fountain Dining Hall", emoji: "⛲️")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            if let pick {
                if let emoji = pick.emoji {
                    Text(emoji)
                        .font(.system(size: 60))
                }
                Text(pick.name)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                if let note = pick.note {
                    Text(note)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            } else {
                Text("Hit the button")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.secondary)
            }
            
            Button {
                pick = food.randomElement()
            } label: {
                Label("Pick for me", systemImage: "dice.fill")
                    .font(Font.headline)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
        .background(.yellow, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.1), radius: 10, y: 4)
    }
}

#Preview {
    ContentView()
}
