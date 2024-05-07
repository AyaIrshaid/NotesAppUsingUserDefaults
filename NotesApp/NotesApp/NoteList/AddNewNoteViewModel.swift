//
//  AddNewNoteViewModel.swift
//  NotesApp
//
//  Created by Aya Irshaid on 07/05/2024.
//

import Foundation

struct AddNewNoteViewModel {
    let savedNotesArrayKey: String

    func saveNewNote(title: String, messageText: String, _ closure: () -> Void) {
        let defaults = UserDefaults.standard
        let newNote = Note(title: title.isEmpty ? "New Note" : title,
                           message: messageText)
        var newNoteArray = [newNote]

        if let data = defaults.data(forKey: savedNotesArrayKey) {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                newNoteArray.append(contentsOf: decoded)
            }
        }

        if let encoded = try? JSONEncoder().encode(newNoteArray) {
            defaults.set(encoded, forKey: savedNotesArrayKey)
        }

        closure()
    }
}
