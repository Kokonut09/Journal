//
//  DateExtension.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/19/21.
//

import Foundation

extension Date {

    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        return formatter.string(from: self)
    }
}
