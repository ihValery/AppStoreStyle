//
//  NSShadowModifier.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 18.05.22.
//

import SwiftUI

//MARK: - NamespaceShadowModifier

struct NSShadowModifier: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black, radius: 0.1, x: 0, y: 0)
            .shadow(color: color, radius: 10, x: 0, y: 0)
    }
}

//MARK: - Extension

extension View {
    func defaultShadowName(_ color: Color) -> some View {
        self.modifier(NSShadowModifier(color: color))
    }
}

extension Font {
    static func defaultFontName() -> Font {
        .system(size: NSConstant.heightSmalCard / 8, weight: .bold, design: .default)
    }
    
    static func defaultFontNumber() -> Font {
        .system(size: NSConstant.heightBigCard / 5, weight: .bold, design: .default)
    }
}
