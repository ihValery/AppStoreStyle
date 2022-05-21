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
        static let xmark = "xmark"
    }
    
    private let action: () -> Void
    
    private let color: Color
    
    private let isBlack: Bool
    
    //MARK: Properties
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: InternalConstant.xmark)
                .font(.body.bold())
                .foregroundColor(color)
                .frame(width: NSConstant.sizeCloseButton, height: NSConstant.sizeCloseButton)
                .background(backgroundColor.opacity(0.4))
                .mask(Circle())
        }
    }
    
    private var backgroundColor: Color {
        isBlack ? .black : .white
    }
    
    //MARK: Initializer
    
    init(_ color: Color,_ isBlack: Bool, action: @escaping () -> Void) {
        self.color = color
        self.isBlack = isBlack
        self.action = action
    }
}

//MARK: - PreviewProvider
struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CloseButton(.red, true) { }
            CloseButton(.red, false) { }
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
