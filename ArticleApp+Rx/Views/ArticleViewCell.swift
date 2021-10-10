//
//  ArticleViewCell.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/09.
//

import UIKit
import Alamofire

class ArticleViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let cellHeight: CGFloat = 80.0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //MARK: - Helpers
    
    func configureCell(_ model: Article) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        guard let url =
        thumbnailImageView.image = UIImage(systemName: "pencil.and.outline")
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.contentMode = .scaleAspectFill
    }
}
