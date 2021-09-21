//
//  TitleCard.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 03.09.2021.
//

import SwiftUI

struct TitleCard: View {
    var player: Player
    @Binding var isOn: Bool
    var offset: CGFloat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(player.firstName)
                    .font(.title.bold())
                    .foregroundColor(.white)
                Text(player.lastName)
                    .font(.title.bold())
                    .foregroundColor(.white)
//                
//                Text("Смещение \(Int(offset))")
//                    .foregroundColor(.white.opacity(0.2))
                
                Spacer()
            }
            Spacer()
        }
        .padding(.top, isOn ? 30 : nil)
        .padding(.horizontal, isOn ? 30 : nil)
    }
}

struct TitleCard_Previews: PreviewProvider {
    static var previews: some View {
        let player = players[0]
        TitleCard(player: player, isOn: .constant(true), offset: 10)
            .previewDevice("iPhone 12")
    }
}
