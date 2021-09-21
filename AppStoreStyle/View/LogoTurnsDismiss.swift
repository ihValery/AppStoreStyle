//
//  LogoTurnsDismiss.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

struct LogoTurnsDismiss: View {
    var color: Color
    var offset: CGFloat
    @Binding var isOn: Bool
    var action: () -> Void
    var screen = ScreenBounds()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: action, label: {
                    Image(systemName: "xmark")
                        .font(.title3.bold())
//                        .foregroundColor(color)
                        .foregroundColor(offset > -screen.positionDismiss ? color : .white)
                        .frame(width: 36, height: 36)
//                        .background(Color.white.opacity(0.5))
                        .background(offset > -screen.positionDismiss ? Color.white.opacity(0.5) : .black.opacity(0.7))
                        .clipShape(Circle())
                        .rotationEffect(.degrees(isOn ? 0 : -360))
                        .scaleEffect(isOn ? 1 : 0)
                })
            }
            .padding(.top, screen.withBangs ? 57 : 30)
            .padding(.trailing, screen.withBangs ? 30 : 14)
            .offset(y: offset > 0 ? -offset : 0)
            .offset(y: offset < 0 ? -offset : 0)
            
            Spacer()
        }
    }
}


struct LogoTurnsDismiss_Previews: PreviewProvider {
    static var previews: some View {
        LogoTurnsDismiss(color: .green, offset: 0, isOn: .constant(true)) { }
            .previewDevice("iPhone 12")
    }
}
