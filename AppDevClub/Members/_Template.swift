import SwiftUI

struct _Template: View {
    let name        = "{Your Name}"
    let major       = "{Your Major}"
    let emoji       = "{Insert Emoji}"
    let cardColor   = Color.red
    let funFact     = "One fun fact about you"
    let imageName   = "person.fill"  // Replace with your image name
    
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
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Right VStack - picture
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 48))
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
    _Template()
}
