import SwiftUI

// An enum is "one of a fixed set of things."
// Add a fourth case and every switch below lights up red — that's the compiler
// telling you exactly which places you still need to update.
enum Category: String, CaseIterable, Identifiable {
    case food = "Food"
    case study = "Study"
    case random = "Random"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .food:  "fork.knife"
        case .study: "book.closed.fill"
        case .random: "flame.fill"
        }
    }

    var tint: Color {
        switch self {
        case .food:  .orange
        case .study: .blue
        case .random: .red
        }
    }

    var options: [Option] {
        switch self {
        case .food:
            [
                Option("Talley Market",   emoji: "🍔", note: "Absolute chaos at noon"),
                Option("Fountain Dining", emoji: "🍕"),
                Option("Clark Hall",      emoji: "🥗", note: "Surprisingly good"),
                Option("Port City Java",  emoji: "☕️", note: "Coffee is a food group"),
                Option("Cookout",         emoji: "🥤", note: "Worth the drive")
            ]
        case .study:
            [
                Option("Hunt Library",     emoji: "📚", note: "Go for the bookBot"),
                Option("D.H. Hill",        emoji: "🏛️"),
                Option("Talley 4th floor", emoji: "🛋️", note: "Couches. Danger."),
                Option("Your own desk",    emoji: "🪑", note: "Be honest, you won't")
            ]
        case .random:
            [
                Option("Go to Carmichael",         emoji: "🏋️"),
                Option("Nap immediately",          emoji: "😴", note: "Correct answer"),
                Option("Start a side project",     emoji: "💻", note: "You have three unfinished"),
                Option("Touch grass on the Court", emoji: "🌱")
            ]
        }
    }
}
