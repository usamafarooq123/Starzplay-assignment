//
//  SeasonDetailsHeaderCell.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import UIKit
import Kingfisher

protocol playVideoDelegate: AnyObject {
    func playVideo()
}

class SeasonDetailsHeaderCell: UITableViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var seasonName: UILabel!
    @IBOutlet weak var seasonDetails: UILabel!
    @IBOutlet weak var seasonDescription: UILabel!
    weak var delegate: playVideoDelegate!

    @IBAction func didTapPlay(_ sender: Any) {
        delegate?.playVideo()
    }
    
}

extension SeasonDetailsHeaderCell: CellConfigureType {
    
    func configureCell(with data: CellIdentifierType, delegate: playVideoDelegate) {
        guard let data = data as? SeasonDetailsHeaderCellModel else { return }
        self.delegate = delegate
        self.bannerImage.kf.setImage(with: data.bannerImage, placeholder: UIImage.placeholderImage)
        self.seasonName.text = data.seasonName
        self.seasonDetails.text = data.seasonDetails
        self.seasonDescription.text = data.seasonDescription
    }
    
}
