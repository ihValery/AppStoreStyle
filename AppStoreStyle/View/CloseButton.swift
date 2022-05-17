//
//  CloseButton.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - CloseButton
struct CloseButton: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let sizeLogo: CGSize = .init(width: 40, height: 40)
        static let xmark = "xmark"
    }
    
    private let action: () -> Void
    
    private let color: Color
    
    //MARK: Properties
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: InternalConstant.xmark)
                .font(.title3.bold())
                .foregroundColor(color)
                .frame(width: InternalConstant.sizeLogo.width,
                       height: InternalConstant.sizeLogo.height)
                .background(Color.white.opacity(0.4))
                .mask(Circle())
        }
    }
    
    //MARK: Initializer
    
    init(_ color: Color, action: @escaping () -> Void) {
        self.color = color
        self.action = action
    }
}

//MARK: - PreviewProvider
struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CloseButton(.red) { }
            CloseButton(.green) { }
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
