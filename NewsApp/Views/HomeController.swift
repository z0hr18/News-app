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
    var items = [News]()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = realm.configuration.fileURL {
            print (url)
        }
      
    }
    

    @IBAction func searchTextfield(_ sender: UITextField) {
    }
    
}
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
   
    
}
