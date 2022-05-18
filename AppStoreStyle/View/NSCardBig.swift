//
//  NSCardBig.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - NamespaceCardBig

struct NSCardBig: View {
    
    //MARK: Properties
    
    @State private var animationSplit: [Bool] = [false, false]
    
    @State private var scrollProxy: CGFloat = 0
    
    private let heightBigCard: CGFloat = UIScreen.main.bounds.height / 2
    
    private let heightSmalCard: CGFloat = UIScreen.main.bounds.width / 2
    
    private var namespace: Namespace.ID
    
    private let player: NSPlayerModel

    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            NSDefaultScrollView($scrollProxy) {
                headerCardPlayer
                
                contentTextPlayer
            }
            
            closeButton
        }
        
        .onAppear {
            withAnimation(.linear.delay(0.1)) { animationSplit[0] = true }
            withAnimation(.easeInOut.delay(0.4)) { animationSplit[1] = true }
        }
        
        .onChange(of: isShow) { _ in
            animationSplit[0] = false
            animationSplit[1] = false
        }
    }
    
    //MARK: - Card elements

    private var headerCardPlayer: some View {
        Image(player.avatar)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "playerImage", in: namespace)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            .frame(height: springHeaderCard, alignment: .bottom)
            .background(logoTeam, alignment: .leading)
            .background(numberPlayer, alignment: .trailing)
            .background(backgroundColorTeam)
            .overlay(fullNamePlayer)
            .mask(maskRectangle)
            .offset(y: whenScrollingDownStand)
            .zIndex(1)
    }
    
    private var fullNamePlayer: some View {
        HStack(spacing: 10) {
            Text(player.firstName)
                .matchedGeometryEffect(id: "firstName", in: namespace)
            Text(player.lastName)
                .matchedGeometryEffect(id: "lastName", in: namespace)
        }
        .frame(height: 40, alignment: .center)
        .lineLimit(1)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .font(.system(size: heightSmalCard / 8, weight: .bold, design: .default))
        .foregroundColor(.white)
        .shadow(color: .black, radius: 0.1, x: 0, y: 0)
        .shadow(color: player.colorTeam, radius: 10, x: 0, y: 0)
        .padding(.horizontal)
        .padding(.top, getSafeArea().top)
    }
    
    private var numberPlayer: some View {
        Text(player.number.description)
            .font(.system(size: heightBigCard / 5,
                          weight: .bold, design: .default))
            .matchedGeometryEffect(id: "playerNumber", in: namespace)
            .padding(.trailing)
            .foregroundColor(.white)
            .scaleEffect(scaleEffectSpringHeader)
            .offset(y: whenScrollingUpParallax)
            .opacity(0.4)
    }
    
    private var logoTeam: some View {
        let sizeLogo: CGFloat = heightBigCard + 100
        
        return Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "logoImage", in: namespace)
            .frame(width: sizeLogo, height: sizeLogo)
            .offset(x: (sizeLogo / -2) + (isScrollDown ? scrollProxy / 2.5 : 0))
            .offset(y: whenScrollingUpParallax)
            .scaleEffect(scaleEffectSpringHeader)
            .opacity(0.4)
    }
    
    private var backgroundColorTeam: some View {
        player.colorTeam
            .matchedGeometryEffect(id: "colorTeam", in: namespace)
    }
    
    private var maskRectangle: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace)
    }
    
    private var contentTextPlayer: some View {
        ContentText()
            .padding()
            .offset(y: whenScrollingDownStand)
            .opacity(animationSplit[0] ? 1 : 0)
    }
    
    private var closeButton: some View {
        CloseButton(player.colorTeam, closeButtonColor) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                isShow.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(.trailing)
        .opacity(animationSplit[1] ? 1 : 0)
    }
    
    //MARK: - Scroll logic parallax
    
    private var isScrollDown: Bool {
        scrollProxy > 0
    }
    
    private var closeButtonColor: Bool {
        scrollProxy > -(heightBigCard - getSafeArea().top - 20) ? false : true
    }
    
    private var whenScrollingDownStand: CGFloat {
        isScrollDown ? -scrollProxy : 0
    }
    
    private var whenScrollingUpParallax: CGFloat {
        isScrollDown ? 0 : scrollProxy / -1.8
    }
    
    private var springHeaderCard: CGFloat {
        isScrollDown ? heightBigCard + scrollProxy : heightBigCard
    }
    
    private var scaleEffectSpringHeader: CGFloat {
        isScrollDown ? 1 + scrollProxy / 500 : 1
    }
    
    //MARK: Initializer
    
    init(_ player: NSPlayerModel,_ namespace: Namespace.ID,_ isShow: Binding<Bool>) {
        self.player = player
        self.namespace = namespace
        self._isShow = isShow
    }
}

//MARK: - PreviewProvider

struct CardBig_Previews: PreviewProvider {
    static let player = NSPlayerVM().players[1]
    @Namespace static var namespace
    
    static var previews: some View {
        NSCardBig(player, namespace, .constant(true))
    }
}
