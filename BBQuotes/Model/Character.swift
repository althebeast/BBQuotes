//
//  Character.swift
//  BBQuotes
//
//  Created by Alperen Sarışan on 28.01.2024.
//

import Foundation

struct Character: Decodable {
    
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
}
