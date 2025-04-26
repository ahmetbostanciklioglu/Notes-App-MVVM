//
//  NoteDetailBackgroundColorList.swift
//  Notes App MVVM
//
//  Created by Ahmet Bostanci on 27.04.2025.
//

import SwiftUI


struct Note: Identifiable {
    var id: UUID = UUID()
    var color: [Color]
    var text: String
}
