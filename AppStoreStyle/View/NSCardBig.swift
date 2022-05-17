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
    
    private let player: PlayerModel

    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    scrollDetection
                    
                    playerImage
                        .frame(height: heightCardParallax, alignment: .bottom)
                        .background(logoImage, alignment: .leading)
                        .background(playerNumber, alignment: .trailing)
                        .background(backgroundColor)
                        .mask(maskRectangle)
                        .overlay(fullNamePlayer(), alignment: .bottomLeading)
                        .overlay(Text("\(scrollProxy)")
                            .font(.title)
                            .foregroundColor(.white), alignment: .center)
                        .zIndex(1)
                        .offset(y: downShiftWhenScrolling)
                    
                    ContentText()
                        .padding()
                        .opacity(animationSplit[0] ? 1 : 0)
                        .offset(y: downShiftWhenScrolling)
                }
            }
//            .background(Color.white.opacity(0.7))
            .ignoresSafeArea()
            
            CloseButton(player.colorTeam, closeButtonColor) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) { isShow.toggle() }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing)
            .opacity(animationSplit[1] ? 1 : 0)
        }
        
        .onAppear {
            withAnimation(.linear.delay(0.1)) { animationSplit[0] = true }
            withAnimation(.easeInOut.delay(0.4)) { animationSplit[1] = true }
        }
        
        .onChange(of: isShow) { newValue in
            animationSplit[0] = false
            animationSplit[1] = false
        }
    }
    
    private var closeButtonColor: Bool {
        scrollProxy > -(heightBigCard - getSafeArea().top) ? false : true
    }
    
    private var scrollDetection: some View {
        GeometryReader { grProxy in
            Color.clear
                .preference(key: ScrollPreferenceKey.self,
                            value: grProxy.frame(in: .global).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            scrollProxy = value
        }
    }
    
    private var downShiftWhenScrolling: CGFloat {
        isScrollDown ? -scrollProxy : 0
    }
    
    private var upShiftWhenScrolling: CGFloat {
        isScrollDown ? 0 : scrollProxy / -2
    }
    
//    private var upScrollingForName: CGFloat {
//        guard !isScrollDown else { return 0 }
//
////        return scrollProxy > -70 ? -scrollProxy : 70 + (scrollProxy + 70) / -1.1
//
//        return scrollProxy > -heightBigCard + 70 ? -scrollProxy : scrollProxy
//    }
    
    private var isScrollDown: Bool {
        scrollProxy > 0
    }
    
    private var heightCardParallax: CGFloat {
        isScrollDown ? heightBigCard + scrollProxy : heightBigCard
    }
    
    private var logoImage: some View {
        let sizeLogo: CGFloat = heightBigCard + 100
        
        return Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .opacity(0.5)
            .matchedGeometryEffect(id: "logoImage", in: namespace)
            .frame(width: sizeLogo, height: sizeLogo)
            .offset(x: (sizeLogo / -2) + (isScrollDown ? scrollProxy / 2 : 0))
            .offset(y: upShiftWhenScrolling)
            .scaleEffect(scaleEffectParallax)
    }
    
    private var backgroundColor: some View {
        player.colorTeam
            .matchedGeometryEffect(id: "colorTeam", in: namespace)
    }
    
    private var playerNumber: some View {
        Text(player.number.description)
            .font(.system(size: heightBigCard / 5,
                          weight: .bold, design: .default))
            .matchedGeometryEffect(id: "playerNumber", in: namespace)
            .padding(.trailing)
            .foregroundColor(.white)
            .scaleEffect(scaleEffectParallax)
            .offset(y: upShiftWhenScrolling)
            .opacity(0.4)
    }
    
    private var scaleEffectParallax: CGFloat {
        isScrollDown ? 1 + scrollProxy / 500 : 1
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
        .font(.system(size: heightSmalCard / 8, weight: .bold, design: .default))
        .foregroundColor(.white)
        .shadow(color: .black, radius: 0.1, x: 0, y: 0)
        .shadow(color: player.colorTeam, radius: 10, x: 0, y: 0)
        .padding(.horizontal)
        .padding(.top, getSafeArea().top)
    }
}

//MARK: - PreviewProvider

struct CardBig_Previews: PreviewProvider {
    static let player = PlayerVM().players[1]
    @Namespace static var namespace
    
    static var previews: some View {
        NSCardBig(player, namespace, .constant(true))
    }
}
