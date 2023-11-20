//
//  News.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/11/23.
//

import Foundation
import RealmSwift

class News: Object {
    @Persisted var newsTitle: String?
    @Persisted var newsDescription: String?
    @Persisted var newsImage: String?
    @Persisted var newsDetail: String?
    @Persisted var newsCategory: Categories?
    
}
enum Categories: String, CaseIterable, PersistableEnum  {
//    case allNews = "All News"?
    case business = "Business"
    case policits = "Politics"
    case tech = "Tech"
    case healthy = "Healthy"
}

//let allCategories = Categories.allCases
