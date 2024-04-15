//
//  NewDateFormatter.swift
//  NotesApp
//
//  Created by Aya Irshaid on 16/11/2023.
//

import UIKit

struct NewDateFormatter {
    static let shared = NewDateFormatter()

    var dateFormatter: DateFormatter {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-MM-yyyy"
        return dateformatter
    }

    func returnFormattedStringForTime(from dateTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "en_JO")
        return dateFormatter.string(from: dateTime)
    }

    func returnFormattedStringForDate(from dateTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "en_JO")
        return dateFormatter.string(from: dateTime)
    }
}
