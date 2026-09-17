//
//  Joshua.swift
//  AppDevClub
//
//  Created by Joshua Michael on 9/10/26.
//


import SwiftUI

struct Joshua: View {
    let name        = "Joshua Michael"
    let major       = "Computer Science"
    let emoji       = "🫩"
    let collegeYear = "Junior"
    let cardColor   = Color.blue
    let funFact     = "I like food"
    let imageName   = "Joshua"  // Replace with your image name
    
    var body: some View {
        HStack(spacing: 16) {
            // Left VStack - text info
            VStack(spacing: 8) {
                Text(name)
                    .font(.title2.bold())
                Text(major)
                    .font(.subheadline)
                    .opacity(0.85)
                Text(collegeYear)
                    .font(.system(size:10))
                    .multilineTextAlignment(.center)
                    .opacity(1)
                    .bold()
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
    Joshua()
}

