//
//  PoemOptions.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 31/01/24.
//

import Foundation
import SwiftUI

struct PoemOption: Identifiable {
    
    let title: String
    let author: String
    let icon: String
    let preview: String
    
    let id = UUID()
    
    static let listOfPoems: [PoemOption] = [
        PoemOption(title: "The Blue Boy", author: "Cecília Meireles", icon: "chevron.left", preview: "O menino quer um burrinho"),
        PoemOption(title: "The Blue Boy", author: "Cecília Meireles", icon: "chevron.left", preview: "O menino quer um burrinho"),
        PoemOption(title: "The Blue Boy", author: "Cecília Meireles", icon: "chevron.left", preview: "O menino quer um burrinho"),
        PoemOption(title: "The Blue Boy", author: "Cecília Meireles", icon: "chevron.left", preview: "O menino quer um burrinho"),

    ]

}
