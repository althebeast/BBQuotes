//
//  Quote.swift
//  BBQuotes
//
//  Created by Alperen Sarışan on 28.01.2024.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
