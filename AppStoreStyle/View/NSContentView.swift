//
//  NSContentView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - NanespaceContentView

struct NSContentView: View {
    
    //MARK: Properties
    
    @ObservedObject private var playerViewModel = PlayerVM()
    
    @Namespace private var namespace
    
    @Namespace private var namespace2
    
    @Namespace private var namespace3
    
    @Namespace private var namespace4
    
    @Namespace private var namespace5
    
    @Namespace private var namespace6
    
    @Namespace private var namespace7
    
    @State private var isShow: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                NSCardSmall(playerViewModel.players[0], namespace2)
                NSCardSmall(playerViewModel.players[2], namespace3)
                NSCardSmall(playerViewModel.players[3], namespace4)
                
                NSCardSmall(playerViewModel.players[1], namespace)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) { isShow.toggle() }
                    }
                
                NSCardSmall(playerViewModel.players[4], namespace5)
                NSCardSmall(playerViewModel.players[0], namespace6)
                NSCardSmall(playerViewModel.players[3], namespace7)
            }
            
            if isShow {
                NSCardBig(playerViewModel.players[1], namespace, $isShow)
                    .zIndex(1)
//                    .transition(
//                        .asymmetric(insertion: .opacity.animation(.linear(duration: 0.2)),
//                                    removal: .opacity.animation(.linear(duration: 0.1).speed(2)))
//                    )
//                    .opacity(0.5)
            }
        }
    }
}

//MARK: - PreviewProvider

struct NSContentView_Previews: PreviewProvider {
    static var previews: some View {
        NSContentView()
    }
}
