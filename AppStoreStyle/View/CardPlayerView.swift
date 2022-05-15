//
//  CardPlayerView.swift
//  BearNameSpace
//
//  Created by Валерий Игнатьев on 15.05.22.
//

import SwiftUI

//MARK: - CardPlayerView

struct CardPlayerView: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let heightBigCard: CGFloat = UIScreen.main.bounds.height / 2
        static let heightSmalCard: CGFloat = UIScreen.main.bounds.width / 2
    }
    
    //MARK: Properties
    
    @Namespace private var namespace
    
    @State private var isFullScreen: Bool = false
    
    private let player: PlayerModel
    
    var body: some View {
        VStack {
            playerImage
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(height: isFullScreen ? InternalConstant.heightBigCard : InternalConstant.heightSmalCard,
                       alignment: .bottom)
                .background(logoImage, alignment: .leading)
                .background(playerNumber, alignment: .trailing)
                .background(player.colorTeam)
                .mask(maskRectangle)
                .overlay(fullNamePlayer(), alignment: .bottomLeading)
                .padding(.horizontal, 20)
            
            if isFullScreen {
                Spacer()
            }
        }
        .ignoresSafeArea()
        
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.9)) {
                isFullScreen.toggle()
            }
        }
    }
    
    private var logoImage: some View {
        Image(player.teamLogo)
            .resizable()
            .scaledToFit()
            .frame(width: sizeLogoImage, height: sizeLogoImage)
            .padding(.leading)
            .padding(.bottom, isFullScreen ? 0 : 60)
            .offset(x: isFullScreen ? -(InternalConstant.heightBigCard + 100) / 2 - 16 : 0)
            .opacity(isFullScreen ? 0.5 : 1)
    }
    
    private var sizeLogoImage: CGFloat {
        isFullScreen ? InternalConstant.heightBigCard + 100 : InternalConstant.heightSmalCard / 2
    }
    
    private var playerNumber: some View {
        Text(player.number.description)
            .font(.system(size: InternalConstant.heightBigCard / 5, weight: .bold, design: .default))
            .offset(x: isFullScreen ? 0 : 300, y: isFullScreen ? -50 : -150)
            .padding(.trailing)
            .foregroundColor(.white).opacity(0.4)
    }
    
    private var maskRectangle: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
    }
    
    private var playerImage: some View {
        Image(player.avatar)
            .resizable()
            .scaledToFit()
            .padding(.top, isFullScreen ? 0 : 15)
            .shadow(color: .black.opacity(isFullScreen ? 0.5 : 0),
                    radius: 10, x: 0, y: 0)
    }
    
    //MARK: Initializer
    
    init(_ player: PlayerModel) {
        self.player = player
    }
    
    //MARK: Private Methods
    
    private func fullNamePlayer() -> some View {
        Group {
            if isFullScreen {
                HStack(spacing: 10) {
                    Text(player.firstName)
                        .matchedGeometryEffect(id: "firstName", in: namespace)
                    Text(player.lastName)
                        .matchedGeometryEffect(id: "lastName", in: namespace)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 30)
                .frame(maxHeight: .infinity, alignment: .top)
            } else {
                VStack(alignment: .leading, spacing: 0) {
                    Text(player.firstName)
                        .matchedGeometryEffect(id: "firstName", in: namespace)
                    Text(player.lastName)
                        .matchedGeometryEffect(id: "lastName", in: namespace)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .lineLimit(1)
        .font(.system(size: InternalConstant.heightSmalCard / 8, weight: .bold, design: .default))
        .foregroundColor(.white)
        .shadow(color: .black, radius: 0.1, x: 0, y: 0)
        .shadow(color: player.colorTeam, radius: 10, x: 0, y: 0)
        .padding()
    }
}

//MARK: - PreviewProvider

struct OneCardView_Previews: PreviewProvider {
    static let player = PlayerVM().players[2]
    
    static var previews: some View {
        CardPlayerView(player)
    }
}
