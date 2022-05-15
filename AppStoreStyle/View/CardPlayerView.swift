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
//                .overlay(strokeCard)
                .padding(.horizontal, 20)
//                .padding(.horizontal, isFullScreen ? 0 : 20)
            
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
            .frame(width: isFullScreen ? InternalConstant.heightBigCard + 100 : InternalConstant.heightSmalCard / 2,
                   height: isFullScreen ? InternalConstant.heightBigCard + 100 : InternalConstant.heightSmalCard / 2)
            .padding(.leading)
            .padding(.bottom, isFullScreen ? 0 : 60)
            .offset(x: isFullScreen ? -(InternalConstant.heightBigCard + 100) / 2 - 16 : 0)
            .opacity(isFullScreen ? 0.5 : 1)
    }
    
//    private var gradient: [Color] {
//        var colorsTeam = Array(repeating: player.colorTeam, count: 17)
//        colorsTeam.append(.white)
//
//        return colorsTeam
//    }
//
//    private var strokeCard: some View {
//        RoundedRectangle(cornerRadius: 20, style: .continuous)
//            .stroke(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom),
//                    lineWidth: 1)
//    }
    
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
            } else {
                VStack(alignment: .leading, spacing: 0) {
                    Text(player.firstName)
                        .matchedGeometryEffect(id: "firstName", in: namespace)
                    Text(player.lastName)
                        .matchedGeometryEffect(id: "lastName", in: namespace)
                }
            }
        }
        .lineLimit(1)
        .font(.system(size: InternalConstant.heightSmalCard / 8, weight: .bold, design: .default))
        .foregroundColor(.white)
        .shadow(color: .black, radius: 1, x: 0, y: 0)
//        .offset(y: isFullScreen ? 60 : 0)
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
