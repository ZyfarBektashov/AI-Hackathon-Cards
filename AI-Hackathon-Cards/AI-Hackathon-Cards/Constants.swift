//
//  Constants.swift
//  Cards
//
//  Created by Z on 14.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

struct Colors {
    static let blue = UIColor(hex: 0x0260DF)
}

struct Categories {
    
    struct Category {
        var name: String
        var image: String
    }

    static let list = [Category(name: "Адамдар", image: "family"),
                       Category(name: "Жаныбарлар", image: "animal"),
                       Category(name: "Мөмө-жемиштер", image: "friut"),
                       Category(name: "Жашылча-жемиштер", image: "vegatable")]
}

struct Cards {
    
    struct Card {
        var index: Int
        var name: String
    }
    static let listPerson = [Card(index: 0, name: "Кол"),
                             Card(index: 0, name: "Баш"),
                             Card(index: 0, name: "Бут"),
                             Card(index: 0, name: "Көз")]
    
    static let listAnimal = [Card(index: 1, name: "Ит"),
                             Card(index: 1, name: "Уй"),
                             Card(index: 1, name: "Мышык"),
                             Card(index: 1, name: "Пил")]
}

struct Ratings {
    
    struct Rating {
        var dislike: Int
        var like: Int
    }
    
    static let list = [Rating(dislike: 23, like: 142),
                       Rating(dislike: 51, like: 106),
                       Rating(dislike: 68, like: 65),
                       Rating(dislike: 100, like: 9),]
}


