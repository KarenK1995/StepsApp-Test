//
//  InfoCollectionViewCell.swift
//  StepsApp-Test
//
//  Created by Karen Karapetyan on 1/4/19.
//  Copyright © 2019 Karen Karapetyan. All rights reserved.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
        
    var statsItem: StatsItem? {
        didSet {
            guard let statsItem = statsItem else { return }
            imageView.image = UIImage(named: statsItem.imageName)
            titleLabel.text = statsItem.title
            descriptionLabel.text = statsItem.description
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
