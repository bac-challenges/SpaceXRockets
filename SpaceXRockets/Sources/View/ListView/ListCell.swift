//
//  ListCell.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit

class ListCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(_ item: RocketViewItem) {
        photoView.layer.borderColor = UIColor.successRate(item.data.successRate).cgColor
        photoView.layer.borderWidth = 2
        photoView.layer.cornerRadius = photoView.frame.size.width / 2
        photoView.image = item.image
        
        nameLabel.text = item.data.name
        dateLabel.text = item.data.date
    }
}
