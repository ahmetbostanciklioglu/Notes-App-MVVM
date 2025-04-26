//
//  DeveloperPreview.swift
//  Notes App MVVM
//
//  Created by Ahmet Bostanci on 27.04.2025.
//

import SwiftUI



class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() { }
    
    var notes = Note.notes
}


#if DEBUG
extension Note {
    static var notes: [Note] {
        [
            Note(color: [.cyan, .yellow, .orange, Color(.magenta) , .red], text: "")
        ]
    }
}
#endif

