//
//  TitleView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 13.08.2021.
//

import SwiftUI

struct TitleView: View {
    var screen = ScreenBounds()
    @Binding var isOn: Bool
    
    var body: some View {
        Text(screen.tempText)
            .font(.body)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .frame(maxHeight: isOn ? .infinity : screen.heightCard)
            .frame(maxWidth: isOn ? .infinity : screen.widthCard)
            .offset(y: isOn ? screen.heightCardOn : 0)
            //offset и чтобы скролл захватил все - добавляем padding снизу
            .padding(.bottom, isOn ? screen.height / 2 : 0)
            .background(Color.gray.opacity(0.1))
            //        .opacity(isOn ? 1 : 0)
            .cornerRadius(30)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(isOn: .constant(true))
            .previewDevice("iPhone 12")
    }
}
