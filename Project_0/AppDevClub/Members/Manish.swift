//
//  Manish.swift
//  AppDevClub
//
//  Created by Manish Chepuri on 9/9/26.
//


import SwiftUI

struct Manish: View {
    let name        = "Manish Chepuri"
    let major       = "Computer Science"
    let cardColor   = Color.red
    let funFact     = "I can eat a large pizza in one sitting"
    let imageName   = "Manish"  // Replace with your image name
    
    var body: some View {
        HStack(spacing: 16) {
            // Left VStack - text info
            VStack(spacing: 8) {
                Text(name)
                    .font(.title2.bold())
                Text(major)
                    .font(.subheadline)
                    .opacity(0.85)
                Text(funFact)
                    .font(.system(size:15))
                    .multilineTextAlignment(.center)
                    .opacity(1)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Right VStack - picture
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.white)
            }
            .frame(width: 100, height: 100)
            .background(Color.white.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .foregroundStyle(.white)
        .padding(24)
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(cardColor.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 8, y: 4)
        .padding(.horizontal)
    }
}

#Preview {
    Manish()
}
