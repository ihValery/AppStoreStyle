//
//  PlayersView.swift
//  BearNameSpace
//
//  Created by Валерий Игнатьев on 15.05.22.
//

import SwiftUI

//MARK: - PlayersView

struct PlayersView: View {
    
    //MARK: Properties
    
    @ObservedObject private var playerViewModel = PlayerVM()
    
    @State private var selected: PlayerModel? = nil

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 10) {
                ForEach(playerViewModel.players) { player in
                    CardPlayerView(player, $selected)
                }
            }
        }
    }
}

//MARK: - PreviewProvider

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
