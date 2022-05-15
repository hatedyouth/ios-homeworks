

import Foundation
import UIKit

public struct Post {
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}


public let post1 = Post(author: "Cercle du Cinema",
                        description: "Хлоя Севиньи и Стив Бушеми",
                        image: "chloe",
                        likes: 99,
                        views: 99)

public let post2 = Post(author: "Steel is real & Classic road bikes",
                        description: "#steelisreal",
                        image: "tahion",
                        likes: 66,
                        views: 66)

public let post3 = Post(author: "Искусство кино",
                        description: "Сегодня могло бы исполниться 75 лет Леониду Филатову (1946–2003).",
                        image: "filatov",
                        likes: 33,
                        views: 33)

public let post4 = Post(author: "на дальней станции сойду",
                        description: "Вот он какой — сиреневый туман",
                        image: "tuman",
                        likes: 11,
                        views: 11)

public var postArray = [post1,post2,post3,post4]
