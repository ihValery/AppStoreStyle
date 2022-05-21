//
//  Stencil.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 21.05.22.
//

import SwiftUI

//MARK: - Stencil Трафарет

struct Stencil: View {
    
    //MARK: Properties
    
    private let text: String
    private let size: Font
    private let weight: Font.Weight
    
    var body: some View {
        VStack {
            Color.clear
        }
        .background(.ultraThinMaterial)
        .mask(inverseMask())
    }
    
    private var maskText: some View {
        Text(text)
            .font(size)
            .fontWeight(weight)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    //MARK: Initializer
    
    init(_ text: String,_ size: Font = .title,_ weight: Font.Weight = .black) {
        self.text = text
        self.size = size
        self.weight = weight
    }
    
    //MARK: Private Methods

    private func inverseMask() -> some View {
        maskText
            .foregroundColor(.black)
            .background(.white)
            .compositingGroup()
            .luminanceToAlpha()
    }
}

//MARK: - PreviewProvider

struct DemoOne_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Stencil("Hello World!", .largeTitle)
                .background(.green)
            
            Stencil("For test", .title, .thin)
                .background(.gray)
            
            Stencil("Example number three", .title, .bold)
                .background(.purple)
        }
        .frame(height: 100)
        .previewLayout(.sizeThatFits)
    }
}
