//
//  User.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/11/23.
//

import Foundation
import RealmSwift

class User: Object{
    @Persisted var name: String?
    @Persisted var email: String?
    @Persisted var password: String?
}
