//
//  Parser.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/21/23.
//

import Foundation


class Parser {
    func parseJsonFile(completion: ([NewsModel]) -> Void) {
        if let file = Bundle.main.url(forResource: "Json", withExtension: "json"){
            do {
                let data = try Data(contentsOf: file)
                let items = try JSONDecoder().decode([NewsModel].self, from: data)
                completion(items)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

