//
//  SeaonsCell.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import UIKit

class SeasonsCell: UICollectionViewCell {

    @IBOutlet weak var seasonTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with title: String, isSelected: Bool) {
        seasonTitle.text = title
        
        seasonTitle.textColor = isSelected ? .blue : .black
    }

}
