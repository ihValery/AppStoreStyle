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
        ScrollViewReader { proxy in
            
            ScrollView(.vertical, showsIndicators: true) {
                
                ForEach(playerViewModel.players) { player in
                    CardPlayerView(player, $selected)
                        .id(player.id)
                        .onTapGesture {
                            selectingPlayerSwitchingToIt(player, proxy)
                        }
                }
            }
        }
    }
    
    //MARK: Private Methods
    
    private func selectingPlayerSwitchingToIt(_ player: PlayerModel, _ proxy: ScrollViewProxy) {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            if selected == player {
                selected = nil
            } else {
                selected = player
                proxy.scrollTo(player.id)
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
