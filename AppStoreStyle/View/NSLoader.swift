//
//  NSLoader.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 19.05.22.
//

import SwiftUI

//MARK: - NamespaceLoader

struct NSLoader: View {
    
    @EnvironmentObject private var nsModel: NSModelVM
    
    var body: some View {
        ZStack {
            NSHomeView()
            
            Stencil("TabBar GLASS", .largeTitle, .black)
                .padding(.bottom)
                .frame(height: 75)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: nsModel.isShowTabBar ? 0 : 200)
                .ignoresSafeArea()            
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear
                .frame(height: 40)
        }
    }
}

//MARK: - PreviewProvider

struct NSLoader_Previews: PreviewProvider {
    static var previews: some View {
        NSLoader()
            .environmentObject(NSModelVM())
            .environmentObject(NSPlayerVM())
    }
}
