//
//  News.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/11/23.
//

import Foundation
import RealmSwift

class News: Object {
    @Persisted var Title: String?
    @Persisted var Description: String?
    @Persisted var Image: String?
    @Persisted var newsCategory: String = Categories.allNews.rawValue
}

enum Categories: String, CaseIterable, PersistableEnum {
    case allNews = "All News"
    case business = "Business"
    case politics = "Politics"
    case tech = "Tech"
    case healthy = "Healthy"
}


class NewsDetails: Object {
    @Persisted var newsDetailsImage: String?
    @Persisted var newsDetailsTitle: String?
    @Persisted var newsDetailsnews: String?
}

class User: Object{
    @Persisted var name: String?
    @Persisted var email: String?
    @Persisted var password: String?
}

//let allCategories = Categories.allCases
