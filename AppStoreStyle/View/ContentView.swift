//
//  ContentView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

struct ContentView: View {
    var screen = ScreenBounds()
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            //Логотип медленно превращаеться в шо..
            LogoTurnsDismiss(color: .purple, isOn: $isOn) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.1).speed(2)) {
                    isOn = false
                }
            }
            .zIndex(1)
            
            ScrollView {
                ZStack(alignment: .top) {
                    TitleView(isOn: $isOn)
                    
                    CardView(isOn: $isOn)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
    //                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.1).speed(2)) {
                                isOn.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
