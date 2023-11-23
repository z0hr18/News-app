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
    var allnEws = [NewsModel]()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
        if let url = realm.configuration.fileURL {
            print (url)
        }
    }
    
    @IBAction func searchTextfield(_ sender: UITextField) {
        //        let searchText = searchView.text ?? ""
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
}


extension HomeController {
    func fetchItems() {
        allNews.removeAll()
        let data = realm.objects(News.self)
        allNews.append(contentsOf: data)
        collection.reloadData()
    }
}
