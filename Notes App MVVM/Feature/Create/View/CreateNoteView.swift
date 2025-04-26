//
//  CreateNoteView.swift
//  Notes App MVVM
//
//  Created by Ahmet Bostanci on 27.04.2025.
//

import SwiftUI

struct CreateNoteView: View {
    @Binding var viewModel: NoteViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(viewModel.selectedColor)
                    .ignoresSafeArea()
                   
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                    .foregroundStyle(.white)
                    .font(.body.weight(.medium))
                    .overlay(
                        Group {
                            if viewModel.text.isEmpty {
                                placeholder
                            }
                        }
                        ,
                        alignment: .topLeading
                    )
            }
            
            
            HStack {
                Button {
                    viewModel.text = ""
                    dismiss()
                } label: {
                    Image(systemName: "trash.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.red)
                }

                
                Spacer()
                
                ForEach(Preview.dev.colors.color.indices, id: \.self) { index in
                    Circle()
                        .frame(width: viewModel.selectedColor == Preview.dev.colors.color[index] ?  32: 24, height: viewModel.selectedColor == Preview.dev.colors.color[index] ?  32: 24)
                        .foregroundStyle(Preview.dev.colors.color[index])
                        .overlay {
                            if viewModel.selectedColor == Preview.dev.colors.color[index] {
                                Circle()
                                    .stroke(.black, lineWidth: 1.5)
                            }
                        }
                        .onTapGesture {
                            viewModel.selectedColor = Preview.dev.colors.color[index]
                        }
                    
                    if index != 4 {
                        Spacer()
                    }
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.black)
                }

            }
            .padding()
            .background(.gray.opacity(0.07))
        }
    }
    
    var placeholder: some View {
        Text("Lorem ipsum").padding([.leading], 5).padding([.top], 8).font(.body.weight(.medium)).foregroundStyle(.secondary)
    }
}

#Preview {
    CreateNoteView(viewModel: .constant(NoteViewModel()))
}
