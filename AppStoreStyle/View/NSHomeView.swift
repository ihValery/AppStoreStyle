//
//  NSHomeView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - NanespaceHomeView

struct NSHomeView: View {
    
    //MARK: Properties
    
    @EnvironmentObject private var playerViewModel: NSPlayerVM
    
    @EnvironmentObject var nsModel: NSModelVM
    
    @Namespace private var namespace
    
    @State private var isShow: Bool = false
    
    @State private var selectID = UUID()
    
    var body: some View {
        ZStack {
            cardsPlayers
            
            cardDetail
        }
    }
    
    private var cardsPlayers: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(playerViewModel.players) { player in
                if isShow {
                    NSCardSmallPlug()
                } else {
                    cardSmall(player)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var cardDetail: some View {
        ForEach(playerViewModel.players) { player in
            if selectID == player.id, isShow {
                NSCardBig(player, namespace, $isShow)
                    .transition(
                        .asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                                    removal: .opacity.animation(.easeInOut(duration: 0.3)))
                    )
                    .zIndex(1)
            }
        }
    }
    
    //MARK: Private Methods
    
    private func cardSmall(_ player: NSPlayerModel) -> some View {
        NSCardSmall(player, namespace)
            .onTapGesture {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    selectID = player.id
                    isShow.toggle()
                }
                withAnimation(.spring(response: 0.3, dampingFraction: 0.9).delay(0.1)) {
                    nsModel.isShowTabBar.toggle()
                }
            }
    }
}

//MARK: - PreviewProvider

struct NSContentView_Previews: PreviewProvider {
    static var previews: some View {
        NSHomeView()
            .environmentObject(NSModelVM())
            .environmentObject(NSPlayerVM())
    }
}
