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
        GeometryReader { gr in
            let offset = gr.frame(in: .global).minY
            let scrollUp: Bool = offset > 0
            
            Group {                
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("AppStore style")
                                .font(.title.bold())
                                .foregroundColor(.white)
                            
                            Text("Пытаюсь повторить \(offset)")
                                .foregroundColor(.white.opacity(0.5))
                        }
                        Spacer()
                    }
                    .padding(.top, isOn ? 30 : nil)
                    .padding(.horizontal, isOn ? 30 : nil)
//                    .offset(y: isOn && scrollUp ? offset : 0)

                    Spacer()
                    
                    Image("Card")
                        .resizable()
                        .scaledToFill()
                        .frame(width: screen.width)
                        .frame(height: isOn ? screen.heightCardImageOn : screen.heightCardImage, alignment: .top)
                        .cornerRadius(1)
                        .scaleEffect(isOn && scrollUp ? 1 + offset / 500 : 1)
                }
                .frame(maxWidth: isOn ? .infinity : screen.widthCard)
                .frame(maxHeight: isOn ? screen.height / 2  + (scrollUp ? offset : 0) : screen.heightCard)
                .background(Color.purple)
                .clipShape(CustomCorners(corner: cornerScreenAndIsOn(), radius: 30))
                .offset(y: isOn && scrollUp ? -offset : 0)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    ///Закругляем углы в зависимости от экрана и переменной isOn
    func cornerScreenAndIsOn() -> UIRectCorner {
        guard isOn else { return .allCorners }
        
        if screen.withBangs {
            return .allCorners
        } else {
            return [.bottomLeft, .bottomRight]
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isOn: .constant(false))
            .previewDevice("iPhone 12")
    }
}
