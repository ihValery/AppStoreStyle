//
//  HomeView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 15.05.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                NavigationLink {
                    OldVersionContentView()
                } label: {
                    Text("OldVersionContentView")
                }
                
                NavigationLink {
                    PlayersView()
                } label: {
                    Text("PlayersView")
                }
                
                NavigationLink {
                    NSHomeView()
                } label: {
                    Text("Namespace 2view")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
