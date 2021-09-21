//
//  Player.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 04.09.2021.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID.init()
    var firstName: String
    var lastName: String
    var team: String
    var number: Int
    var colorTeam: Color
}

var players: [Player] = [
    Player(firstName: "Giannis", lastName: "Antetokounmpo", team: "Bucks", number: 34, colorTeam: .bucks),
    Player(firstName: "Jimmy", lastName: "Butler", team: "Heat", number: 22, colorTeam: .heat)
]
