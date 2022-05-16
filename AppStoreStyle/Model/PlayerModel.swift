//
//  PlayerModel.swift
//  BearNameSpace
//
//  Created by Валерий Игнатьев on 15.05.22.
//

import SwiftUI

//MARK: - PlayerModel

struct PlayerModel: Identifiable, Equatable {
    
    //MARK: Properties
    
    var id: UUID
    var firstName: String
    var lastName: String
    var avatar: String
    var number: Int
    var teamLogo: String
    var colorTeam: Color
    
    //MARK: Initializer
    
    init(_ firstName: String,
         _ lastName: String,
         _ avatar: String,
         _ number: Int,
         _ teamLogo: String,
         _ colorTeam: Color) {
        
        id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.number = number
        self.teamLogo = teamLogo
        self.colorTeam = colorTeam
    }
}
