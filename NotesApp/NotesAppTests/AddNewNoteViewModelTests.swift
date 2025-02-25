//
//  AddNewNoteViewModelTests.swift
//  NotesAppTests
//
//  Created by Aya Irshaid on 07/05/2024.
//

import Foundation
import Testing

@testable import NotesApp

@Suite actor AddNewNoteViewModelTests {

    private var sut: AddNewNoteViewModel?

    func setUp() {
        UserDefaults.standard.set(nil, forKey: "TestSavedNotesArrayKey")
    }

    func testAddNewNote() {
        // given
        let noteTitle = "TestTitle"
        let noteMessage = "MessageText-Test"
        let savedNotesArrayKey = "TestSavedNotesArrayKey"
        sut = AddNewNoteViewModel(savedNotesArrayKey: savedNotesArrayKey)

        // when
        sut?.saveNewNote(title: noteTitle, messageText: noteMessage, {})

        // then
        let data = UserDefaults.standard.data(forKey: savedNotesArrayKey)
        #expect(data != nil) // "data should not be nil"
        let notes = try? JSONDecoder().decode([Note].self, from: data!)
        #expect(notes != nil) // "notes should not be nil"
        let note = notes?.first
        #expect(note?.title == noteTitle)
        #expect(note?.message == noteMessage)
    }
}
