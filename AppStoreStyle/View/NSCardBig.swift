//
//  NSCardBig.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - NamespaceCardBig

struct NSCardBig: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let heightBigCard: CGFloat = UIScreen.main.bounds.height / 2
        static let heightSmalCard: CGFloat = UIScreen.main.bounds.width / 2
    }
    
    //MARK: Properties
    
    @State private var appear: [Bool] = [false, false]
    
    private var namespace: Namespace.ID
    
    private let player: PlayerModel
    
    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                playerImage
                    .frame(height:InternalConstant.heightBigCard, alignment: .bottom)
                    .background(logoImage, alignment: .leading)
                    .background(playerNumber, alignment: .trailing)
                    .background(
                        player.colorTeam
                            .matchedGeometryEffect(id: "colorTeam", in: namespace)
                    )
                    .mask(maskRectangle)
                    .overlay(fullNamePlayer(), alignment: .bottomLeading)
                    .zIndex(1)
                
                ContentText()
                    .padding(.horizontal)
                    .padding(.bottom)
                    .foregroundColor(.white)
                    .frame(maxHeight: appear[0] ? .infinity : 0)
                    .opacity(appear[0] ? 1 : 0)
            }
            .background(Color.black)
            .ignoresSafeArea()
            
            CloseButton(player.colorTeam) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) { isShow.toggle() }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing)
            .opacity(appear[1] ? 1 : 0)
        }
        
        .onAppear {
            withAnimation(.easeInOut.delay(0.1)) { appear[0] = true }
            withAnimation(.easeInOut.delay(0.4)) { appear[1] = true }
        }
        
        .onChange(of: isShow) { newValue in
            appear[0] = false
            withAnimation(.easeInOut(duration: 0.1)) { appear[1] = false }
        }
    }
    
    private var logoImage: some View {
        let sizeLogo: CGFloat = InternalConstant.heightBigCard + 100
        
        return Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .opacity(0.5)
            .matchedGeometryEffect(id: "logoImage", in: namespace)
            .frame(width: sizeLogo, height: sizeLogo)
            .offset(x: sizeLogo / -2)
    }
    
    private var playerNumber: some View {
        Text(player.number.description)
            .font(.system(size: InternalConstant.heightBigCard / 5,
                          weight: .bold, design: .default))
            .matchedGeometryEffect(id: "playerNumber", in: namespace)
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
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
    }
    
    //MARK: Initializer
    
    init(_ player: PlayerModel,_ namespace: Namespace.ID,_ isShow: Binding<Bool>) {
        self.player = player
        self.namespace = namespace
        self._isShow = isShow
    }
    
    //MARK: Private Methods
    
    private func fullNamePlayer() -> some View {
        HStack(spacing: 10) {
            Text(player.firstName)
                .matchedGeometryEffect(id: "firstName", in: namespace)
            Text(player.lastName)
                .matchedGeometryEffect(id: "lastName", in: namespace)
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .font(.system(size: InternalConstant.heightSmalCard / 8, weight: .bold, design: .default))
        .foregroundColor(.white)
        .shadow(color: .black, radius: 0.1, x: 0, y: 0)
        .shadow(color: player.colorTeam, radius: 10, x: 0, y: 0)
        .padding(.horizontal)
        .padding(.top, getSafeArea().top)
    }
}

//MARK: - PreviewProvider

struct CardBig_Previews: PreviewProvider {
    static let player = PlayerVM().players[2]
    @Namespace static var namespace
    
    static var previews: some View {
        NSCardBig(player, namespace, .constant(true))
    }
}
