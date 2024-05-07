//
//  AddNewNoteViewModelTests.swift
//  NotesAppTests
//
//  Created by Aya Irshaid on 07/05/2024.
//

import XCTest

@testable import NotesApp

final class AddNewNoteViewModelTests: XCTestCase {

    private var sut: AddNewNoteViewModel?

    override class func setUp() {
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
        XCTAssertNotNil(data, "data should not be nil")
        let notes = try? JSONDecoder().decode([Note].self, from: data!)
        XCTAssertNotNil(notes, "notes should not be nil")
        let note = notes?.first
        XCTAssertEqual(note?.title, noteTitle, "Note title should be \(noteTitle)")
        XCTAssertEqual(note?.message, noteMessage, "Note message should be \(noteMessage)")
    }
}
