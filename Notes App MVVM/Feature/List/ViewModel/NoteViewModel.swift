//
//  NoteViewModel.swift
//  Notes App MVVM
//
//  Created by Ahmet Bostanci on 27.04.2025.
//

import SwiftUI

@Observable
class NoteViewModel {
    
    var notes: [Note] = []
    
    
    var text: String = ""
    var selectedColor: Color = .cyan
    
    
}
