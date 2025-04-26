//
//  NoteListView.swift
//  Notes App MVVM
//
//  Created by Ahmet Bostanci on 26.04.2025.
//

import SwiftUI

struct NoteListView: View {
    @State private var viewModel = NoteViewModel()
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var searchText = ""
    @State var isSeen = true
    @State var isCreate = false
    
    var body:  some View {
        NavigationStack {
            VStack {
                noteCards
                
                ZStack(alignment: .leading) {
                    Button(action: isCreateNote) {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black)
                            .clipShape(.circle)
                    }
                    Text("Notes")
                        .frame(maxWidth: .infinity)
                        .font(.title3.weight(.medium))
                    
                }
                .padding()
                .background(.gray.opacity(0.07))
            }
            .navigationDestination(isPresented: $isCreate) {
                CreateNoteView(viewModel: $viewModel)
                    .navigationBarBackButtonHidden()
            }
        }
    }
    
    var noteCards: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.notes) { note in
                    NoteCard(note: note)
                        .frame(height: 120)
                        .clipShape(.rect(cornerRadius: 12))
               
                }
            }
            .padding(12)
            .searchable(text: $searchText, isPresented: $isSeen, prompt: "Search")
        }
    }
    
    
    func isCreateNote() {
        isCreate = true
        
    }
}

#Preview {
    NoteListView()
}

