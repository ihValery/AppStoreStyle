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
        ScrollView {
            Group {
                ZStack(alignment: .top) {
                    VStack {
                        Text(screen.tempText)
                            .font(.body)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 20)
                    }
                    .frame(maxHeight: isOn ? .infinity : screen.hCard)
                    .offset(y:  isOn ? screen.hCardOn : 0)
                    //offset и чтобы скролл захватил все - добавляем padding снизу
                    .padding(.bottom, isOn ? screen.height / 2 : 0)
                    .animation(.spring(dampingFraction: 0.7))
                    
                    CardView(isOn: $isOn).opacity(1)
                        .onTapGesture {
                            isOn.toggle()
                        }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
