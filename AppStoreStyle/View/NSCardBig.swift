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
    
    @EnvironmentObject private var nsModel: NSModelVM
    
    @State private var animationSplit: [Bool] = [false, false]
    
    @State private var scrollProxy: CGFloat = 0
    
    @State private var isStatusBar: Bool = true
    
    private var namespace: Namespace.ID
    
    private let player: NSPlayerModel

    @Binding var isShow: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            NSDefaultScrollView($scrollProxy) {
                headerCardPlayer
                
                contentTextPlayer
            }
            
            headerPlayer
                .overlay(fullNamePlayer, alignment: .top)

            closeButton
        }
        .statusBar(hidden: isStatusBar)
        .onAppear {
            appearAnimation()
        }
        .onChange(of: isShow) { _ in
            disappearAnimation()
            
            withAnimation(.linear(duration: 0.1)) {
                isStatusBar.toggle()
            }
        }
    }
    
    //MARK: - Card elements

    private var headerCardPlayer: some View {
        Image(player.avatar)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "avatar\(player.id)", in: namespace)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            .frame(height: springHeaderCard, alignment: .bottom)
            .background(logoTeam, alignment: .leading)
            .background(numberPlayer, alignment: .trailing)
            .background(backgroundColorTeam)
            .mask(maskRectangle)
            .offset(y: whenScrollingDownStand)
            .zIndex(1)
    }
    
    private var headerPlayer: some View {
        Color.clear
            .frame(height: getSafeArea().top + NSConstant.sizeCloseButton)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom)
            .background(.ultraThinMaterial)
            .blur(radius: scrollProxy < -50 ? 660 - abs(scrollProxy) * 2 : 1000)
            .ignoresSafeArea()
    }
    
    private var fullNamePlayer: some View {
        HStack(spacing: 10) {
            Text(player.firstName)
                .matchedGeometryEffect(id: "firstName\(player.id)", in: namespace)
            Text(player.lastName)
                .matchedGeometryEffect(id: "lastName\(player.id)", in: namespace)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.defaultFontName())
        .foregroundColor(colorFullNamePlayer)
    }
    
    private var colorFullNamePlayer: Color {
        closeButtonColor ? player.colorTeam : .white
    }
    
    private var numberPlayer: some View {
        Text(player.number.description)
            .font(.defaultFontNumber())
            .matchedGeometryEffect(id: "number\(player.id)", in: namespace)
            .padding(.trailing)
            .foregroundColor(.white)
            .scaleEffect(scaleEffectSpringHeader)
            .offset(y: whenScrollingUpParallax)
            .opacity(NSConstant.defaultOpacity)
    }
    
    private var logoTeam: some View {
        let sizeLogo: CGFloat = NSConstant.heightBigCard + 100
        let whenScrollingDownOffset = isScrollDown ? scrollProxy / 2.5 : 0
        
        return Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "logo\(player.id)", in: namespace)
            .frame(width: sizeLogo, height: sizeLogo)
            .offset(x: (sizeLogo / -2) + whenScrollingDownOffset)
            .offset(y: whenScrollingUpParallax)
            .scaleEffect(scaleEffectSpringHeader)
            .opacity(NSConstant.defaultOpacity)
    }
    
    private var backgroundColorTeam: some View {
        player.colorTeam
            .matchedGeometryEffect(id: "color\(player.id)", in: namespace)
    }
    
    private var maskRectangle: some View {
        RoundedRectangle(cornerRadius: NSConstant.cornerRadius, style: .continuous)
            .matchedGeometryEffect(id: "mask\(player.id)", in: namespace)
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
            withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
                nsModel.isShowTabBar.toggle()
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
        let positionCloseButton = -(
            NSConstant.heightBigCard
            - getSafeArea().top
            - NSConstant.sizeCloseButton / 2
        )
        return scrollProxy > positionCloseButton ? false : true
    }
    
    private var whenScrollingDownStand: CGFloat {
        isScrollDown ? -scrollProxy : 0
    }
    
    private var whenScrollingUpParallax: CGFloat {
        isScrollDown ? 0 : scrollProxy / -1.8
    }
    
    private var springHeaderCard: CGFloat {
        isScrollDown ? NSConstant.heightBigCard + scrollProxy : NSConstant.heightBigCard
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
    
    //MARK: Private Methods
    
    private func appearAnimation() {
        withAnimation(.linear.delay(0.1)) {
            animationSplit[0] = true
        }
        
        withAnimation(.easeInOut.delay(0.4)) {
            animationSplit[1] = true
        }
    }
    
    private func disappearAnimation() {
        animationSplit[0] = false
        animationSplit[1] = false
    }
}

//MARK: - PreviewProvider

struct CardBig_Previews: PreviewProvider {
    static let player = NSPlayerVM().players[1]
    @Namespace static var namespace
    
    static var previews: some View {
        NSCardBig(player, namespace, .constant(true))
            .statusBar(hidden: false)
            .environmentObject(NSModelVM())
    }
}
