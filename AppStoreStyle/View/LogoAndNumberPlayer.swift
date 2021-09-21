//
//  LogoAndNumberPlayer.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 03.09.2021.
//

import SwiftUI

struct LogoAndNumberPlayer: View {
    var player: Player
    var screen = ScreenBounds()
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Image(player.team)
                .resizable()
                .scaledToFit()
                .opacity(isOn ? 1 : 0.1)
                .scaleEffect(isOn ? 0.5 : 1, anchor: .leading)
            
            Spacer()
            
            VStack {
                Text("\(player.number)")
                    .font(.system(size: 70))
                    .fontWeight(.black)
                Text("Forward")
                    .bold()
                    .offset(y: -15)
            }
            .foregroundColor(.white)
            .opacity(0.8)
            .scaleEffect(isOn ? 1 : 0)
            .padding(.trailing, 10)
        }
//        .frame(maxWidth: screen.widthCard, maxHeight: screen.heightCard)
    }
}

struct LogoAndNumberPlayer_Previews: PreviewProvider {
    static var previews: some View {
        let player = players[1]
        LogoAndNumberPlayer(player: player, isOn: .constant(false))
            .previewDevice("iPhone 12")
    }
}
