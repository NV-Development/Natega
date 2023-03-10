//
//  Date+Extensions.swift
//  Natega
//
//  Created by Nikola Veljanovski on 21.12.22.
//

import Foundation
extension Date {
    // This date format is needed for the url.
    var formattedDateForAPI: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: Date())
    }
}
