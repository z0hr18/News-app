//
//  HomeController.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/20/23.
//

import UIKit
import RealmSwift

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    
    var allNews = [News]()
    var backupNews =  [News]()
    var allnEws = [NewsModel]()
    let realm = try! Realm()
    var searching = false
    var newsItem = [News]()
    var didSelectCategoryCallback: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
        
        if let url = realm.configuration.fileURL {
            print (url)
        }
        backupNews = allNews
        
        //        collection.register(CategoriesHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CategoriesHeaderCell")
        //
        //        collection.register(CategoriesHeaderReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CategoriesHeaderReusableView")
        collection.register(CategoriesHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CategoriesHeaderReusableView")
        
        
    }
    
    @IBAction func searchTextfield(_ sender: UITextField) {
        if let searchText = sender.text, !searchText.isEmpty {
            searching = true
            allNews = allNews.filter { news in
                if let news = news.Title {
                    return news.lowercased().contains(searchText.lowercased())
                }
                return false
            }
        } else {
            searching = false
            allNews.removeAll()
            allNews = backupNews
        }
        collection.reloadData()
    }
}


extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllNewsCell", for: indexPath) as! AllNewsCell
        cell.titleLabel.text = allNews[indexPath.item].Title
        cell.descriptionLabel.text = allNews[indexPath.item].Description
        cell.newsImage.image = UIImage(named: allNews[indexPath.item].Image ?? "")
        cell.tag = indexPath.item
        //                cell.delegate = self
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    
    // Header configuration
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //        let headerr = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CategoriesHeaderReusableView.self)", for: indexPath) as! CategoriesHeaderReusableView
        //
        //        let headerr = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoriesHeaderReusableView", for: indexPath) as! CategoriesHeaderReusableView
        
        print("CategoriesHeaderReusableView Oluşturuluyor")
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoriesHeaderReusableView", for: indexPath) as! CategoriesHeaderReusableView
        header.configure()        
        header.backgroundColor = .red
        header.didSelectCategoryCallback = { newsCategory in
            let filteredNews = self.allNews.filter { $0.newsCategory == newsCategory }
            self.allNews = filteredNews
            self.collection.reloadData()
        }
        
        return header
    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    //        let headerr = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CategoriesHeaderReusableView.self)", for: indexPath) as! CategoriesHeaderReusableView
    //        headerr.didSelectCategoryCallback = { category in
    //            let filteredNews = self.newsItem.filter {$0.category == category}
    //            self.newsItem = filteredNews
    //            self.collection.reloadData()
    //        }
    //        return headerr
    //    }
    
}


extension HomeController {
    func fetchItems() {
        allNews.removeAll()
        let data = realm.objects(News.self)
        allNews.append(contentsOf: data)
        collection.reloadData()
        
        
    }
    
    
}

