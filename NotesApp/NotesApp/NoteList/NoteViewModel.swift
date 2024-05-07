//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import UIKit

class NoteViewModel: ObservableObject {
    @Published private(set) var notes: [Note] = []

    let savedNotesArrayKey: String

    init(_ savedNotesArrayKey: String) {
        self.savedNotesArrayKey = savedNotesArrayKey
        getNotes()
    }

    func getNotes() {
        if let data = UserDefaults.standard.data(forKey: savedNotesArrayKey) {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decoded
            }
        }
    }

    func deleteNote(_ note: Note) {
        print("delete")
        notes.removeAll { item in
            item.id == note.id
        }
        saveNewNotesArray()
    }

    func editNote(_: Note) {
        print("Edit")
    }

    private func saveNewNotesArray() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: savedNotesArrayKey)
        }
    }
}
