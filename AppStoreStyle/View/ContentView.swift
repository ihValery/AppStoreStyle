//
//  ContentView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

struct ContentView: View {
//    var player: Player
//    var screen = ScreenBounds()
//    @State private var isOn = false
    
    var body: some View {
        ScrollView {
            ForEach(players) { item in
                VisitingCard(player: item)
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
