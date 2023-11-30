//
//  CategoriesHeaderReusableView.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/23/23.
//

import UIKit
import RealmSwift

class CategoriesHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    
    let manager  = RealmManager()
    let realm = try! Realm()
    var categoryCounts = [String: Int]()
    var categorySelectedIndexPath: IndexPath?
    var didSelectCategoryCallback: ((String) -> Void)?
    
    func configure() {
        for newsCategory in Categories.allCases {
            let categoryNews = realm.objects(News.self).filter("newsCategory = %@", newsCategory.rawValue)
            categoryCounts[newsCategory.rawValue] = categoryNews.count
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.collection.reloadData()
        })
    }
}

extension CategoriesHeaderReusableView:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryCounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesHeaderCell", for: indexPath) as! CategoriesHeaderCell
        let category = Categories.allCases[indexPath.item]
        cell.headerLabel.text = category.rawValue
        
        if indexPath == categorySelectedIndexPath {
            // Apply selected appearance
            cell.selectedCell()
//            print( "Selected cell: \(cell)")
        } else {
            // Apply default appearance
            cell.unSelectedCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 30)
    }
}
