//
//  NoteListView.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import SwiftUI

struct NoteListView: View {
    var notesArray: [Note] = []
    @ObservedObject var noteViewModel: NoteViewModel
    @State private var showShareSheet = false
    @State private var sharedNote: Note?
    
    let palette = Image(systemName: "list.bullet.circle")
        .symbolRenderingMode(.multicolor)
    var body: some View {
        NavigationView {
            List {
                ForEach(noteViewModel.notes, id: \.id) { note in
                    NavigationLink(destination: NoteDetailsView(note: note)) {
                        VStack(alignment: .leading) {
                            Text("\(Text(palette)) \(note.title)")
                                .foregroundColor(.blue)
                                .font(.title)
                            Text(note.returnFormattedDate())
                                .foregroundColor(.gray)
                                .font(.title3)
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button {
                                noteViewModel.editNote(note)
                            } label: {
                                Label("Edit", systemImage: "square.and.pencil")
                            }
                            .tint(.indigo)

                            Button {
                                self.sharedNote = note
                                self.showShareSheet = true
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .tint(.purple)

                            Button(role: .destructive) {
                                noteViewModel.deleteNote(note)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.pink)
                        }
                    }
                }
            }
            .sheet(isPresented: $showShareSheet, content: {
                ShareSheet(activityItems: [sharedNote?.message as Any])
            })
            .navigationTitle("Notes")
            .toolbar {
                NavigationLink(destination: AddNewNoteView()) {
                    Label("", systemImage: "plus")
                }
            }
            .onAppear {
                noteViewModel.getNotes()
            }
        }
    }
}

#Preview {
    NoteListView(noteViewModel: .init(SavedNotesArrayKey))
}
