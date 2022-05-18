//
//  NSPlayerVM.swift
//  BearNameSpace
//
//  Created by Валерий Игнатьев on 15.05.22.
//

import SwiftUI

//MARK: - NamespacePlayerVM

final class NSPlayerVM: ObservableObject {
    
    //MARK: Properties
    
    @Published var players: [NSPlayerModel] = [
        NSPlayerModel("Luka", "Doncic", "LukaDoncic", 77, "DallasMavericks", Color(red: 0.0/255.0, green: 100.0/255.0, blue: 177.0/255.0)),
        NSPlayerModel("Giannis", "Antetokounmpo", "GiannisAntetokounmpo", 34, "MilwaukeeBucks", Color(red: 2.0/255.0, green: 71.0/255.0, blue: 27.0/255.0)),
        NSPlayerModel("Ja", "Morant", "JaMorant", 12, "MemphisGrizzlies", Color(red: 93.0/255.0, green: 118.0/255.0, blue: 169.0/255.0)),
        NSPlayerModel("Jimmy", "Butler", "JimmyButler", 22, "MiamiHeat", Color(red: 152.0/255.0, green: 0.0/255.0, blue: 46.0/255.0)),
        NSPlayerModel("Nikola", "Jokic", "NikolaJokic", 15, "DenverNuggets", Color(red: 13.0/255.0, green: 34.0/255.0, blue: 64.0/255.0))
    ]
}
