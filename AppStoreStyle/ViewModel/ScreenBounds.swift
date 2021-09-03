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
        heightCard * 2 / 3 + 150
    }
    
    var tempText = "PROFESSIONAL CAREER\n\n2018-19 NBA MVP 3-time NBA All-Star Game starter (2017, 2018, 2019); captain of Team Giannis in 2019 NBA All-Star Game 3-time All-NBA (2019 1st Team; 2017, 2018 2nd Team); 2-time NBA All-Defensive Team (2019 1st Team, 2017 2nd Team); NBA’s Most Improved Player (2017) Bucks all-time leader in triple-doubles (14) 5-time Eastern Conference Player of the Month (March ’17, Oct./Nov. ’18, Dec. ’18, Feb. ’19, March/April ’19); 9-time Eastern Conference Player of the Week winner - Participated in the BBVA Rising Stars Challenge and Sprite Slam Dunk Contest during 2015 All-Star Weekend in New York, and the 2014 Rising Stars Challenge and the Taco Bell Skills Challenge during 2014 All-Star Weekend in New Orleans Named to the 2013-14 NBA All-Rookie Second Team\n\nPERSONAL LIFE\n\n2019 FIBA World Cup: Averaged 14.8 points, 8.8 rebounds and 2.4 assists in 5 games, leading Greece to the Second Round ... shot 52.5% from the field ... 2016 Olympic Qualifying: In 3 Olympic Qualifying games for Greece he averaged 15.3 points, 5.7 rebounds, 2.0 assists and a tournament-high 2.0 blocks per game ... 2014 FIBA World Cup: Averaged 6.3 points, 4.3 rebounds and 0.3 assists in 16.0 minutes for his native Greece ... posted highs of 15 points against Puerto Rico, and 6 rebounds against the Philippines and Argentina ... 2013 U20 European Championships: Played in 10 games for Greece’s U20 National Team and averaged 8.0 points, 7.6 rebounds and 2.2 assists ... ranked second for the tournament in defensive rebounds (7.0) and 7th in blocked shots (1.4) ... Greece finished the tournament in fifth place with an 8-2 record ... 2012-13: Played in 26 games for Filathlitikos AO (A2, second division) and averaged 9.5 points, 5.0 rebounds and 1.4 assists ... shot 62.1% from 2-point field goal range ... selected to play in the Greek League All-Star Game and scored 8 points ... grabbed a season-high 10 rebounds vs. GS Laviro on 2/23 ... posted a career-high 23 points vs. Irakleuo Crete on 3/2 ... had 13 points, 7 rebounds and a season-high 4 blocks vs. Ermis Lagkada on 4/13."
}
