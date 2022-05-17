//
//  ContentText.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

struct ContentText: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("This course")
                .font(.title)
                .bold()
            
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions. SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter. This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions. SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter.")
        }
    }
}

struct ContentText_Previews: PreviewProvider {
    static var previews: some View {
        ContentText()
    }
}
