//
//  RealmManager.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/23/23.
//

import Foundation
import RealmSwift

class RealmManager {
    let realm = try! Realm()
    func getFilePath() {
        if let url = realm.configuration.fileURL {
            print(url)
        }
    }
    
}
