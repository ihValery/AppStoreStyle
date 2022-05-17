//
//  ContentText.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

struct ContentText: View {
    
    //MARK: Properties
    
    private let textPlug: [String] = Array(repeating: "It's just a text, and I didn't type it thirty times. Lazy text.", count: 30)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Just text".uppercased())
                .font(.title)
                .bold()
            
            Text(textPlug.joined(separator: " "))
        }
    }
}

struct ContentText_Previews: PreviewProvider {
    static var previews: some View {
        ContentText()
    }
}
