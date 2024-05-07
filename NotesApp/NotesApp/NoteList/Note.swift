//
//  Note.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import Foundation
import UIKit

struct Note: Codable {
    var id: String = UUID().uuidString
    let title: String
    let message: String
    var creationDate: Date = .now
}

extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Note {
    func returnFormattedDate() -> String {
        var formattedDate = ""
        let calendar = Calendar(identifier: .gregorian)
        if calendar.isDateInToday(creationDate) {
            formattedDate = NewDateFormatter.shared.returnFormattedStringForTime(from: creationDate)
        } else if calendar.isDateInYesterday(creationDate) {
            formattedDate = "Yesterday"
        } else {
            formattedDate = NewDateFormatter.shared.returnFormattedStringForDate(from: creationDate)
        }
        return formattedDate
    }
}
