//
//  NoteCard.swift
//  Notes App MVVM
//
//  Created by Ahmet Bostanci on 27.04.2025.
//

import SwiftUI

struct NoteCard: View {
    let note: Note
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            Text(note.text)
        }
        
    }
}

#Preview {
    NoteCard(note: DeveloperPreview.instance.notes[0])
}
