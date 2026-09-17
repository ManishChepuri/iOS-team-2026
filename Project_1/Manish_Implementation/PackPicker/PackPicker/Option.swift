//
//  File.swift
//  PackPicker
//
//  Created by Manish Chepuri on 9/17/26.
//

import SwiftUI


struct Option: Identifiable {
    let id = UUID()
    var name: String
    var emoji: String?
    var note: String?
    
    init(_ name: String, emoji: String? = nil, note: String? = nil) {
        self.name = name
        self.emoji = emoji
        self.note = note
    }
}
