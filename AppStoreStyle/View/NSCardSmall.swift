//
//  NSCardSmall.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - NamespaceCardSmall

struct NSCardSmall: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let heightBigCard: CGFloat = UIScreen.main.bounds.height / 2
        static let heightSmalCard: CGFloat = UIScreen.main.bounds.width / 2
    }
    
    //MARK: Properties
    
    private let player: NSPlayerModel
    
    private var namespace: Namespace.ID
    
    var body: some View {
        playerImage
            .frame(maxWidth: .infinity, alignment: .trailing)
            .frame(height:InternalConstant.heightSmalCard, alignment: .bottom)
            .background(logoImage, alignment: .leading)
            .background(playerNumber, alignment: .trailing)
            .background(
                player.colorTeam
                    .matchedGeometryEffect(id: "colorTeam", in: namespace)
            )
            .mask(maskRectangle)
            .overlay(fullNamePlayer(), alignment: .bottomLeading)
            .padding(.horizontal, 20)
    }
    
    private var logoImage: some View {
        let sizeLogo: CGFloat = InternalConstant.heightSmalCard / 2
        
        return Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "logoImage", in: namespace)
            .frame(width: sizeLogo, height: sizeLogo)
            .padding(.leading)
            .padding(.bottom, 60)
    }
    
    private var playerNumber: some View {
        Text(player.number.description)
            .font(.system(size: InternalConstant.heightBigCard / 5, weight: .bold, design: .default))
            .matchedGeometryEffect(id: "playerNumber", in: namespace)
            .offset(x: 300)
            .padding(.trailing)
            .foregroundColor(.white)
            .opacity(0.4)
    }
    
    private var maskRectangle: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace)
    }
    
    private var playerImage: some View {
        Image(player.avatar)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "playerImage", in: namespace)
            .padding(.top, 15)
            .shadow(color: .black.opacity(0), radius: 10, x: 0, y: 0)
    }
    
    //MARK: Initializer
    
    init(_ player: NSPlayerModel,_ namespace: Namespace.ID) {
        self.player = player
        self.namespace = namespace
    }
    
    //MARK: Private Methods
    
    private func fullNamePlayer() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(player.firstName)
                .matchedGeometryEffect(id: "firstName", in: namespace)
            Text(player.lastName)
                .matchedGeometryEffect(id: "lastName", in: namespace)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .lineLimit(1)
        .font(.system(size: InternalConstant.heightSmalCard / 8, weight: .bold, design: .default))
        .foregroundColor(.white)
        .shadow(color: .black, radius: 0.1, x: 0, y: 0)
        .shadow(color: player.colorTeam, radius: 10, x: 0, y: 0)
        .padding()
    }
}

//MARK: - PreviewProvider

struct NSCardSmall_Previews: PreviewProvider {
    static let player = NSPlayerVM().players[2]
    @Namespace static var namespace
    
    static var previews: some View {
        NSCardSmall(player, namespace)
    }
}
