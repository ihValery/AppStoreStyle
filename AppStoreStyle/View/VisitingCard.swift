//
//  VisitingCard.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 04.09.2021.
//

import SwiftUI

struct VisitingCard: View {
    var player: Player
    var screen = ScreenBounds()
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack(alignment: .top) {
                    TextAboutPlayer(isOn: $isOn)
                    
                    CardView(player: player, isOn: $isOn)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isOn.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct VisitingCard_Previews: PreviewProvider {
    static var previews: some View {
        let player = players[0]
        VisitingCard(player: player)
            .previewDevice("iPhone 12")
    }
}
