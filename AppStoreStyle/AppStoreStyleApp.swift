//
//  AppStoreStyleApp.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

@main
struct AppStoreStyleApp: App {
    @StateObject private var nsModel = NSModelVM()
    @StateObject private var playerViewModel = NSPlayerVM()
    
    var body: some Scene {
        WindowGroup {
            NSLoader()
                .environmentObject(nsModel)
                .environmentObject(playerViewModel)
        }
    }
}
