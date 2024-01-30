//
//  Constants.swift
//  BBQuotes
//
//  Created by Alperen Sarışan on 29.01.2024.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
