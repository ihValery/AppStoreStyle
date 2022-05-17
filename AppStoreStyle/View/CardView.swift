//
//  CardView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

struct CardView: View {
    var player: Player
    var screen = ScreenBounds()
    @Binding var isOn: Bool
    
    var body: some View {
        GeometryReader { gr in
            let offset = gr.frame(in: .global).minY
            let scrollUp: Bool = offset > 0
            
            Group {                
                ZStack {
                    TitleCard(player: player, isOn: $isOn, offset: offset)
                        .zIndex(isOn ? 0 : 1)
                        .padding(.top, isOn && screen.withBangs ? 20 : 0)
                        .offset(y: isOn && !scrollUp ? -(offset / 2.2) : 0)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Image(player.lastName)
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .black, radius: 20, x: 0, y: 10)
                                .frame(height: isOn ? screen.heightCardImageOn : screen.heightCardImage, alignment: .bottom)
                                .scaleEffect(isOn && scrollUp ? 1 + offset / 500 : 1)
                        }
                    }
                }
                .frame(maxWidth: isOn ? .infinity : screen.widthCard)
                .frame(maxHeight: isOn ? screen.height / 2  + (scrollUp ? offset : 0) : screen.heightCard)

                .background(LogoAndNumberPlayer(player: player, isOn: $isOn)
                                .offset(y: screen.withBangs ? 0 : 20)
                                .offset(y: isOn && !scrollUp ? -(offset / 2.2) : 0))
                
                .background(player.colorTeam)
                .clipShape(CustomCorners(corner: cornerScreenAndIsOn(), radius: 30))
                .offset(y: isOn && scrollUp ? -offset : 0)
                
                
                //Логотип медленно превращаеться в шо..
//                LogoTurnsDismiss(color: player.colorTeam, isOn: $isOn) {
//                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.1).speed(2)) {
//                        isOn = false
//                    }
//                }
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "xmark")
                                .font(.title3.bold())
                                .foregroundColor(offset > -screen.positionDismiss ? player.colorTeam : .white)
                                .frame(width: 36, height: 36)
                                .background(offset > -screen.positionDismiss ? Color.white.opacity(0.5) : .black.opacity(0.7))
                                .clipShape(Circle())
                                .rotationEffect(.degrees(isOn ? 0 : -360))
                                .scaleEffect(isOn ? 1 : 0)
                        })
                    }
                    .padding(.top, screen.withBangs ? 57 : 30)
                    .padding(.trailing, screen.withBangs ? 30 : 14)
                    
                    Spacer()
                }
                .offset(y: scrollUp ? -offset : 0)
                .offset(y: !scrollUp ? -offset : 0)
                .zIndex(1)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    ///Закругляем углы в зависимости от экрана и переменной isOn
    func cornerScreenAndIsOn() -> UIRectCorner {
        guard isOn else { return .allCorners }
        
        return screen.withBangs ? .allCorners : [.bottomLeft, .bottomRight]
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let player = players[1]
        CardView(player: player, isOn: .constant(true))
            .previewDevice("iPhone 12")
    }
}
