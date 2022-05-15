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

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 10) {
                ForEach(playerViewModel.players) { player in
                    CardPlayerView(player)
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
