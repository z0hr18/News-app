//
//  NewsDetails.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/20/23.
//

import Foundation
import RealmSwift

class NewsDetails: Object {
    @Persisted var newsDetailsImage: String?
    @Persisted var newsDetailsTitle: String?
    @Persisted var newsDetailsnews: String?
}
