//
//  TitleCard.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 03.09.2021.
//

import SwiftUI

struct TitleCard: View {
    @Binding var isOn: Bool
    var offset: CGFloat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Giannis")
                    .font(.title.bold())
                    .foregroundColor(isOn ? .bucksLogo : .white)
                Text("Antetokounmpo")
                    .font(.title.bold())
                    .foregroundColor(isOn ? .bucksLogo : .white)
//                
//                Text("Смещение \(Int(offset))")
//                    .foregroundColor(.white.opacity(0.2))
                
                Spacer()
            }
            Spacer()
        }
        .padding(.top, isOn ? 30 : nil)
        .padding(.horizontal, isOn ? 30 : nil)
    }
}

struct TitleCard_Previews: PreviewProvider {
    static var previews: some View {
        TitleCard(isOn: .constant(true), offset: 10)
    }
}
