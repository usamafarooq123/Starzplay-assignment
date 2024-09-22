//
//  EpisodeCell.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import UIKit
import Kingfisher

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(thumbnailUrl: URL,  episodeTitle: String) {
        
        episodeImageView.kf.setImage(with: thumbnailUrl, placeholder: UIImage.placeholderImage)
        episodeLabel.text = episodeTitle
        
    }
    
}
