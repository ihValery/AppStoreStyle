//
//  NSCardSmall.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - NamespaceCardSmall

struct NSCardSmall: View {
    
    //MARK: Properties
    
    private let player: NSPlayerModel
    
    private var namespace: Namespace.ID
    
    var body: some View {
        avatarPlayer
            .frame(maxWidth: .infinity, alignment: .trailing)
            .frame(height: NSConstant.heightSmalCard)
            .background(logoTeam, alignment: .leading)
            .background(numberPlayer, alignment: .trailing)
            .background(backgroundColorTeam)
            .overlay(fullNamePlayer, alignment: .bottomLeading)
            .mask(maskRectangle)
    }
    
    //MARK: - Card elements
    
    private var fullNamePlayer: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(player.firstName)
                .matchedGeometryEffect(id: "firstName\(player.id)", in: namespace)
            Text(player.lastName)
                .matchedGeometryEffect(id: "lastName\(player.id)", in: namespace)
        }
        .font(.defaultFontName())
        .foregroundColor(.white)
        .defaultShadowName(player.colorTeam)
        .padding()
    }
    
    private var logoTeam: some View {
        let sizeLogo: CGFloat = NSConstant.heightSmalCard / 2
        
        return Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "logo\(player.id)", in: namespace)
            .frame(width: sizeLogo, height: sizeLogo)
            .padding(.leading)
            .padding(.bottom, 60)
    }
    
    private var numberPlayer: some View {
        Text(player.number.description)
            .font(.defaultFontNumber())
            .matchedGeometryEffect(id: "number\(player.id)", in: namespace)
            .offset(x: 300)
            .foregroundColor(.white)
            .opacity(NSConstant.defaultOpacity)
    }
    
    private var maskRectangle: some View {
        RoundedRectangle(cornerRadius: NSConstant.cornerRadius, style: .continuous)
            .matchedGeometryEffect(id: "mask\(player.id)", in: namespace)
    }
    
    private var avatarPlayer: some View {
        Image(player.avatar)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "avatar\(player.id)", in: namespace)
            .padding(.top, NSConstant.defaultPadding)
    }
    
    private var backgroundColorTeam: some View {
        player.colorTeam
            .matchedGeometryEffect(id: "color\(player.id)", in: namespace)
    }
    
    //MARK: Initializer
    
    init(_ player: NSPlayerModel,_ namespace: Namespace.ID) {
        self.player = player
        self.namespace = namespace
    }
}

//MARK: - PreviewProvider

struct NSCardSmall_Previews: PreviewProvider {
    static let player = NSPlayerVM().players[2]
    @Namespace static var namespace
    
    static var previews: some View {
        Group {
            NSCardSmall(player, namespace)
            
            NSCardSmallPlug()
        }
        .previewLayout(.sizeThatFits)
    }
}

//MARK: - NSCardSmallPlug

struct NSCardSmallPlug: View {
    var body: some View {
        Color.clear
            .frame(height: NSConstant.heightSmalCard)
    }
}

