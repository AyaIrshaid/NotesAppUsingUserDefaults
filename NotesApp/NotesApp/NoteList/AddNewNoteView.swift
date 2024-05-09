//
//  AddNewNoteView.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import SwiftUI

struct AddNewNoteView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var noteTitle: String = ""
    @State private var noteMessageText: String = "Enter note message"

    var viewModel: AddNewNoteViewModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("", text: $noteTitle, prompt: Text("Enter title")
                .foregroundColor(.gray))
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .frame(height: 50)
            TextEditor(text: $noteMessageText)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .onTapGesture {
                    noteMessageText = noteMessageText == "Enter note message" ? "" : noteMessageText
                }
            Spacer()
        }
        .background {
            Color.white
        }
        .toolbar {
            Button("Done") {
                viewModel.saveNewNote(title: noteTitle, messageText: noteMessageText) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddNewNoteView(viewModel: .init(savedNotesArrayKey: SavedNotesArrayKey))
}
