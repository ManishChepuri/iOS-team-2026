import SwiftUI

// A struct is a custom type you invent: a blueprint that bundles related values.
struct Option: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
    let note: String?   // Optional, because most options won't have a note.

    init(_ name: String, emoji: String, note: String? = nil) {
        self.name = name
        self.emoji = emoji
        self.note = note
    }
}
