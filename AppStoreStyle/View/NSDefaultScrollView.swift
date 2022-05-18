//
//  NSDefaultScrollView.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 18.05.22.
//

import SwiftUI

//MARK: - NSDefaultScrollView

struct NSDefaultScrollView<Content: View>: View {
    
    //MARK: Properties
    
    @Binding var scrollProxy: CGFloat
    
    private let content: Content

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: .zero) {
                scrollDetection
                
                content
            }
        }
        .background()
        .ignoresSafeArea()
    }
    
    private var scrollDetection: some View {
        GeometryReader { grProxy in
            Color.clear
                .preference(key: ScrollPreferenceKey.self,
                            value: grProxy.frame(in: .global).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self) { scrollProxy = $0 }
    }
    
    //MARK: Initializer
    
    init(_ scrollProxy: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._scrollProxy = scrollProxy
        self.content = content()
    }
}

//MARK: - PreviewProvider

struct NSDefaultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        NSDefaultScrollView(.constant(0)) {
            Text("Test")
                .padding(.top, 100)
        }
    }
}

//MARK: - ScrollPreferenceKey

fileprivate struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
