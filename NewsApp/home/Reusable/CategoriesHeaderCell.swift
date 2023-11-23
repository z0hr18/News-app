//
//  CategoriesHeaderCell.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/23/23.
//

import UIKit

class CategoriesHeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    
    func setCell(headerLabel:String){
        self.headerLabel.text = headerLabel
    }
    
    func selectedCell() {
        headerLabel.textColor = .red
    }
    
    func unSelectedCell() {
        self.headerLabel.textColor = UIColor.black
    }
    
}
