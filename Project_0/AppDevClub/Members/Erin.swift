import SwiftUI

struct Erin: View {
    let name        = "Erin Xiang"
    let major       = "Computer Science"
    let cardColor   = Color.blue
    let funFact     = "I like to draw :-)"
    let year        = "Junior"
    let imageName   = "spiderman"  // Replace with your image name
    
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
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .opacity(0.75)
                Text(year)
                    .font(.caption)
                    .opacity(0.85)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Right VStack - picture
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
            }
            .frame(width: 100, height: 120)
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
    Erin()
}
