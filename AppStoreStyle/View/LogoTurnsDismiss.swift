//
//  LogoTurnsDismiss.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

struct LogoTurnsDismiss: View {
    var color: Color
    @Binding var isOn: Bool
    var action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: action, label: {
                    Image(systemName: "xmark")
                        .font(.title3.bold())
                        .foregroundColor(color)
                        .frame(width: 36, height: 36)
                        .background(Color.white.opacity(0.5))
                        .clipShape(Circle())
                        .rotationEffect(.degrees(isOn ? 0 : -360))
                        .opacity(isOn ? 1 : 0)
                })
            }
            .padding(.top)
            .padding(.trailing, 30)
            
            Spacer()
        }
    }
}


struct LogoTurnsDismiss_Previews: PreviewProvider {
    static var previews: some View {
        LogoTurnsDismiss(color: .green, isOn: .constant(true)) { }
            .previewDevice("iPhone 12")
    }
}
