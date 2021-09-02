//
//  ScreenBounds.swift
//  AppStoreStyle
//
//  Created by Валерий Игнатьев on 12.08.2021.
//

import SwiftUI

final class ScreenBounds {
    private var screen = UIScreen.main.bounds
    
    ///Высота текущего экрана
    var height = UIScreen.main.bounds.height
    
    ///Ширина текущего экрана
    var width = UIScreen.main.bounds.width
    
    ///iPhone с челкой?
    var withBangs: Bool {
        screen.height > 750
    }
    
    ///Ширина карточки = ширина экрана - 40
    var widthCard: CGFloat {
        screen.width - 40
    }
    
    ///Высота карточки resolution ? 190 : 230
    var heightCard: CGFloat {
        screen.height < 750 ? 190 : 230
    }
    
    ///Высота активной карточки =
    var heightCardOn: CGFloat {
        height / 2
    }
    
    ///Высота картинки 2/3 от карточки
    var heightCardImage: CGFloat {
        heightCard * 2 / 3
    }
    
    ///Высота картинки 2/3 + 50 от активной карточки
    var heightCardImageOn: CGFloat {
        heightCard * 2 / 3 + 50
    }
    
    var tempText = "What’s New\n\nUse the latest capabilities to improve the discovery of your app on the App Store, and deliver high-quality app and in-app purchase experiences.\n\nIn-app events\n\nIn-app events are timely events within apps and games — such as a game competition, a new movie premiere, a livestreamed experience, and more. Later this year, users will be able to discover your in-app events right on the App Store, giving you a whole new way to showcase your events and expand their reach. Users will be able to discover events in personalized recommendations and editorial curation on the Today, Games, and Apps tabs, in search results, and on the app’s product page. You can easily manage your events in App Store Connect, and view insights into how they’re performing in App Analytics.\n\nTestFlight on Mac\n\nLater this year, you’ll be able to invite internal and external testers to try out your Mac apps and provide feedback before publishing on the Mac App Store. When testing apps for any Apple platform, you’ll be able to create multiple groups of internal testers and configure build access for each one. And internal testers of apps built with Xcode Cloud can select builds based on build groups.\n\nApp Store server notifications\n\nApp Store server notifications provide real-time updates on your in-app purchases, so you can create customized experiences for your users. Later this year, new notification types cover more user events, including subscription expiration, offer redemption, refunds, and more. You’ll also be able to enter an optional URL to receive server notifications in the App Store sandbox environment, separate from the URL that you use for production.\n\nNew metrics\n\nMeasure overall performance more effectively with new metrics, including re-downloads, total downloads, proceeds data, average revenue per paying user, pre-orders, and updates. Each of these metrics will be viewable by territory, device, and source type to let you easily determine what drives your app’s success and growth.\nData is available only from users who have agreed to share their diagnostics and usage information with app developers."
}
