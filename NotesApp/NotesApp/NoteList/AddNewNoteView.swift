//
//  AddNewNoteView.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import SwiftUI

struct AddNewNoteView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var noteTitle: String = "Enter title"
    @State private var noteMessageText: String = "Enter note message"

    var body: some View {
        VStack(alignment: .leading) {
            TextEditor(text: $noteTitle)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .frame(height: 50)
            TextEditor(text: $noteMessageText)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            Spacer()
        }
        .background {
            Color.white
        }
        .toolbar {
            Button("Done") {
                saveNewNote(title: noteTitle, messageText: noteMessageText) {
                    dismiss()
                }
            }
        }
    }

    private func saveNewNote(title: String, messageText: String, _ clouser: () -> Void) {
        let defaults = UserDefaults.standard
        let newNote = Note(title: title.isEmpty ? "New Note" : title,
                           message: messageText)
        var newNoteArray = [newNote]

        if let data = defaults.data(forKey: "SavedNotesArray") {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                newNoteArray.append(contentsOf: decoded)
            }
        }

        if let encoded = try? JSONEncoder().encode(newNoteArray) {
            defaults.set(encoded, forKey: "SavedNotesArray")
        }

        clouser()
    }
}

#Preview {
    AddNewNoteView()
}
