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
                ZStack {
                    TitleCard(isOn: $isOn, offset: offset)
                        .zIndex(isOn ? 0 : 1)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Image("Giannis")
                                .resizable()
                                .scaledToFit()
                                .frame(height: isOn ? screen.heightCardImageOn : screen.heightCardImage, alignment: .bottom)
                                .scaleEffect(isOn && scrollUp ? 1 + offset / 500 : 1)
                        }
                    }
                }
                .frame(maxWidth: isOn ? .infinity : screen.widthCard)
                .frame(maxHeight: isOn ? screen.height / 2  + (scrollUp ? offset : 0) : screen.heightCard)

                .background(
                    HStack {
                        Image("BucksLogo")
                            .resizable()
                            .scaledToFill()
                            .opacity(isOn ? 1 : 0.1)
                            .frame(width: isOn ? 100 : 400, height: isOn ? 100 : 400)
                        
                        Spacer()
                        
                        VStack {
                            Text("34")
                                .font(.system(size: 70))
                                .fontWeight(.black)
                            Text("Forward")
                                .bold()
                                .offset(y: -15)
                        }
                        .foregroundColor(.bucksLogo)
                        .padding(.trailing, 10)
                    }
                    .offset(y: isOn && !scrollUp ? -(offset / 2) : 0)
                )
                .background(Color.bucks)
                .clipShape(CustomCorners(corner: cornerScreenAndIsOn(), radius: 30))
                .offset(y: isOn && scrollUp ? -offset : 0)
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
        CardView(isOn: .constant(true))
            .previewDevice("iPhone 12")
    }
}
