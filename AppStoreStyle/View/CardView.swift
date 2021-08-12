//
//  CardView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

struct CardView: View {
    var screen = ScreenBounds()
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("AppStore style")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Text("Пытаюсь повторить")
                        .foregroundColor(.white.opacity(0.5))
                }
                Spacer()
                
                //Логотип медленно превращаеться в шо..
                LogoTurnsDismiss(color: .purple, isOn: $isOn) { }
            }
            .padding(.top, isOn ? 30 : nil)
            .padding(.horizontal, isOn ? 30 : nil)
            Spacer()
            
            Image("Card")
                .resizable()
                .scaledToFill()
                .frame(width: screen.width)
                .frame(height: isOn ? screen.hcImageOn : screen.hcImage, alignment: .top)
                .cornerRadius(1)
        }
        .frame(maxWidth: isOn ? .infinity : screen.wCard)
        .frame(maxHeight: isOn ? screen.height / 2 : screen.hCard)
        .background(Color.purple)
        .cornerRadius(30)
        .animation(.spring(dampingFraction: 0.7))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isOn: .constant(false))
            .previewDevice("iPhone 12")
    }
}
