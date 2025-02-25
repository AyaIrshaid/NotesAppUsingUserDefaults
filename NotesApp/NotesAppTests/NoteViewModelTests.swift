//
//  NoteViewModelTests.swift
//  NotesAppTests
//
//  Created by Aya Irshaid on 07/05/2024.
//

import Foundation
import Testing

@testable import NotesApp

@Suite actor NoteViewModelTests {

    func setUp() {
        UserDefaults.standard.set(nil, forKey: "TestSavedNotesArrayKey")
    }

    func tearDown() {
        UserDefaults.standard.set(nil, forKey: "TestSavedNotesArrayKey")
    }

    func testGetNotes() {
        // given
        let sut = NoteViewModel("TestSavedNotesArrayKey")
        addNote()

        // when
        sut.getNotes()

        // then
        #expect(sut.notes != [], "notes should not be empty")
        let note = sut.notes.first
        #expect(note?.title == "TestTitle", "note title should be: TestTitle")
        #expect(note?.message == "MessageText-Test", "note message should be: MessageText-Test")
    }

    func testDeleteNote() {
        // given
        let sut = NoteViewModel("TestSavedNotesArrayKey")
        addNote()
        sut.getNotes()
        let note = sut.notes.first
        #expect(note?.title == "TestTitle", "note title should be: TestTitle")

        // when
        sut.deleteNote(note!)

        // then
        #expect(sut.notes == [], "notes should be empty")
    }
}

private extension NoteViewModelTests {
    func addNote() {
        let noteTitle = "TestTitle"
        let noteMessage = "MessageText-Test"
        let savedNotesArrayKey = "TestSavedNotesArrayKey"
        let addNewNoteViewModel = AddNewNoteViewModel(savedNotesArrayKey: savedNotesArrayKey)
        addNewNoteViewModel.saveNewNote(title: noteTitle, messageText: noteMessage, {})
    }
}
