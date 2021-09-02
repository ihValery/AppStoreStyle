//
//  CustomCorners.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 02.09.2021.
//

import SwiftUI

struct CustomCorners: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
