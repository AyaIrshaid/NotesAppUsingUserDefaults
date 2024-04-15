//
//  NoteDetailsView.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import SwiftUI

struct NoteDetailsView: View {
    var note: Note

    var body: some View {
        Text(note.message)
            .navigationTitle(note.title)
    }
}

#Preview {
    NoteDetailsView(note: Note(title: "Test Title", message: "Test Message"))
}
