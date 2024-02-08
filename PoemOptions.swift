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
    let source: String
    let illustration: String
    let poem: [String]
    let translation: [String]
    
    let id = UUID()
    
    static let listOfPoems: [PoemOption] = [
        PoemOption(title: "When she speaks", source: "Falenas, 1870", illustration: "brazilianSky", poem: ["Quando ela fala, parece", "Que a voz da brisa se cala;", "Talvez um anjo emudece", "Quando ela fala."], translation: ["When she speaks, it seems", "That the voice of the breeze is silent;", "Perhaps an angel becomes silent", "when she speaks."]),
        
        PoemOption(title: "The two horizons", source: "Crisálidas, 1864", illustration: "morretesBrazil", poem: ["Um horizonte, a saudade", "Do que não há de voltar;", "Outro horizonte, a esperança", "Dos tempos que hão de chegar."], translation: ["One horizon, the longing", "For what will never return;", "Another horizon, the hope", "Of the times that will come."]),
        
        PoemOption(title: "To a lady who asked me for verses", source: "Poesias completas, 1938", illustration: "saoPauloBrazil", poem: ["Pensa em ti mesma, acharás", "Melhor poesia,", "Viveza, graça, alegria,", "Doçura e paz."], translation: ["Think about yourself, you will find", "Better poetry,", "Liveliness, grace, joy,", "Sweetness and peace."]),
        
        PoemOption(title: "Brazilian National Anthem", source: "O Constitucional, 1867.", illustration: "salvadorBrazil", poem: ["Enche o peito brasileiro", "Doce luz, alta fervor,", "Ante o dia abençoado", "Do seu grande Imperador."], translation: ["Fills the Brazilian chest", "Sweet light, high fervor,", "Before the blessed day", "Of your great Emperor."]),

    ]

}
